#!perl

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

# [0] path to repo
# [1] revision committed

print $ARGV[0];
print $ARGV[1];

# TODO - JIRA
my $id = "";
my $pw = "";
my $jira_domain = "https://...";
# EX : https://jira.atlassian.com
my $jira_project_key = ""; 
# EX : https://jira.atlassian.com/browse/CONFCLOUD-65204 -> CONFCLOUD

# TODO - SVN
my $diff = `chcp 65001 && svnlook diff -r $ARGV[1] $ARGV[0] --no-diff-added --no-diff-deleted`;
print STDOUT $diff;

if(length $diff) {

    # Commit message에 대한 한글 UTF-8 이슈를 제거
    my $log = `chcp 65001 && svnlook log -r $ARGV[1] $ARGV[0]`;

    # 이슈제거 후, 부가적으로 붙게되는 Active code page: 65001 문구제거
    my @cats = split /\n/, $log;
    my $firstData = shift(@cats);
    $log = join "\n", @cats;

    # Commit이 된 Revision 값과 Commit을 수행한 사람
    my $who = `svnlook author -r $ARGV[1] $ARGV[0]`;
    chomp $who;
    my $revision = "$ARGV[1]";

    # Binding
    my $svn_log = $log;
    my $svn_revision = $revision;
    my $svn_author = $who;
    my $svn_diff = $diff;

     # 상단에 지정한 특정 JIRA KEY를 조회한다.
     # 특정 JIRA KEY를 고정하지않을경우 정규표현식 사용요망
        if($svn_log =~ /$jira_project_key-[0-9]{1,}/) {
            my $jira_key = $&;     
            print STDERR "$jira_key\n";

    my $ua_2 = LWP::UserAgent->new;
    $ua_2->timeout(15);

    my $url_2 = "$jira_domain"."/rest/api/2/issue/";
    my $method_2 = "/comment";

# Example : Comment Form
# (/) [~jogilsang] - Revision [246]
# {quote}#GILSANG-15248 변경이력 자동화 개발완료{quote}

my $body_2 =<<EOF;
(/) [~$svn_author] - Revision [$svn_revision]
{quote}
$svn_log
{quote}

{code:java}
$svn_diff
{code}
EOF

my $contents_2 = {
    "body" => $body_2
};

print $contents_2."\n";

    my $req_2 = POST( "$url_2"."$jira_key"."$method_2");
    $req_2->content_type('application/json');
    $req_2->authorization_basic($id, $pw);
    $req_2->content(encode_json($contents_2));

    my $s_2 = $req_2->as_string;
    print STDERR "Request:\n $s_2\n";

    my $res_2 = $ua_2->request($req_2);
    $s_2 = $res_2->as_string;
    print STDERR "Response:\$ $s_2\n";
