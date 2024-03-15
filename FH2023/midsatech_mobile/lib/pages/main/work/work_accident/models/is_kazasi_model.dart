import 'package:flutter/material.dart';

enum KazaOlayTuru {
  kaymaDusmeCarpma,
  yuksektenDusme,
  cisimCarpmaDusmesi,
  ezilmeSikismaKesik,
  capakTozOlusmasi,
  yanmaPatlama,
  elektrikCarpma,
  sicakKaynakCalismasi,
  toprakKaymasiGocuk,
  zehirlenme,
  kimyasalMaruziyet,
  trafikKazasi,
  kavga,
  hayvanSaldirmasi,
  diger,
}

enum EtkilenenBolge {
  bas,
  boyun,
  goz,
  yuz,
  sirt,
  govde,
  kol,
  el,
  ayak,
  bacak,
  tumVucut,
  diger,
}

enum KazaNedeniTipi {
  calisanKaynakli,
  makineEkipmanKaynakli,
  calismaOrtamiKaynakli,
}

class KazaNedeni {
  final Map<KazaNedeniTipi, List<String>> detaylar;

  KazaNedeni({required this.detaylar});
}

class IsKazasi {
  final String? isYeriAdi;
  final String? digerIsYeriAdi;
  final String isverenTuru; // Asıl İşveren, Alt İşveren, Yüklenici Firma, Diğer
  final String kazaNo;
  final DateTime tarih;
  final String kazaYeri;
  final TimeOfDay saat;
  final String faaliyet;
  final String vardiya;
  final String adiSoyadi;
  final String sicilNo;
  final String birimi;
  final String tcKimlikNo;
  final DateTime iseGirisTarihi;
  final DateTime dogumTarihi;
  final String kazaOlayTarifi;
  final KazaOlayTuru kazaOlayTuru;
  final EtkilenenBolge etkilenenBolge;
  final KazaNedeni kazaNedeni;
  final String kazaSonucu;
  final String? raporGunSayisi;
  final String? hastaneAdi;
  final Map<String, String> kazaSonrasiIslemler;
  final String kazayaNedenOlanUygunsuzluklar;
  final String duzelticiOnleyiciFaaliyetler;
  final String arastiraninAdiSoyadi;
  final String gorevi;
  final DateTime arastirmaTarihi;

  IsKazasi({
    this.isYeriAdi,
    this.digerIsYeriAdi,
    required this.isverenTuru,
    required this.kazaNo,
    required this.tarih,
    required this.kazaYeri,
    required this.saat,
    required this.faaliyet,
    required this.vardiya,
    required this.adiSoyadi,
    required this.sicilNo,
    required this.birimi,
    required this.tcKimlikNo,
    required this.iseGirisTarihi,
    required this.dogumTarihi,
    required this.kazaOlayTarifi,
    required this.kazaOlayTuru,
    required this.etkilenenBolge,
    required this.kazaNedeni,
    required this.kazaSonucu,
    this.raporGunSayisi,
    this.hastaneAdi,
    required this.kazaSonrasiIslemler,
    required this.kazayaNedenOlanUygunsuzluklar,
    required this.duzelticiOnleyiciFaaliyetler,
    required this.arastiraninAdiSoyadi,
    required this.gorevi,
    required this.arastirmaTarihi,
  });
}
