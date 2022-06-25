import 'package:v2_tracking_page/data/models/contact-detail.model.dart';
import 'package:v2_tracking_page/data/models/order_package.model.dart';
import 'package:v2_tracking_page/data/models/order_reference.model.dart';
import 'package:v2_tracking_page/data/models/order_timeline.model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TrackOrder {
  final String id;
  final String? tenantName;
  final String? merchantName;
  final String? status;
  final String? serviceType;
  final String? serviceLevel;
  final ContactDetail? receiverDetail;
  final String? deliveryNotesFromMerchant;
  final String? deliveryNotesFromReceiver;
  final String? deliveryNotesFromDriver;
  final OrderReference? orderReference;
  final List<OrderPackage>? orderPackage;
  final bool? allowWeekendDelivery;
  final DateTime? requestedDeliveryTimeSlotStart;
  final DateTime? requestedDeliveryTimeSlotEnd;
  final bool? cashOnDeliveryRequested;
  final int? cashOnDeliveryAmount;
  final String? cashOnDeliveryCurrency;
  final int? insuredAmount;
  final String? insuredAmountCurrency;
  final DateTime? deliveredAt;
  final int? totalWeight;
  final String? itemsInOrderPackages;
  final List<OrderTimeline>? orderTimelines;

  TrackOrder({
    required this.id,
    this.tenantName,
    this.merchantName,
    this.status,
    this.serviceType,
    this.serviceLevel,
    this.receiverDetail,
    this.deliveryNotesFromMerchant,
    this.deliveryNotesFromReceiver,
    this.deliveryNotesFromDriver,
    this.orderReference,
    this.orderPackage,
    this.allowWeekendDelivery,
    this.requestedDeliveryTimeSlotStart,
    this.requestedDeliveryTimeSlotEnd,
    this.cashOnDeliveryRequested,
    this.cashOnDeliveryAmount,
    this.cashOnDeliveryCurrency,
    this.insuredAmount,
    this.insuredAmountCurrency,
    this.deliveredAt,
    this.totalWeight,
    this.itemsInOrderPackages,
    this.orderTimelines,
  });

  @override
  String toString() => "$id";
  factory TrackOrder.fromJson(Map<String, dynamic> json) => TrackOrder(
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
        requestedDeliveryTimeSlotStart:
            json['requestedDeliveryTimeSlotStart'] == null
                ? null
                : DateTime.tryParse(json['requestedDeliveryTimeSlotStart']),
        requestedDeliveryTimeSlotEnd:
            json['requestedDeliveryTimeSlotEnd'] == null
                ? null
                : DateTime.tryParse(json['requestedDeliveryTimeSlotEnd']),
        cashOnDeliveryRequested: json['cashOnDeliveryRequested'] as bool?,
        cashOnDeliveryAmount: json['cashOnDeliveryAmount'] as int?,
        cashOnDeliveryCurrency: json['cashOnDeliveryCurrency'] as String?,
        insuredAmount: json['insuredAmount'] as int?,
        insuredAmountCurrency: json['insuredAmountCurrency'] as String?,
        deliveredAt: json['deliveredAt'] == null
            ? null
            : DateTime.tryParse(json['deliveredAt']),
        totalWeight: json['totalWeight'] as int?,
        itemsInOrderPackages: json['itemsInOrderPackages'] as String?,
        orderTimelines: (json['orderTimelines'] as List<dynamic>?)
            ?.map((e) => OrderTimeline.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': this.id,
        'tenantName': this.tenantName,
        'merchantName': this.merchantName,
        'status': this.status,
        'serviceType': this.serviceType,
        'serviceLevel': this.serviceLevel,
        'receiverDetail': this.receiverDetail,
        'deliveryNotesFromMerchant': this.deliveryNotesFromMerchant,
        'deliveryNotesFromReceiver': this.deliveryNotesFromReceiver,
        'deliveryNotesFromDriver': this.deliveryNotesFromDriver,
        'orderReference': this.orderReference,
        'orderPackage': this.orderPackage,
        'allowWeekendDelivery': this.allowWeekendDelivery,
        'requestedDeliveryTimeSlotStart':
            this.requestedDeliveryTimeSlotStart?.toUtc(),
        'requestedDeliveryTimeSlotEnd':
            this.requestedDeliveryTimeSlotEnd?.toUtc(),
        'cashOnDeliveryRequested': this.cashOnDeliveryRequested,
        'cashOnDeliveryAmount': this.cashOnDeliveryAmount,
        'cashOnDeliveryCurrency': this.cashOnDeliveryCurrency,
        'insuredAmount': this.insuredAmount,
        'insuredAmountCurrency': this.insuredAmountCurrency,
        'deliveredAt': this.deliveredAt?.toUtc(),
        'totalWeight': this.totalWeight,
        'itemsInOrderPackages': this.itemsInOrderPackages,
        'orderTimelines': this.orderTimelines,
      };
}
