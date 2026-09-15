import '../interfaces/mail_service.dart';

class SmtpMailServisi {
  void mailAt(String to, String body) {
    print("SMTP Mail gonderildi: " + to);
  }
}

class SmtpMailService implements MailService {
  final SmtpMailServisi mailci;

  SmtpMailService(this.mailci);

  @override
  void mailGonder(String email, String mesaj) {
    mailci.mailAt(email, mesaj);
  }
}