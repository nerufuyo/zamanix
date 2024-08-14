import 'package:zamanix/repositories/models/emergency_contact_model.dart';
import 'package:zamanix/repositories/models/employment_model.dart';
import 'package:zamanix/repositories/models/experience_model.dart';
import 'package:zamanix/repositories/models/family_model.dart';
import 'package:zamanix/repositories/models/payroll_model.dart';

class UserModel {
  final String? address;
  final String? birthOfDate;
  final String? bloodType;
  final String? email;
  final String? fullname;
  final String? gender;
  final String? image;
  final String? maritalStatus;
  final String? mobilePhone;
  final String? nik;
  final String? passport;
  final List<EmergencyContactModel>? emergencyContact;
  final EmploymentModel? employment;
  final List<ExperienceModel>? experience;
  final List<FamilyModel>? family;
  final PayrollModel? payroll;

  UserModel({
    this.address,
    this.birthOfDate,
    this.bloodType,
    this.email,
    this.fullname,
    this.gender,
    this.image,
    this.maritalStatus,
    this.mobilePhone,
    this.nik,
    this.passport,
    this.emergencyContact,
    this.employment,
    this.experience,
    this.family,
    this.payroll,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        address: json["address"],
        birthOfDate: json["birth_of_date"],
        bloodType: json["blood_type"],
        email: json["email"],
        fullname: json["fullname"],
        gender: json["gender"],
        image: json["image"],
        maritalStatus: json["marital_status"],
        mobilePhone: json["mobile_phone"],
        nik: json["nik"],
        passport: json["passport"],
        emergencyContact: json["emergency_contact"] == null
            ? []
            : List<EmergencyContactModel>.from(json["emergency_contact"]!
                .map((x) => EmergencyContactModel.fromJson(x))),
        employment: json["employment"] == null
            ? null
            : EmploymentModel.fromJson(json["employment"]),
        experience: json["experience"] == null
            ? []
            : List<ExperienceModel>.from(
                json["experience"]!.map((x) => ExperienceModel.fromJson(x))),
        family: json["family"] == null
            ? []
            : List<FamilyModel>.from(
                json["family"]!.map((x) => FamilyModel.fromJson(x))),
        payroll: json["payroll"] == null
            ? null
            : PayrollModel.fromJson(json["payroll"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "birth_of_date": birthOfDate,
        "blood_type": bloodType,
        "email": email,
        "fullname": fullname,
        "gender": gender,
        "image": image,
        "marital_status": maritalStatus,
        "mobile_phone": mobilePhone,
        "nik": nik,
        "passport": passport,
        "emergency_contact": emergencyContact == null
            ? []
            : List<dynamic>.from(emergencyContact!.map((x) => x.toJson())),
        "employment": employment?.toJson(),
        "experience": experience == null
            ? []
            : List<dynamic>.from(experience!.map((x) => x.toJson())),
        "family": family == null
            ? []
            : List<dynamic>.from(family!.map((x) => x.toJson())),
        "payroll": payroll?.toJson(),
      };
}
