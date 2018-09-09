
rpm -qa > packages

if mountpoint -q /mnt/backup
then
	echo "Backup err:  already mounted!"
else
	echo "Backup Start: " $(date)

	mount /dev/sdb1 /mnt/backup

	if mountpoint -q /mnt/backup
	then
		echo "Backing up Root..."
		rsync -saAXv --delete  /home/ /mnt/backup

		umount /mnt/backup
		echo "Backup done: " $(date)
	else
		echo "Backup err:  failed to mount drive"
	fi
fi

