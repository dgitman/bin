#Backup whole MySQL database instance
/usr/bin/innobackupex --compress --rsync /backups/database

#Remove backups older than 28 days
find /backups/database/* -mtime +28 -exec rm {} \;

#Sync to Smazon S3 Bucket
aws s3 sync /backups s3://ndap-etl-backup --delete --only-show-errors
