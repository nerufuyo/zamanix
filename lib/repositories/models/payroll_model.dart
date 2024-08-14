class PayrollModel {
  final String? bankHolder;
  final String? bankName;
  final String? bankNumber;
  final String? bpjsKesehatan;
  final String? bpjsKetenagakerjaan;
  final String? npwpNew;
  final String? npwpOld;
  final String? ptkpStatus;

  PayrollModel({
    this.bankHolder,
    this.bankName,
    this.bankNumber,
    this.bpjsKesehatan,
    this.bpjsKetenagakerjaan,
    this.npwpNew,
    this.npwpOld,
    this.ptkpStatus,
  });

  factory PayrollModel.fromJson(Map<String, dynamic> json) => PayrollModel(
        bankHolder: json["bank_holder"],
        bankName: json["bank_name"],
        bankNumber: json["bank_number"],
        bpjsKesehatan: json["bpjs_kesehatan"],
        bpjsKetenagakerjaan: json["bpjs_ketenagakerjaan"],
        npwpNew: json["npwp_new"],
        npwpOld: json["npwp_old"],
        ptkpStatus: json["ptkp_status"],
      );

  Map<String, dynamic> toJson() => {
        "bank_holder": bankHolder,
        "bank_name": bankName,
        "bank_number": bankNumber,
        "bpjs_kesehatan": bpjsKesehatan,
        "bpjs_ketenagakerjaan": bpjsKetenagakerjaan,
        "npwp_new": npwpNew,
        "npwp_old": npwpOld,
        "ptkp_status": ptkpStatus,
      };
}
