import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String? oAdSoyad;
  String? oCepTel;
  String? oGorevi;
  String? oMesaj;
  String? oOut;

  LoginResponse({
    this.oAdSoyad,
    this.oCepTel,
    this.oGorevi,
    this.oMesaj,
    this.oOut,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
