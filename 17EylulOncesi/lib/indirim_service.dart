enum KuponKodu {
  indirim10,
  yaz20,
  sepette50,
}

class IndirimService {
  double indirimUygula(double toplam, KuponKodu? kupon) {
    if (kupon == null) {
      return toplam;
    }

    switch (kupon) {
      case KuponKodu.indirim10:
        return toplam * 0.90;

      case KuponKodu.yaz20:
        return toplam * 0.80;

      case KuponKodu.sepette50:
        return toplam - 50;
    }
  }
}