#!perl

# Copyright 2021 jo_gilsang
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

#!perl

# EXEC
# chcp 65001 && svnlook diff -r 210 D:\project\svn\test --no-diff-added --no-diff-deleted 

# created : v1, 2021-04-08
# 1. 한글파일명에 업데이트 시, ERROR 발생
# 2. 한글 메세지가 포함된 svnlook log와 병행사용불가
# 3. 대상은 UTF-8 파일 사용권장 
# modifyed : v2 , 2021-04-08
#               1. 채널분류 추가
#            v3, 2021-04-08
#               1. 에러 시 로그파일추가
#            v4, 2021-04-09
#               1. cp949 추가
#            v5, 2021-04-09
#               1. svnlook changed 제거
#            v6, 2021-04-13
#               1. chcp 65001 (UTF-8) diff 적용완료

use utf8;      # so literals and identifiers can be in UTF-8
use v5.12;     # or later to get "unicode_strings" feature
use strict;    # quote strings, declare variables
use warnings;  # on by default
use warnings  qw(FATAL utf8);    # fatalize encoding glitches
use open      qw(:std :encoding(UTF-8)); # undeclared streams in UTF-8
use charnames qw(:full :short);  # unneeded in v5.16
use Encode qw(decode);

use HTTP::Request::Common qw(POST);
use HTTP::Status qw(is_client_error);
use LWP::UserAgent;
use JSON;

# END { close STDOUT }

# [0] path to repo
# [1] revision committed

print $ARGV[0];
print $ARGV[1];

my $diff = `chcp 65001 && svnlook diff -r $ARGV[1] $ARGV[0] --no-diff-added --no-diff-deleted`;

print STDOUT $diff;

if(length $diff) {

    # Origin
    # Active code page: 949 deleted
    my $log = `chcp 65001 && svnlook log -r $ARGV[1] $ARGV[0]`;
    my @cats = split /\n/, $log;
    my $firstData = shift(@cats);
    $log = join "\n", @cats;

    my $who = `svnlook author -r $ARGV[1] $ARGV[0]`;
    chomp $who;
    my $revision = "$ARGV[1]";

    # Binding
    my $svn_log = $log;
    my $svn_revision = $revision;
    my $svn_author = $who;
    my $svn_diff = $diff;

    # code-snippet-Notification
    # TODO
    my $slack_channels = "";
    my @arr_slack_channels = ($slack_channels);

    my $slack_filename = " [".$svn_revision."]".'_'.$svn_author;
    my $slack_filetype = "diff";
    my $slack_initial_comment = ":raised_hands: ".$svn_author." [".$svn_revision."]";
    my $slack_title = " [".$svn_revision."]".'_'.$svn_author;

    my $target_url = $arr_slack_channels[$index];
    SlackAPI_files_upload($target_url, $svn_diff, $slack_filename,$slack_filetype, $slack_initial_comment,$slack_title);
    
    last; # break;

}

# description : https://blog.naver.com/jogilsang/222297392891
sub SlackAPI_files_upload {

  # param
  my $slack_token = 'xoxb-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';

  # Token (Required)
  # $_[0] -> channels (Optional)
  # $_[1] -> content (Optional)
  # $_[2] -> filename (Optional) 
  # $_[3] -> filetype (Optional)
  # $_[4] -> initial_comment (Optional)
  # $_[5] -> title (Optional)

    if(!$_[0]) {
        print STDERR `ERROR : SlackAPI_files_upload Method, channel needed $_[1]`;
        exit(1);
    }

    if(!$_[1]) {
        print STDERR `ERROR : SlackAPI_files_upload Method, contents needed $_[2]`;
        exit(1);
    }

    if(!$_[2]) {
        print STDERR `ERROR : SlackAPI_files_upload Method, filename needed $_[3]`;
        exit(1);
    }

    if(!$_[3]) {
        print STDERR `ERROR : SlackAPI_files_upload Method, filetype needed $_[4]`;
        exit(1);
    }

    if(!$_[4]) {
        print STDERR `ERROR : SlackAPI_files_upload Method, initial_comment needed $_[5]`;
        exit(1);
    }

    if(!$_[5]) {
        print STDERR `ERROR : SlackAPI_files_upload Method, title needed $_[6]`;
        exit(1);
    }

    my $ua = LWP::UserAgent->new;
    $ua->timeout(15);

    my $body = [
      channels=> "$_[0]", 
      content=> "$_[1]",
      filename=> "$_[2]".".diff", 
      filetype=> "$_[3]", 
      initial_comment=> "$_[4]", 
      title=> "$_[5]".".diff", 
    ];
    my $url = "https://slack.com/api/files.upload";
    my $req = POST $url, $body ;

    $req->content_type('application/x-www-form-urlencoded');
    $req->authorization('Bearer '.$slack_token);

    my $s = $req->as_string;
    print STDERR "Request:\n$s\n";

    my $res = $ua->request($req);
    $s = $res->as_string;
    print STDERR "Response:\n$s\n";

}

# source : http://www.perl.or.kr/tipsinaction/control_flow/warn2log
BEGIN {
	$SIG{'__WARN__'} = sub {
		my($sec,$min,$hour,$mday,$mon,$year,$wday) = localtime();

        # TODO : 로그파일경로 지정
	      my $path = "D:\/project\/svn\/test\/hooks\/log\/";
        my $logfile = $path."svn.$wday.log";

		if( (-M $logfile) > 3 ) {
			unlink($logfile);
		}

		if(open(LOG,">>$logfile")) {
			# 날짜, process id와 함께 기록한다.
			print LOG "$$ : ", scalar(localtime()), " ", @_;
			print LOG "$$ : ", scalar(localtime()), " ", $diff;
			close LOG;
		}
		warn @_; # 필요없다면 빼줍니다.
		# 재귀적으로 핸들러를 호출하지 않으므로 걱정마세요.
	};
}
