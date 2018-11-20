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

Ideally you would automate this using automation.

Contact: rrostt@gmail.com
