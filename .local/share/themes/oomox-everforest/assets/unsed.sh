#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#2D353B/g' \
         -e 's/rgb(100%,100%,100%)/#D3C6AA/g' \
    -e 's/rgb(50%,0%,0%)/#232A2E/g' \
     -e 's/rgb(0%,50%,0%)/#A7C080/g' \
 -e 's/rgb(0%,50.196078%,0%)/#A7C080/g' \
     -e 's/rgb(50%,0%,50%)/#343F44/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#343F44/g' \
     -e 's/rgb(0%,0%,50%)/#D3C6AA/g' \
	"$@"
