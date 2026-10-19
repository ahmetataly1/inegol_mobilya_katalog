import '../models/category.dart';
import '../models/product.dart';

class FurnitureData {
  // İnegöl Mobilyası Tarzı Dinamik Renk Paletlerine Sahip Kategoriler
  static const List<FurnitureCategory> categories = [
    FurnitureCategory(
      id: 'all',
      name: 'Tüm Koleksiyon',
      primaryColorValue: 0xFF5D4037, // Klasik İnegöl Meşe / Ceviz Ahşap Kahvesi
      accentColorValue: 0xFFD7CCC8,  // Krem/Vizon
      backgroundColorValue: 0xFFFBF9F7, // Sıcak Kırık Beyaz
    ),
    FurnitureCategory(
      id: 'living_room',
      name: 'Koltuk & Salon',
      primaryColorValue: 0xFF1B4D3E, // Zümrüt Yeşili (İnegöl Kadife Koltuk Klasiği)
      accentColorValue: 0xFFC5A059,  // Eskitme Altın / Pirinç Sarısı
      backgroundColorValue: 0xFFF4F7F5,
    ),
    FurnitureCategory(
      id: 'dining_room',
      name: 'Yemek Odası',
      primaryColorValue: 0xFF8D5B4C, // Terracotta / Sıcak Kiremit Ahşap
      accentColorValue: 0xFFE0A96D,  // Doğal Masif Meşe Tonu
      backgroundColorValue: 0xFFFAF6F2,
    ),
    FurnitureCategory(
      id: 'bedroom',
      name: 'Yatak Odası',
      primaryColorValue: 0xFF2C3E50, // Antrasit Gece Mavisi / Dokulu Kumaş
      accentColorValue: 0xFF95A5A6,  // Mat Gümüş / Açık Gri
      backgroundColorValue: 0xFFF5F7FA,
    ),
    FurnitureCategory(
      id: 'tv_units',
      name: 'TV & Tamamlayıcı',
      primaryColorValue: 0xFF4A3525, // Fırınlanmış Koyu Ceviz
      accentColorValue: 0xFFBCAAA4,  // Doğal Taş / Traverten
      backgroundColorValue: 0xFFF8F5F2,
    ),
  ];

