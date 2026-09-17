import 'models/urun.dart';
import 'interfaces/siparis_repository.dart';
import 'interfaces/odeme_service.dart';
import 'interfaces/kargo_service.dart';
import 'interfaces/mail_service.dart';
import 'interfaces/sms_service.dart';
import 'interfaces/fatura_service.dart';
import 'payments/odeme_factory.dart';

class SiparisYoneticisi {
  final SiparisRepository repository;
  final KargoService kargoService;
  final MailService mailService;
  final SmsService smsService;
  final FaturaService faturaService;

  SiparisYoneticisi({
    required this.repository,
    required this.kargoService,
    required this.mailService,
    required this.smsService,
    required this.faturaService,
  });

  void siparisTamamla(
    String orderId,
    List<Urun> sepet,
    String odemeTipi,
    String musteriAdi,
    String email,
    String tel,
    String adres,
    String kuponKodu,
  ) {
    double toplam = 0;

    for (var i = 0; i < sepet.length; i++) {
      if (sepet[i].stok <= 0) {
        print("Hata: " + sepet[i].ad + " tukenmis!");
        return;
      }

      toplam += sepet[i].fiyat;
      toplam += sepet[i].kargoUcretiHesapla();
      sepet[i].stok--;
    }

    if (kuponKodu == "INDIRIM10") {
      toplam = toplam * 0.90;
    } else if (kuponKodu == "YAZ20") {
      toplam = toplam * 0.80;
    } else if (kuponKodu == "SEPETTE50") {
      toplam = toplam - 50;
    }

    double kdv = toplam * 0.20;
    double sonTutar = toplam + kdv;

    final OdemeService odeme =
        OdemeFactory.getOdeme(odemeTipi);

    odeme.odemeYap(sonTutar);

    repository.siparisKaydet(orderId, sonTutar);

    faturaService.faturaYazdir(orderId);

    mailService.mailGonder(
      email,
      "Sayin $musteriAdi, siparisiniz alindi. "
      "Tutar: $sonTutar TL",
    );

    smsService.smsGonder(
      tel,
      "Siparisiniz onaylandi: $orderId",
    );

    kargoService.kargoGonder(orderId, adres);
  }
}