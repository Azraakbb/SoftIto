import '../interfaces/odeme_service.dart';
import 'crypto_odeme.dart';
import 'havale_odeme.dart';
import 'kapida_odeme.dart';
import 'kredi_karti_odeme.dart';

class OdemeFactory {
  static OdemeService getOdeme(String tip) {
    switch (tip) {
      case "KREDI_KARTI":
        return KrediKartiOdeme();

      case "HAVALE":
        return HavaleOdeme();

      case "KAPIDA_ODEME":
        return KapidaOdeme();

      case "CRYPTO":
        return CryptoOdeme();

      default:
        throw Exception("Geçersiz ödeme yöntemi");
    }
  }
}