#!perl
# svn in window

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

# Origin
my $log = `svnlook log -r $ARGV[1] $ARGV[0]`; 
$log = decode("cp949", $log); # cp949 형식으로 decoding이 필요. 한글이 깨짐

my $files = `svnlook changed -r $ARGV[1] $ARGV[0]`; # added, modifyed, deleted 파일들
$files = decode("cp949", $files); # cp949 형식으로 decoding이 필요. 한글이 깨짐

my $who = `svnlook author -r $ARGV[1] $ARGV[0]`;
chomp $who;
my $date = `svnlook date -r $ARGV[1] $ARGV[0]`;
my $revision = "$ARGV[1]";

# Binding
my $svn_date = "$date";
my $svn_revision = $revision;
my $svn_author = $who;
my $svn_message = $log;
my $svn_branch = '';
my $svn_changes = $files;

# TODO : 브런치 값을 추출한다. trunk를 사용하지않기때문에, trunk를 사용한다면 별도로 로직추가필요
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
# A   branches/dev/asdfdasfasdf.txt
# U   branches/dev/gwegweweg.txt
# D   branches/dev/wewewewef.txt

# 브런치 값을 제거한다. (브런치 값이 2개이상이면, pre-commit에서 error 작업필요)
$svn_changes =~ s/branches[\/](.*?)[\/]//g;

# result
# A   asdfdasfasdf.txt
# U   gwegweweg.txt
# D   wewewewef.txt

# 공백을 세칸에서 한칸으로 줄인다. (정규표현식 = \s)
$svn_changes =~ s/   / /g;

# result
# A asdfdasfasdf.txt
# U gwegweweg.txt
# D wewewewef.txt

my @arr_U_files;
my @arr_A_files;
my @arr_D_files;

# 줄바꿈(LF)로 split한다.
my @cats = split /\n/, $svn_changes;
my $lastindex = $#cats;

# split한 배열을 돌려서, 첫글자로 변경이력 확인 
for(my $i=0 ; $i < $lastindex+1 ; $i=$i+1) {

    my $value = $cats[$i];

    if($value =~ /^[U]/) {
        $value =~ s/^[U] //g;
        push(@arr_U_files ,$value);
    }
    elsif($value =~ /^[A]/) {
        $value =~ s/^[A] //g;
        push(@arr_A_files ,$value);
    }
    elsif($value =~ /^[D]/) {
        $value =~ s/^[D] //g;
        push(@arr_D_files ,$value);
    }    
}

# HTTP POST Request
my $ua = LWP::UserAgent->new;
$ua->timeout(15);

# HTTP POST Request - Header
# TODO : incomming webhook 주소넣기
my $slack_url = "https://hooks.slack.com/services/..../.../....";
my $target_url = $slack_url;

# HTTP POST Request - BODY
# Slack 사이트에서 미리 커스터마이징 가능
my $payload = {
      "text"=> "$svn_author"."\n".$svn_message,
			"blocks"=> [
        {
          "type" => "context",
          "elements" => [
            {
              "type" => "mrkdwn",
              "text"=> ":wave: *<$jira_author_url|$svn_author>*"."\n"."$svn_message"
            }
          ]
        },
				{
					"type"=> "divider"
				},
        {
          "type" => "context",
          "elements" => [
            {
              "type" => "plain_text",
              "text"=> "Branch : ${svn_branch}\nRevision : ${svn_revision}\nDate : ${svn_date}"
            }
          ]
        },
				{
					"type"=> "divider"
				}
			]
};

# 변경이력(U,A,D) 개수를 확인 후, 개행문자을 포함해서 문자열을 생성한다. (함수로 정리가좀필요)
if($#arr_U_files+1 > 0) {
    my $changed_U_files = join "\n\n", @arr_U_files ;
    $changed_U_files = "\n".$changed_U_files."\n";
    my $num_U_files = $#arr_U_files + 1;

    # payload에 추가한다.
    my $section_u = {
			"type"=> "context",
			"elements"=> [
				{
					"type" => "mrkdwn",
	        "text"=> "U : ${num_U_files}\n```$changed_U_files```"
				}
			]
    };
  
    push @{$payload -> {"blocks"}}, $section_u;
}

if($#arr_A_files+1 > 0) {
    my $changed_A_files = join "\n\n", @arr_A_files ;
    $changed_A_files = "\n".$changed_A_files."\n";
    my $num_A_files = $#arr_A_files + 1;

    # payload에 추가한다.
    my $section_a = {
			"type"=> "context",
			"elements"=> [
				{
					"type"=> "mrkdwn",
	        "text"=> "A : ${num_A_files}\n```$changed_A_files```"
				}
			]
    };
  
    push @{$payload -> {"blocks"}}, $section_a;
}

if($#arr_D_files+1 > 0) {
    my $changed_D_files = join "\n\n", @arr_D_files ;
    $changed_D_files = "\n".$changed_D_files."\n";
    my $num_D_files = $#arr_D_files + 1;

    # payload에 추가한다.
    my $section_d = {
			"type"=> "context",
			"elements"=> [
				{
					"type"=> "mrkdwn",
	        "text"=> "D : ${num_D_files}\n```$changed_D_files```"
				}
			]
    };
  
    push @{$payload -> {"blocks"}}, $section_d;
}

# HTTP POST Request - Send
my $req = POST( "$target_url", ['payload' => encode_json($payload)] );
my $s = $req->as_string;
print STDERR "Request:\n$s\n";

# HTTP POST Response - Accept
my $resp = $ua->request($req);
$s = $resp->as_string;
print STDERR "Response:\n$s\n";
