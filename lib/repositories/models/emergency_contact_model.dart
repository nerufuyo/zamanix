class EmergencyContactModel {
  final String? address;
  final String? name;
  final String? phone;
  final String? status;

  EmergencyContactModel({
    this.address,
    this.name,
    this.phone,
    this.status,
  });

  factory EmergencyContactModel.fromJson(Map<String, dynamic> json) =>
      EmergencyContactModel(
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
