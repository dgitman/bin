# bin

Personal scripts and command-line helpers.

## Setup

Run this once so scripts in `~/bin` are available from any new terminal:

```sh
~/bin/setup-bin-path.sh
```

After it runs, restart your terminal or reload your shell:

```sh
source ~/.zshrc
```

## Commands

| Command | Purpose |
| --- | --- |
| `aws_s3_list_all_bucket_sizes.sh` | Print S3 bucket sizes using `s3cmd`. |
| `curl-format-example.py [url]` | Run `curl` with the bundled timing format file. |
| `dump-tables-mysql.sh <host> <user> <database> [dir]` | Dump each table in a MySQL database into its own compressed SQL file. |
| `file2folder.sh` | Move each file in the current directory into a same-named folder. |
| `import-files-mysql.sh <host> <user> <database> [dir]` | Import `.sql.gz` files into a MySQL database. |
| `mysql-dump-databases.sh <host> <user> [dir]` | Dump user databases from a MySQL server into compressed files. |
| `mysql-optimize-only-fragmented-tables.sh` | Prompt for MySQL credentials and optimize fragmented tables. |
| `mysql-optimize-only-fragmented-tables-cron.sh` | Cron-friendly version of the fragmented table optimizer. |
| `mysql-restore-s3.sh <database.table> [bucket/path]` | Download a table archive from the latest S3 backup. |
| `setup-bin-path.sh` | Add `~/bin` to your shell `PATH`. |
| `speed-test.sh <user@host[:port]> [size_kb]` | Test SSH upload/download throughput with `scp`. |
| `update-pingdom-iptables.sh [-n]` | Update a `PINGDOM` iptables chain from Pingdom probe IPs. |

## Notes

- The scripts assume the required tools are already installed, such as `mysql`, `mysqldump`, `s3cmd`, `aws`, `curl`, `scp`, and `iptables`.
- MySQL scripts prompt for passwords instead of storing credentials in the script files.
- For S3 and AWS scripts, configure credentials through the standard tool config files or environment variables.
