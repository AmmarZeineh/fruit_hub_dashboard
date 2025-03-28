class ShippingAddressModel {
  String? name;
  String? phone;
  String? address;
  String? city;
  String? email;
  String? floor;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.address,
    this.floor,
    this.city,
    this.email,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      floor: json['floor'] as String?,
      city: json['city'] as String?,
      email: json['email'] as String?,
    );
  }

  @override
  String toString() {
    return '$address $city $floor';
  }

  toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'floor': floor,
      'city': city,
      'email': email,
    };
  }
}
