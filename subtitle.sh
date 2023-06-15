#!/bin/bash
#info output
if [ -z "$3" ]
  then
	  echo "usage: ./subtitle.sh video.mkv transcribe{transcribe,translate} en{af,am,ar,as,az,ba,be,bg,bn,bo,br,bs,ca,cs,cy,da,de,el,en,es,et,eu,fa,fi,fo,fr,gl,gu,ha,haw,he,hi,hr,ht,hu,hy,id,is,it,ja,jw,ka,kk,km,kn,ko,la,lb,ln,lo,lt,lv,mg,mi,mk,ml,mn,mr,ms,mt,my,ne,nl,nn,no,oc,pa,pl,ps,pt,ro,ru,sa,sd,si,sk,sl,sn,so,sq,sr,su,sv,sw,ta,te,tg,th,tk,tl,tr,tt,uk,ur,uz,vi,yi,yo,zh}"
      exit 1
fi


#extract audio
ffmpeg -i "$1" -q:a 0 -map a "$3".mp3
#get transcription
whisper "$3".mp3 --compression_ratio_threshold 0.9 -o . --language  "$3" --task "$2"
#cleanup uneeded files
rm "$3".mp3 "$3".txt "$3".vtt "$3".tsv "$3".json
