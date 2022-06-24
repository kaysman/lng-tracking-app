// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track-order.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackOrder _$TrackOrderFromJson(Map<String, dynamic> json) => TrackOrder(
      id: json['id'] as String,
      tenantName: json['tenantName'] as String?,
      merchantName: json['merchantName'] as String?,
      status: json['status'] as String?,
      serviceType: json['serviceType'] as String?,
      serviceLevel: json['serviceLevel'] as String?,
      receiverDetail: json['receiverDetail'] == null
          ? null
          : ContactDetail.fromJson(
              json['receiverDetail'] as Map<String, dynamic>),
      deliveryNotesFromMerchant: json['deliveryNotesFromMerchant'] as String?,
      deliveryNotesFromReceiver: json['deliveryNotesFromReceiver'] as String?,
      deliveryNotesFromDriver: json['deliveryNotesFromDriver'] as String?,
      orderReference: json['orderReference'] == null
          ? null
          : OrderReference.fromJson(
              json['orderReference'] as Map<String, dynamic>),
      orderPackage: (json['orderPackage'] as List<dynamic>?)
          ?.map((e) => OrderPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
      allowWeekendDelivery: json['allowWeekendDelivery'] as bool?,
      requestedDeliveryTimeSlotStart: json['requestedDeliveryTimeSlotStart'] ==
              null
          ? null
          : DateTime.parse(json['requestedDeliveryTimeSlotStart'] as String),
      requestedDeliveryTimeSlotEnd: json['requestedDeliveryTimeSlotEnd'] == null
          ? null
          : DateTime.parse(json['requestedDeliveryTimeSlotEnd'] as String),
      cashOnDeliveryRequested: json['cashOnDeliveryRequested'] as bool?,
      cashOnDeliveryAmount: json['cashOnDeliveryAmount'] as int?,
      cashOnDeliveryCurrency: json['cashOnDeliveryCurrency'] as String?,
      insuredAmount: json['insuredAmount'] as int?,
      insuredAmountCurrency: json['insuredAmountCurrency'] as String?,
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      totalWeight: json['totalWeight'] as int?,
      itemsInOrderPackages: json['itemsInOrderPackages'] as String?,
      orderTimelines: (json['orderTimelines'] as List<dynamic>?)
          ?.map((e) => OrderTimeline.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackOrderToJson(TrackOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantName': instance.tenantName,
      'merchantName': instance.merchantName,
      'status': instance.status,
      'serviceType': instance.serviceType,
      'serviceLevel': instance.serviceLevel,
      'receiverDetail': instance.receiverDetail,
      'deliveryNotesFromMerchant': instance.deliveryNotesFromMerchant,
      'deliveryNotesFromReceiver': instance.deliveryNotesFromReceiver,
      'deliveryNotesFromDriver': instance.deliveryNotesFromDriver,
      'orderReference': instance.orderReference,
      'orderPackage': instance.orderPackage,
      'allowWeekendDelivery': instance.allowWeekendDelivery,
      'requestedDeliveryTimeSlotStart':
          instance.requestedDeliveryTimeSlotStart?.toIso8601String(),
      'requestedDeliveryTimeSlotEnd':
          instance.requestedDeliveryTimeSlotEnd?.toIso8601String(),
      'cashOnDeliveryRequested': instance.cashOnDeliveryRequested,
      'cashOnDeliveryAmount': instance.cashOnDeliveryAmount,
      'cashOnDeliveryCurrency': instance.cashOnDeliveryCurrency,
      'insuredAmount': instance.insuredAmount,
      'insuredAmountCurrency': instance.insuredAmountCurrency,
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'totalWeight': instance.totalWeight,
      'itemsInOrderPackages': instance.itemsInOrderPackages,
      'orderTimelines': instance.orderTimelines,
    };
