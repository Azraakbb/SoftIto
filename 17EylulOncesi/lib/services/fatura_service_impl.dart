import '../interfaces/fatura_service.dart';

class PdfFaturaService implements FaturaService {
  @override
  void faturaYazdir(String orderId) {
    print("Fatura PDF cikarildi: $orderId");
  }
}