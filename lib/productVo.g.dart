// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productVo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVo _$ProductVoFromJson(Map<String, dynamic> json) => ProductVo(
      json['productName'] as String,
      json['productDescription'] as String,
      json['productQuantity'] as String,
      json['productAmount'] as String,
      json['productSize'] as String,
    );

Map<String, dynamic> _$ProductVoToJson(ProductVo instance) => <String, dynamic>{
      'productName': instance.productName,
      'productDescription': instance.productDescription,
      'productQuantity': instance.productQuantity,
      'productSize': instance.productSize,
      'productAmount': instance.productAmount,
    };
