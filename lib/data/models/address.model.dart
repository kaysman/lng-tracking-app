import 'package:json_annotation/json_annotation.dart';
import 'package:v2_tracking_page/data/enums/status.enum.dart';
part 'address.model.g.dart';

@JsonSerializable()
class Address {
  final String? id;
  final String? addressLineOne;
  final String? addressLineTwo;
  final String? addressLineThree;
  final String? postalCode;
  final String? city;
  final String? state;
  final String? country;
  final String? countryCode;
  final AddressType? addressType;
  final String? longitude;
  final String? latitude;
  final SpecificTypeOfLocation? specificTypeOfLocation;
  final TypeOfContactForAddress? typeOfContactForAddress;
  final GenericTypeOfLocation? genericTypeOfLocation;
  final DateTime? createdAt;
  final DateTime? deletedAt;
  final DateTime? updatedAt;

  Address({
    this.id,
    this.genericTypeOfLocation,
    this.deletedAt,
    this.addressLineOne,
    this.addressLineTwo,
    this.addressLineThree,
    this.city,
    this.country,
    this.countryCode,
    this.createdAt,
    this.postalCode,
    this.state,
    this.updatedAt,
    this.addressType,
    this.longitude,
    this.latitude,
    this.typeOfContactForAddress,
    required this.specificTypeOfLocation,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  String get fullAddress {
    var a = "";
    a += addressLineOne ?? '' + " ";
    if (addressLineTwo != null) a += addressLineTwo! + " ";
    if (addressLineThree != null) a += addressLineThree!;
    return a;
  }
}
