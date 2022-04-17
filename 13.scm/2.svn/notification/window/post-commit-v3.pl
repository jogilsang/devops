#!perl

# Copyright 2021 jogilsang
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# modifyed : 
# 2021-03-28 v2 : (1) incommig webhook 사용 (Subversion 플러그인 미사용)
#                 (2) U,A,D $
#                 (3) commit 시간 추가 (svnlook date -r [revision] [path])
#                 (4) branch 별도분리 표기 및 path이력에서 제거
#                 (5) 단일 repo 

use warnings;
use strict;

use HTTP::Request::Common qw(POST);
use HTTP::Status qw(is_client_error);
use LWP::UserAgent;
use JSON;

# 한글 사용을 위해 추가
use Encode;
use Encode::Guess;

# [0] path to repo
# [1] revision committed

print $ARGV[0];
print $ARGV[1];

# Perl 코드가 UTF-8 형식으로 저장되어있다면
# cp949 형식으로 decoding이 필요. 한글이 깨짐
my $log = `svnlook log -r $ARGV[1] $ARGV[0]`; 
$log = decode("cp949", $log);

# $files : added, modifyed, deleted 파일들
# cp949 형식으로 decoding이 필요. 한글이 깨짐
my $files = `svnlook changed -r $ARGV[1] $ARGV[0]`;
$files = decode("cp949", $files);

my $who = `svnlook author -r $ARGV[1] $ARGV[0]`;
my $date = `svnlook date -r $ARGV[1] $ARGV[0]`;
chomp $who;

my $revision = "$ARGV[1]";

my $svn_date = "$date";
my $svn_revision = $revision;
my $svn_author = $who;
my $svn_message = $log;
my $svn_branch = '';
my $svn_url = "https://******"; 
my $svn_changes = $files;

# 브런치 값을 추출한다.
if( $svn_changes =~ /branches[\/](.*?)[\/]/) {
  $svn_branch = $1;
}
else {
  $svn_branch = "not branch, maybe trunk";
}

# 커밋시간 값을 추출한다.
if( $svn_date =~ /(.*?)[+]/){
  $svn_date = $1;
}
else{
  $svn_date = "not ko-time(GMT+9), Please Check Server";
}

# sample data
# A   branches/backend-server/api/asdfdasfasdf.txt
# U   branches/backend-server/api/gwegweweg.txt
# D   branches/backend-server/api/wewewewef.txt

# 브런치 값을 제거한다. (브런치 값이 2개이상이면, pre-commit에서 error)
$svn_changes =~ s/branches[\/](.*?)[\/]//g;

# result
# A   backend-server/asdfdasfasdf.txt
# U   backend-server/gwegweweg.txt
# D   backend-server/wewewewef.txt

# 공백을 세칸에서 한칸으로 줄인다.
$svn_changes =~ s/   / /g;

# result
# A backend-server/asdfdasfasdf.txt
# U backend-server/gwegweweg.txt
# D backend-server/wewewewef.txt

my @arr_U_files;
my @arr_A_files;
my @arr_D_files;

# 줄바꿈(LF)로 split한다.
my @cats = split /\n/, $svn_changes;
my $lastindex = $#cats;

# split한 배열을 반복한다., 첫글자(U,A,D)로 변경이력 확인 
for(my $i=0 ; $i < $lastindex+1 ; $i=$i+1) {

    if($cats[$i] =~ /^[U]/) {
        push(@arr_U_files ,$cats[$i]);
    }
    elsif($cats[$i] =~ /^[A]/) {
        push(@arr_A_files ,$cats[$i]);
    }
    elsif($cats[$i] =~ /^[D]/) {
        push(@arr_D_files ,$cats[$i]);
    }    
}

