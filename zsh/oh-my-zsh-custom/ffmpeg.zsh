transcode () {
    local inputfile=$1
    nice -10 ffmpeg -i $inputfile -map 0:0 -map 0:1 -codec:v libx264 -profile:v high -preset fast -b:v 10000k -vf scale=-1:800 -acodec aac -b:a 128k -strict -2 ${inputfile%.*}_small.mp4
}
