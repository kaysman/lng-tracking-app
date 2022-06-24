import 'package:json_annotation/json_annotation.dart';
part 'order_reference.model.g.dart';

@JsonSerializable()
class OrderReference {
  OrderReference({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.merchantOrderNumber,
    this.others,
  });

  final String? id;
  final String? merchantOrderNumber;
  final String? others;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  factory OrderReference.fromJson(Map<String, dynamic> json) =>
      _$OrderReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$OrderReferenceToJson(this);
}
