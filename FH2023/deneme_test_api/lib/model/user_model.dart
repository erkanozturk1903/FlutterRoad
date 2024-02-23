import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? oAdSoyad;
  String? oCepTel;
  String? oGorevi;
  String? oMesaj;
  String? oOut;

  UserModel({
    this.oAdSoyad,
    this.oCepTel,
    this.oGorevi,
    this.oMesaj,
    this.oOut,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        oAdSoyad: json["o_AD_SOYAD"],
        oCepTel: json["o_CEP_TEL"],
        oGorevi: json["o_GOREVI"],
        oMesaj: json["o_MESAJ"],
        oOut: json["o_OUT"],
      );

  Map<String, dynamic> toJson() => {
        "o_AD_SOYAD": oAdSoyad,
        "o_CEP_TEL": oCepTel,
        "o_GOREVI": oGorevi,
        "o_MESAJ": oMesaj,
        "o_OUT": oOut,
      };
}
