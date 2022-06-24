// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderReference _$OrderReferenceFromJson(Map<String, dynamic> json) =>
    OrderReference(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      merchantOrderNumber: json['merchantOrderNumber'] as String?,
      others: json['others'] as String?,
    );

Map<String, dynamic> _$OrderReferenceToJson(OrderReference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'merchantOrderNumber': instance.merchantOrderNumber,
      'others': instance.others,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
