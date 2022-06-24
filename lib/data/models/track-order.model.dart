import 'package:v2_tracking_page/data/models/contact-detail.model.dart';
import 'package:v2_tracking_page/data/models/order_package.model.dart';
import 'package:v2_tracking_page/data/models/order_reference.model.dart';
import 'package:v2_tracking_page/data/models/order_timeline.model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'track-order.model.g.dart';

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
  factory TrackOrder.fromJson(Map<String, dynamic> json) =>
      _$TrackOrderFromJson(json);

  Map<String, dynamic> toJson() => _$TrackOrderToJson(this);

  @override
  String toString() => "$id";
}
