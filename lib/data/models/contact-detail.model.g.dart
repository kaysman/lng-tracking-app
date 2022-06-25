// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact-detail.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDetail _$ContactDetailFromJson(Map<String, dynamic> json) =>
    ContactDetail(
      createdAt: json['createdAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumberCountryCode: json['phoneNumberCountryCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      emailAddress: json['emailAddress'] as String?,
      company: json['company'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      typeOfOtherContactDetail: $enumDecodeNullable(
          _$TypeOfOtherContactDetailEnumMap, json['typeOfOtherContactDetail']),
    );

Map<String, dynamic> _$ContactDetailToJson(ContactDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumberCountryCode': instance.phoneNumberCountryCode,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'company': instance.company,
      'address': instance.address,
      'typeOfOtherContactDetail':
          _$TypeOfOtherContactDetailEnumMap[instance.typeOfOtherContactDetail],
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'updatedAt': instance.updatedAt,
    };

const _$TypeOfOtherContactDetailEnumMap = {
  TypeOfOtherContactDetail.WAREHOUSE: 'WAREHOUSE',
  TypeOfOtherContactDetail.DISPATCH_POINT: 'DISPATCH_POINT',
  TypeOfOtherContactDetail.OTHERS: 'OTHERS',
  TypeOfOtherContactDetail.PICK_UP_TASK: 'PICK_UP_TASK',
  TypeOfOtherContactDetail.DROP_OFF_TASK: 'DROP_OFF_TASK',
  TypeOfOtherContactDetail.CUSTOM_FOR_DRIVER_DELIVERY_PICK_UP:
      'CUSTOM_FOR_DRIVER_DELIVERY_PICK_UP',
};
