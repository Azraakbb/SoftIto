import 'models/urun.dart';
import 'siparis_yoneticisi.dart';

import 'repositories/sqlite_siparis_repository.dart';

import 'services/kargo_service_impl.dart';
import 'services/mail_service_impl.dart';
import 'services/sms_service_impl.dart';
import 'services/fatura_service_impl.dart';

void main() {
  final database = SqliteVeritabani();

  final siparisci = SiparisYoneticisi(
    repository: SqliteSiparisRepository(database),
    kargoService: MngKargoService(),
    mailService: SmtpMailService(
      SmtpMailServisi(),
    ),
    smsService: NetgsmSmsService(
      NetgsmSmsServisi(),
    ),
    faturaService: PdfFaturaService(),
  );

  var urun1 = Urun(
    "1",
    "Kablosuz Mouse",
    450.0,
    5,
    "FIZIKSEL",
  );

  var urun2 = DijitalUrun(
    "2",
    "Flutter Kursu E-Kitap",
    150.0,
    100,
  );

  var sepet = <Urun>[
    urun1,
    urun2,
  ];

  siparisci.siparisTamamla(
    "SP-9921",
    sepet,
    "KREDI_KARTI",
    "Selahaddin",
    "selahaddin@kodvance.com",
    "05551112233",
    "Kadikoy / Istanbul",
    "INDIRIM10",
  );
}