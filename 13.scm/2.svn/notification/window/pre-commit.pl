use Encode;
use Encode::Guess;

$repos = $ARGV[0];
$txn = $ARGV[1];
$comment = `svnlook log -t "$txn" "$repos"`;
$comment = decode("cp949", $comment);

chomp($comment);

# $alarm_no_commit=<<EOT;
# ---------------------------------------------------------------------------
# 로그 메시지를 포함하지 않았기 때문에 커밋이 차단되었습니다.
# 이번에는 변경 사항을 설명하는 로그 메시지와 함께 커밋을 다시 수행해주세요.
# ---------------------------------------------------------------------------
# EOT
# $alarm_no_commit1 = encode("euc-kr", decode("utf-8", "$alarm_no_commit\n"));

$alarm_no_commit=<<EOT;
---------------------------------------------------------------------------
"ERROR : Please Input Your commit message"
---------------------------------------------------------------------------
EOT

if ( length($comment) == 0 ) {
  print STDERR $alarm_no_commit;
  exit(1);
}

# ## check Jira issue keys
# $ret = 1;
# $pattern =  qr/[A-Z]{2,}-[0-9]{1,}/;
# $ret = 0 if $comment =~ $pattern;
# if ($ret == 1) {
#   print STDERR "---------------------------------------------------------------------------\n";
#   print STDERR "Comment must match JIRA-ISSUE-KEY!!! \"$comment\"\n";
#   print STDERR "---------------------------------------------------------------------------\n";
# }
# exit($ret);
