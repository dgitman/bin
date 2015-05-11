#Backup whole MySQL database instance
/usr/bin/innobackupex --compress --rsync /backups/database > /var/log/xtrabackup 2>&1

if [ -z "`tail -1 $TMPFILE | grep 'completed OK!'`" ] 
 then
   echo "$INNOBACKUPEX failed:"
fi

#Remove backups older than 28 days
find /backups/database -prune -mtime +7 -exec rm -rf {} \;

#Sync to Smazon S3 Bucket
aws s3 sync /backups s3://ndap-etl-backup --delete --only-show-errors
