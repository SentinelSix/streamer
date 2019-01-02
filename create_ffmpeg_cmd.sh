#!/bin/sh

OUTPUT_PATH=/tmp/stream/

INPUT=$1
OUTPUT=$2

FFMPEG_CMD="ffmpeg -reconnect 1 -reconnect_at_eof 1 -reconnect_streamed 1 -reconnect_delay_max 300 -loglevel panic -nostdin -rtsp_transport tcp -i ${INPUT} -f lavfi -i aevalsrc=0 -acodec aac -vcodec copy -hls_list_size 2 -hls_init_time 1 -hls_time 1 -hls_flags delete_segments ${OUTPUT_PATH}${OUTPUT}.m3u8"
echo "${FFMPEG_CMD}"