import '../interfaces/odeme_service.dart';

class HavaleOdeme implements OdemeService {
  @override
  void odemeYap(double tutar) {
    print("$tutar TL Havale kontrol edildi.");
  }
}