class FamilyModel {
  final String? address;
  final String? name;
  final String? phone;
  final String? status;

  FamilyModel({
    this.address,
    this.name,
    this.phone,
    this.status,
  });

  factory FamilyModel.fromJson(Map<String, dynamic> json) => FamilyModel(
        address: json["address"],
        name: json["name"],
        phone: json["phone"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
        "phone": phone,
        "status": status,
      };
}
