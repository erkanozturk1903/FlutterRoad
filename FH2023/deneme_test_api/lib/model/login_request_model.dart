class LoginRequestModel {
  late final String pKullaniciAdi;
  late final String pSifre;

  LoginRequestModel({
    required this.pKullaniciAdi,
    required this.pSifre,
  });

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    pKullaniciAdi = json['pKullaniciAdi'];
    pSifre = json['pSifre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pKullaniciAdi'] = pKullaniciAdi;
    data['pSifre'] = pSifre;
    return data;
  }
}
