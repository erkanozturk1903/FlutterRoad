class IsKazasi {
  IsyeriBilgileri isyeriBilgileri;
  KazaOlayBilgileri kazaOlayBilgileri;
  KazazedeBilgileri kazazedeBilgileri;
  KazaOlayArastirmasi kazaOlayArastirmasi;
  Sonuclar sonuclar;
  ArastirmaEkibi arastirmaEkibi;

  IsKazasi({
    required this.isyeriBilgileri,
    required this.kazaOlayBilgileri,
    required this.kazazedeBilgileri,
    required this.kazaOlayArastirmasi,
    required this.sonuclar,
    required this.arastirmaEkibi,
  });
}

class IsyeriBilgileri {
  String isverenTuru;
  String isYeriAdi;
  String digerIsYeriAdi;

  IsyeriBilgileri({
    required this.isverenTuru,
    required this.isYeriAdi,
    required this.digerIsYeriAdi,
  });
}

class KazaOlayBilgileri {
  String kazaNo;
  DateTime tarih;
  String kazaYeri;
  String saat;
  String faaliyet;
  String vardiya;

  KazaOlayBilgileri({
    required this.kazaNo,
    required this.tarih,
    required this.kazaYeri,
    required this.saat,
    required this.faaliyet,
    required this.vardiya,
  });
}

class KazazedeBilgileri {
  String adiSoyadi;
  String sicilNo;
  String birimi;
  String tcKimlikNo;
  DateTime iseGirisTarihi;
  DateTime dogumTarihi;

  KazazedeBilgileri({
    required this.adiSoyadi,
    required this.sicilNo,
    required this.birimi,
    required this.tcKimlikNo,
    required this.iseGirisTarihi,
    required this.dogumTarihi,
  });
}

class KazaOlayArastirmasi {
  String kazaOlayTarifi;
  List<String> kazaOlayTuru;
  List<String> etkilenenBolge;
  Map<String, bool> kazaninNedeni;

  KazaOlayArastirmasi({
    required this.kazaOlayTarifi,
    required this.kazaOlayTuru,
    required this.etkilenenBolge,
    required this.kazaninNedeni,
  });
}

class Sonuclar {
  List<String> kazaOlaySonucu;
  String raporGunSayisi;
  String hastaneAdi;
  List<String> kazaSonrasiYapilanIslemler;

  Sonuclar({
    required this.kazaOlaySonucu,
    required this.raporGunSayisi,
    required this.hastaneAdi,
    required this.kazaSonrasiYapilanIslemler,
  });
}

class ArastirmaEkibi {
  String adiSoyadi;
  String gorevi;
  DateTime tarih;
  String imza;

  ArastirmaEkibi({
    required this.adiSoyadi,
    required this.gorevi,
    required this.tarih,
    required this.imza,
  });
}
