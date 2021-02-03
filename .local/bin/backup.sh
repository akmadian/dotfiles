archivename=$(printf "backup-descartes_%s.tgz" "$(date "+%c")" | tr -s '[:blank:]' '-')
echo "Creating archive of home dir to $archivename.."

read -p "Are you sure you want to proceed (y/N)?" choice
case "$choice" in
  y|Y) :;;
  n|N) exit 0;;
  * ) echo "Invalid choice, aborting."
esac

savearchiveto="/tmp/$archivename"
echo "Compressing.."
tar --exclude="*/.mozilla/*"\
  --exclude="*/.cache/*"\
  --exclude="*/node_modules/*"\
  --exclude="*/.npm/*"\
  --exclude="*/Downloads/*"\
  --exclude="*.nohup.out"\
  --exclude="/home/ari/.vim/plugged/*"\
  --exclude="/home/ari/.config/coc/extensions/*"\
  --exclude="/home/ari/.config/google-chrome/*" -zcvf $savearchiveto ~
echo "Done."

sudo mount 192.168.0.6:/nfs/backup /mnt/descartes/backup
echo "NAS Mounted."
echo "rsyncing backup to NAS.."
rsync -rv /tmp/*.tgz /mnt/descartes/backup/
echo "Done."
sudo rm /tmp/*.tgz
echo "Removed local backup."
echo "All Done!"
