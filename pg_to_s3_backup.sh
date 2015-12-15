#!/bin/bash

# /home/ubuntu/postgres/pg_to_s3_backup.sh
# Define the variables.
PGHOST="Domain_of_your_PG_host_or_IP"
BUCKET="your_s3_bucket_name_here"
echo "Get system current Date and Time..."
NOW=$(date +"%Y%m%d_%H%M%S")

# dump will be stored in /home/ubuntu/postgres/ directory
cd /home/ubuntu/postgres/;

# Taking dump
pg_dump -Fc -v -h $PGHOST -U username db_name > pg-$HOSTNAME-$NOW.dump

# Upload to S3
echo "Uploading dump to S3..."
s3cmd put /home/ubuntu/postgres/pg-$HOSTNAME-$NOW.dump s3://$BUCKET/

# Deleting the dump after uploading to S#
echo "Deleting dump..."
#sudo rm pg-$HOSTNAME-$NOW.dump
