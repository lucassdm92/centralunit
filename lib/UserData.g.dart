// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreEntity _$StoreEntityFromJson(Map<String, dynamic> json) => StoreEntity(
      json['storeName'] as String,
      json['storeDescription'] as String,
      json['storeLocation'] as String,
    );

Map<String, dynamic> _$StoreEntityToJson(StoreEntity instance) =>
    <String, dynamic>{
      'storeName': instance.storeName,
      'storeDescription': instance.storeDescription,
      'storeLocation': instance.storeLocation,
    };
