import '../interfaces/odeme_service.dart';

class KapidaOdeme implements OdemeService {
  @override
  void odemeYap(double tutar) {
    print(
      "$tutar TL Kapıda ödeme tahsil edilecek "
      "(Komisyon +15 TL).",
    );
  }
}