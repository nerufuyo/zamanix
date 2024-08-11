// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:zamanix/repositories/models/emergency_contact_model.dart';
import 'package:zamanix/repositories/models/experience_model.dart';
import 'package:zamanix/repositories/models/payroll_model.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? address;
  final String? birthOfDate;
  final String? bloodType;
  final String? email;
  final List<EmergencyContactModel>? emergencyContact;
  final List<ExperienceModel>? experience;
  final List<EmergencyContactModel>? family;
  final String? fullname;
  final String? gender;
  final String? maritalStatus;
  final String? mobilePhone;
  final String? nik;
  final String? passport;
  final PayrollModel? payroll;
  final String? phone;
  final String? placeOfBirth;
  final String? postalCode;
  final String? religion;

  UserModel({
    this.address,
    this.birthOfDate,
    this.bloodType,
    this.email,
    this.emergencyContact,
    this.experience,
    this.family,
    this.fullname,
    this.gender,
    this.maritalStatus,
    this.mobilePhone,
    this.nik,
    this.passport,
    this.payroll,
    this.phone,
    this.placeOfBirth,
    this.postalCode,
    this.religion,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        address: json["address"],
        birthOfDate: json["birth_of_date"],
        bloodType: json["blood_type"],
        email: json["email"],
        emergencyContact: json["emergency_contact"] == null
            ? []
            : List<EmergencyContactModel>.from(json["emergency_contact"]!
                .map((x) => EmergencyContactModel.fromJson(x))),
        experience: json["experience"] == null
            ? []
            : List<ExperienceModel>.from(
                json["experience"]!.map((x) => ExperienceModel.fromJson(x))),
        family: json["family"] == null
            ? []
            : List<EmergencyContactModel>.from(
                json["family"]!.map((x) => EmergencyContactModel.fromJson(x))),
        fullname: json["fullname"],
        gender: json["gender"],
        maritalStatus: json["marital_status"],
        mobilePhone: json["mobile_phone"],
        nik: json["nik"],
        passport: json["passport"],
        payroll: json["payroll"] == null
            ? null
            : PayrollModel.fromJson(json["payroll"]),
        phone: json["phone"],
        placeOfBirth: json["place_of_birth"],
        postalCode: json["postal_code"],
        religion: json["religion"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "birth_of_date": birthOfDate,
        "blood_type": bloodType,
        "email": email,
        "emergency_contact": emergencyContact == null
            ? []
            : List<dynamic>.from(emergencyContact!.map((x) => x.toJson())),
        "experience": experience == null
            ? []
            : List<dynamic>.from(experience!.map((x) => x.toJson())),
        "family": family == null
            ? []
            : List<dynamic>.from(family!.map((x) => x.toJson())),
        "fullname": fullname,
        "gender": gender,
        "marital_status": maritalStatus,
        "mobile_phone": mobilePhone,
        "nik": nik,
        "passport": passport,
        "payroll": payroll?.toJson(),
        "phone": phone,
        "place_of_birth": placeOfBirth,
        "postal_code": postalCode,
        "religion": religion,
      };
}
