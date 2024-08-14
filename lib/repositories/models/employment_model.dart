class EmploymentModel {
  final String? barcode;
  final String? branch;
  final String? companyName;
  final String? endDate;
  final String? id;
  final String? jobLevel;
  final String? jobPosition;
  final String? joinDate;
  final String? organizationName;
  final String? status;

  EmploymentModel({
    this.barcode,
    this.branch,
    this.companyName,
    this.endDate,
    this.id,
    this.jobLevel,
    this.jobPosition,
    this.joinDate,
    this.organizationName,
    this.status,
  });

  factory EmploymentModel.fromJson(Map<String, dynamic> json) =>
      EmploymentModel(
        barcode: json["barcode"],
        branch: json["branch"],
        companyName: json["company_name"],
        endDate: json["end_date"],
        id: json["id"],
        jobLevel: json["job_level"],
        jobPosition: json["job_position"],
        joinDate: json["join_date"],
        organizationName: json["organization_name"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "barcode": barcode,
        "branch": branch,
        "company_name": companyName,
        "end_date": endDate,
        "id": id,
        "job_level": jobLevel,
        "job_position": jobPosition,
        "join_date": joinDate,
        "organization_name": organizationName,
        "status": status,
      };
}
