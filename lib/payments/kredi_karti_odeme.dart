import '../interfaces/odeme_service.dart';

class KrediKartiOdeme implements OdemeService {
  @override
  void odemeYap(double tutar) {
    print("$tutar TL Kredi kartından POS ile çekildi.");
  }
}