import '../interfaces/siparis_repository.dart';

class SqliteVeritabani {
  void kaydet(String sql) {
    print("DB calistirildi: " + sql);
  }
}

class SqliteSiparisRepository implements SiparisRepository {
  final SqliteVeritabani db;

  SqliteSiparisRepository(this.db);

  @override
  void siparisKaydet(String orderId, double tutar) {
    db.kaydet(
      "INSERT INTO siparisler VALUES ('$orderId', $tutar)",
    );
  }
}