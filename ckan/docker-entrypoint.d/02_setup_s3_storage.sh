#!/bin/bash

if [[ $CKAN__PLUGINS == *"s3filestore"* ]]; then
   echo "Set up ckanext.s3filestore.aws_bucket_name in the CKAN config file"
   ckan config-tool $CKAN_INI "ckanext.s3filestore.aws_bucket_name=${S3_BUCKET_NAME}"
   echo "Set up ckanext.s3filestore.region_name in the CKAN config file"
   ckan config-tool $CKAN_INI "ckanext.s3filestore.region_name=${S3_REGION}"
   echo "Set up ckanext.s3filestore.signature_version in the CKAN config file"
   ckan config-tool $CKAN_INI "ckanext.s3filestore.signature_version=${S3_SIGNATURE_VERSION}"
   echo "Set up ckanext.s3filestore.aws_access_key_id in the CKAN config file"
   ckan config-tool $CKAN_INI "ckanext.s3filestore.aws_access_key_id=${S3_ACCESS_KEY_ID}"
   echo "Set up ckanext.s3filestore.aws_secret_access_key in the CKAN config file"
   ckan config-tool $CKAN_INI "ckanext.s3filestore.aws_secret_access_key=${S3_SECRET_ACCESS_KEY}"
   echo "Set up ckanext.s3filestore.host_name in the CKAN config file"
   ckan config-tool $CKAN_INI "ckanext.s3filestore.host_name=${S3_HOST_NAME}"

   ckan config-tool $CKAN_INI "ckanext.s3filestore.filesystem_download_fallback = false"
else
   echo "Not configuring s3filestore"
fi
