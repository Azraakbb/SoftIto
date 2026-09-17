import '../interfaces/sms_service.dart';

class NetgsmSmsServisi {
  void smsYolla(String gsm, String text) {
    print("SMS iletildi: " + gsm);
  }
}

class NetgsmSmsService implements SmsService {
  final NetgsmSmsServisi smsci;

  NetgsmSmsService(this.smsci);

  @override
  void smsGonder(String tel, String mesaj) {
    smsci.smsYolla(tel, mesaj);
  }
}