# payload의 Request Form
my $payload = {
	"attachments"=> [
		{
      "color" => "#2EB886",
			"blocks"=> [
				{
					"type"=> "section",
					"text"=> {
						"type"=> "mrkdwn",
						"text"=> "*$svn_author*"." - ".$svn_message
					}
				},
        {
					"type"=> "divider"
				},
				{
					"type"=> "section",
					"text"=> {
						"type"=> "mrkdwn",
						"text"=> "*Branch :* ${svn_branch}\n*Revision :* ${svn_revision}\n*Date :* ${svn_date}"
					}
				},
				{
					"type"=> "divider"
				}
			]
		}
	]
};

# 변경이력(U,A,D) 개수를 확인 후, 개행문자을 포함해서 문자열을 생성한다.
if($#arr_U_files+1 > 0) {
    my $changed_U_files = join "\n", @arr_U_files ;
    my $num_U_files = $#arr_U_files + 1;

    # payload에 추가한다.
    my $section_u = {
      "type"=> "section",
      "text"=> {
          "type"=> "mrkdwn",
          "text"=> "*Modifyed :* ${num_U_files}\n```$changed_U_files```"
       }
    };
  
    push @{$payload -> {"attachments"} -> [0] -> {"blocks"}}, $section_u;
}

if($#arr_A_files+1 > 0) {
    my $changed_A_files = join "\n", @arr_A_files ;
    my $num_A_files = $#arr_A_files + 1;

    # payload에 추가한다.
    my $section_a = {
      "type"=> "section",
      "text"=> {
          "type"=> "mrkdwn",
          "text"=> "*Added :* ${num_A_files}\n```$changed_A_files```"
      }
    };
  
    push @{$payload -> {"attachments"} -> [0] -> {"blocks"}}, $section_a;
}

if($#arr_D_files+1 > 0) {
    my $changed_D_files = join "\n", @arr_D_files ;
    my $num_D_files = $#arr_D_files + 1;

    # payload에 추가한다.
    my $section_d = {
      "type"=> "section",
      "text"=> {
          "type"=> "mrkdwn",
          "text"=> "*Deleted :* ${num_D_files}\n```$changed_D_files```"
      }
    };
  
    push @{$payload -> {"attachments"} -> [0] -> {"blocks"}}, $section_d;
}

# CASE 1 : 단일 repository로 알람생성
# TODO : 인커밍 웹훅 주소넣기

my $ua = LWP::UserAgent->new;
$ua->timeout(15);

my $slack_url = "https://hooks.slack.com/services/....";
my $req = POST( "$slack_url", ['payload' => encode_json($payload)] );

my $s = $req->as_string;
print STDERR "Request:\n$s\n";

my $resp = $ua->request($req);
$s = $resp->as_string;
print STDERR "Response:\n$s\n";

# CASE 2 : repository가 여러개여서, 알람을 따로따로 받아야하는경우
# my $repo1 = 'api';
# my $repo2 = 'mobile';
# my $repo3 = 'web';

# my $slack_url_repo1 = "https://hooks.slack.com/services/....";
# my $slack_url_repo2 = "https://hooks.slack.com/services/....";
# my $slack_url_repo3 = "https://hooks.slack.com/services/....";

# my @arr = ($repo1, $repo2, $repo3);
# my @arr_url = ($slack_url_repo1, $slack_url_repo3);

# my $ua = LWP::UserAgent->new;
# $ua->timeout(15);

# # repository 검색시작
# foreach my $index ( 0 .. $#arr ) {
  
#   # repo 경로가 조건값
#   my $condition = $arr[$index];

#   # 만약 repo 경로가, 전체경로에 포함되어있다면
#   if(index($svn_changes, $condition) > 0) {

#     my $target_url = $arr_url[$index];
#     my $req = POST( "$target_url", ['payload' => encode_json($payload)] );

#     my $s = $req->as_string;
#     print STDERR "Request:\n$s\n";

#     my $resp = $ua->request($req);
#     $s = $resp->as_string;
#     print STDERR "Response:\n$s\n";

#     last; # break;

#   }else {

#   }

# }
