import '../interfaces/kargo_service.dart';

class MngKargoService implements KargoService {
  @override
  void kargoGonder(String orderId, String adres) {
    print("MNG Kargo takip fis basildi: $adres");
  }
}