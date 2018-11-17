# Hassio Addon for Backing up to S3 Bucket

Save files in /addons/buckets3 on your hassio machine.

Under the Add-on Store tab in the Hass.io view in HA you'll find the addon under Local add-ons.

Install, then set the config variables. You should create an s3-bucket, and create a user with IAM policy rights to upload an object to the bucket.

Note: awskey is `access key id` and awssecret is `secret access key` in AWS lingo.

Contact: rrostt@gmail.com