  // Mock Mobilya Ürün Veritabanı
  static final List<FurnitureProduct> products = [
    const FurnitureProduct(
      id: 'ing-101',
      name: 'Olympos Kapitone Koltuk Takımı',
      categoryId: 'living_room',
      price: 48500.0,
      description: 'Gürgen iskelet üzeri el işçiliği kapitone dikişler. İnegöl\'ün en seçkin silinebilir nubuk kumaşıyla tasarlanmış, 35 DNS HR sünger oturum konforu.',
      materialInfo: '1. Sınıf Fırınlanmış Gürgen İskelet, İthal Nubuk Kumaş',
      dimensions: 'Üçlü: 235x95x82 cm | Berjer: 85x90x95 cm',
      warrantyYears: '5 Yıl İskelet Garantisi',
      imageUrl: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?auto=format&fit=crop&w=800&q=80',
      rating: 4.9,
      itemThemeColor: 0xFF1B4D3E,
      availableFabrics: ['Zümrüt Kadife', 'Antrasit Keten', 'Vizon Nubuk', 'Hardal Dokuma'],
    ),
    const FurnitureProduct(
      id: 'ing-102',
      name: 'Milano Masif Meşe Yemek Odası',
      categoryId: 'dining_room',
      price: 54900.0,
      description: 'Açılabilir masif meşe kaplama yemek masası ve 6 adet ergonomik sırt destekli sandalye. Doğal ağaç dokusunu evinize taşıyan İnegöl ustalığı.',
      materialInfo: 'Doğal Masif Meşe Kaplama, CNC İşlemeli Konsol Gövdesi',
      dimensions: 'Masa: 180x95x78 cm (Açılınca 220 cm) | Konsol: 210x48x85 cm',
      warrantyYears: '3 Yıl Üretici Garantisi',
      imageUrl: 'https://images.unsplash.com/photo-1617806118233-18e1de247200?auto=format&fit=crop&w=800&q=80',
      rating: 4.8,
      itemThemeColor: 0xFF8D5B4C,
      availableFabrics: ['Deri Dokulu Sandalye', 'Keten Kum Beji', 'Antrasit Doku'],
    ),
    const FurnitureProduct(
      id: 'ing-103',
      name: 'Palazzo Lüks Baza & Yatak Odası',
      categoryId: 'bedroom',
      price: 62000.0,
      description: 'Yüksek başlıklı baza, sürgülü reflekte camlı gardırop ve dokunmatik LED aydınlatmalı şifonyer. Modern hatların zarif İnegöl işçiliğiyle buluşması.',
      materialInfo: 'E1 Sertifikalı Çevre Dostu MDF, Amortisörlü Emniyet Kilitli Baza',
      dimensions: 'Baza: 160x200 cm | Dolap: 250x65x220 cm',
      warrantyYears: '4 Yıl Kapsamlı Garanti',
      imageUrl: 'https://images.unsplash.com/photo-1540518614846-7ede433c4ef7?auto=format&fit=crop&w=800&q=80',
      rating: 5.0,
      itemThemeColor: 0xFF2C3E50,
      availableFabrics: ['Gece Mavisi Kadife', 'Koyu Gri Keten', 'İnci Beyazı Deri'],
    ),
    const FurnitureProduct(
      id: 'ing-104',
      name: 'Artemis Masif Mermer TV Ünitesi',
      categoryId: 'tv_units',
      price: 21500.0,
      description: 'Gerçek traverten desenli üst tabla, fırınlanmış ceviz kapak ve sessiz fren sistemli çekmeceler. Minimalist ve estetik salonların tercihi.',
      materialInfo: 'Doğal Ceviz Ağacı & CNC İşlemeli Akrilik Yüzey',
      dimensions: '220x45x50 cm',
      warrantyYears: '3 Yıl Garanti',
      imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
      rating: 4.7,
      itemThemeColor: 0xFF4A3525,
      availableFabrics: ['Doğal Ahşap Dokusu', 'Mat Siyah Detay'],
    ),
    const FurnitureProduct(
      id: 'ing-105',
      name: 'Venedik Chester Köşe Takımı',
      categoryId: 'living_room',
      price: 52000.0,
      description: 'Geniş oturumlu, yatak olabilen mekanizmalı köşe takımı. İtalyan dizaynı ile İnegöl döşeme sanatının muhteşem kombinasyonu.',
      materialInfo: 'Çelik Destekli Ahşap Kasa, Leke Tutmaz Easy-Clean Kumaş',
      dimensions: '310x240x85 cm',
      warrantyYears: '5 Yıl İskelet Garantisi',
      imageUrl: 'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?auto=format&fit=crop&w=800&q=80',
      rating: 4.9,
      itemThemeColor: 0xFF1B4D3E,
      availableFabrics: ['Haki Yeşil', 'Füme Gri', 'Hardal Sarısı', 'Toprak Kahve'],
    ),
    const FurnitureProduct(
      id: 'ing-106',
      name: 'Bohem Doğal Rattan Sehpa Seti',
      categoryId: 'tv_units',
      price: 8900.0,
      description: '3\'lü zigon ve orta sehpa seti. El örmesi doğal hazeran detaylar ve masif ceviz torna ayaklar.',
      materialInfo: 'Doğal Hazeran Rattan & Masif Kayın Ayaklar',
      dimensions: 'Orta: 90x60x45 cm | Yan Sehpalar: 45x45x52 cm',
      warrantyYears: '2 Yıl Garanti',
      imageUrl: 'https://images.unsplash.com/photo-1533090161767-e6ffed986c88?auto=format&fit=crop&w=800&q=80',
      rating: 4.6,
      itemThemeColor: 0xFF4A3525,
      availableFabrics: ['Doğal Rattan Naturel'],
    ),
  ];
}
