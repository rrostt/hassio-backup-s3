# Hassio Addon for Backing up to S3 Bucket

Add-on for uploading hass.io snapshots to AWS S3.

## Installation

Save files in /addons/buckets3 on your hassio machine.

Under the Add-on Store tab in the Hass.io view in HA you'll find the addon under Local add-ons.

Install, then set the config variables. You should create an s3-bucket, and create a user with IAM policy rights to upload an object to the bucket.

Note: awskey is `access key id` and awssecret is `secret access key` in AWS lingo.

Next,

1. Create a Snapshot in the hass.io view in HA.
2. Click Start on the Backup S3 add-on.

This will sync the /backup/ directory to the s3-bucket.

Ideally you would automate this using automation:

```
# backups
- alias: Make snapshot
  trigger:
    platform: time
    at: '3:00:00'
  condition:
    condition: time
    weekday:
      - mon
  action:
    service: hassio.snapshot_full
    data_template:
      name: Automated Backup {{ now().strftime('%Y-%m-%d') }}

- alias: Upload to S3
  trigger:
    platform: time
    at: '3:30:00'
  condition:
    condition: time
    weekday:
      - mon
  action:
    service: hassio.addon_start
    data:
      addon: local_backup_s3
```

The automation above first makes a snapshot at 3am, and then at 3.30am uploads to S3.

Contact: rrostt@gmail.com
