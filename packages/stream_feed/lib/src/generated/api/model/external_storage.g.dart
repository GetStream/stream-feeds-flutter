// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalStorage _$ExternalStorageFromJson(Map<String, dynamic> json) =>
    ExternalStorage(
      absAccountName: json['abs_account_name'] as String?,
      absClientId: json['abs_client_id'] as String?,
      absClientSecret: json['abs_client_secret'] as String?,
      absTenantId: json['abs_tenant_id'] as String?,
      bucket: json['bucket'] as String?,
      gcsCredentials: json['gcs_credentials'] as String?,
      path: json['path'] as String?,
      s3ApiKey: json['s3_api_key'] as String?,
      s3CustomEndpoint: json['s3_custom_endpoint'] as String?,
      s3Region: json['s3_region'] as String?,
      s3SecretKey: json['s3_secret_key'] as String?,
      storageName: json['storage_name'] as String?,
      storageType: (json['storage_type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExternalStorageToJson(ExternalStorage instance) =>
    <String, dynamic>{
      'abs_account_name': instance.absAccountName,
      'abs_client_id': instance.absClientId,
      'abs_client_secret': instance.absClientSecret,
      'abs_tenant_id': instance.absTenantId,
      'bucket': instance.bucket,
      'gcs_credentials': instance.gcsCredentials,
      'path': instance.path,
      's3_api_key': instance.s3ApiKey,
      's3_custom_endpoint': instance.s3CustomEndpoint,
      's3_region': instance.s3Region,
      's3_secret_key': instance.s3SecretKey,
      'storage_name': instance.storageName,
      'storage_type': instance.storageType,
    };
