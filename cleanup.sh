# Where the videos will be saved
BASEpath='{{video_record_home_dir}}'
RECpath=$BASEpath'/video'
usep=$(df /| grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $4 " " $1 }'| awk '{ print $1}' | cut -d'%' -f1)
DISK_SPACE_BUFFER=700000

echo $usep
while [ $usep -le $DISK_SPACE_BUFFER ]
do
    usep=$(df /| grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $4 " " $1 }'| awk '{ print $1}' | cut -d'%' -f1)
    if [ $usep -le $DISK_SPACE_BUFFER ]; then
      ls -rt  $RECpath'/'|head -n 1|awk -vpath=$RECpath'/' '{print path$1}'
      ls -rt  $RECpath'/'|head -n 1|awk -vpath=$RECpath'/' '{print path$1}'|xargs rm
      echo "Running out of space removed 1 most old files."
    fi
done
