#!/usr/bin/env fish
#echo $argv[1] $argv[2]
set user $argv[1]
set pass $argv[2]

wget -qO- 'http://www.ourob.cn/bbs/member.php?mod=logging&action=login&loginsubmit=yes&frommessage&loginhash=LI0V5&inajax=1' --save-cookies ob.cookies --post-data 'formhash=0a674fed&referer=http%3A%2F%2Fwww.ourob.cn%2Fbbs%2Fforum.php%3Fmod%3Dforumdisplay%26fid%3D97%26page%3D1%26mobile%3Dno&loginfield=username&username='$user'&password='$pass'&questionid=0&answer=&loginsubmit=true' --keep-session-cookies >/dev/null


