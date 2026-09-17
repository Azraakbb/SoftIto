import '../interfaces/odeme_service.dart';

class CryptoOdeme implements OdemeService {
  @override
  void odemeYap(double tutar) {
    print("$tutar TL USDT transferi onaylandı.");
  }
}