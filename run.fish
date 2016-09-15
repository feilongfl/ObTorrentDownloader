#!/usr/bin/env fish

set user feilong
set pass zhebushimima
set fid 97
set tempfile temp.htm
set labels A动画新番 剧场版

./oblogin.fish $user $pass
wget -qO $tempfile 'http://www.ourob.cn/bbs/forum.php?mod=forumdisplay&fid='$fid --load-cookies ob.cookies --keep-session-cookies

function checkDownload
	set r 0
    for file in $labels
        if test $file = $argv 
            set r 1
        end
    end
    echo $r
end

for l in (./obana.py $tempfile );
    echo $l;
    set id (echo $l | grep -oE '[0-9]+' | head -n 1)
    if not test -f $id.torrent;
        echo file not found;
        if [ (checkDownload (echo $l | sed -r 's/(.*)\t(.*)\t(.*)\t(.*)/\2/' | tr -d ' ') ) = 1 ]
        	echo file will download
        	wget -qO $id.torrent --keep-session-cookies --load-cookies ob.cookies 'http://www.ourob.cn/bbs/plugin.php?id=sikemi:download&tid='$id
        	./addtorrent.py $id.torrent
        else
            echo file type not in list
        end
    else;
        echo file exist;
    end;
end

