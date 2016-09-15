#!/usr/bin/env python
import sys
import base64
import transmissionrpc

tc = transmissionrpc.Client('127.0.0.1', port=9091 , user='feilong',password='zhebushimima:)')
print sys.argv[1]
torrent = open(sys.argv[1], 'rb').read()
torrb64 = base64.b64encode(torrent)

tc.add_torrent(torrb64)
#print torrb64

