# İnegöl Mobilya - Mini Katalog Uygulaması

Flutter Günlük Eğitim Programı kapsamında geliştirilmiş, yalnızca Flutter SDK'nın dahili `material.dart` bileşenlerini kullanan, modern ve dinamik temalı mobilya katalog mobil uygulaması.

---

## 📌 Proje Açıklaması
Bu uygulama, İnegöl Mobilyası'nın zarafetini ve el işçiliğini dijital ortama aktarır. Kullanıcı seçtiği mobilya kategorisine göre (Koltuk Takımı, Yemek Odası, Yatak Odası, TV Ünitesi) arayüzün renk temasını dinamik olarak değiştirir.

### 🌟 Öne Çıkan Özellikler:
* **Sıfır Dış Paket Bağımlılığı:** Hiçbir üçüncü parti paket kullanılmamış, tüm mimari saf Flutter `material.dart` ile kurulmuştur.
* **Ortalanmış Menü Başlığı:** AppBar üzerinde tam ortalanmış "İNEGÖL MOBİLYA MENÜSÜ" kurumsal başlığı.
* **Mobilyaya Göre Dinamik Renk Teması:** 
  * *Tüm Koleksiyon:* Sıcak Meşe & Ceviz Ahşap Tonu (`#5D4037`)
  * *Koltuk & Salon:* Zümrüt Yeşili Kadife & Altın Detay (`#1B4D3E`)
  * *Yemek Odası:* Masif Ahşap & Terracotta Kiremit Tonu (`#8D5B4C`)
  * *Yatak Odası:* Antrasit Kumaş & Gece Mavisi Tonu (`#2C3E50`)
  * *TV & Tamamlayıcı:* Fırınlanmış Koyu Ceviz Tonu (`#4A3525`)
* **3 Ana Ekran Mimarisi:**
  1. **Katalog & Keşfet Ekranı:** Arama filtresi, kategori çipleri, 2 sütunlu `GridView` ürün kartları ve sepet rozeti.
  2. **Ürün Detay Ekranı:** `SliverAppBar` ile büyük görsel, ölçüler, garanti ve malzeme bilgileri, interaktif kumaş/renk kartelası seçimi.
  3. **Sepet & Teklif Ekranı:** Dinamik ürün listesi, boş sepet durumu, toplam tutar hesaplama ve teklif talep simülasyonu.
* **JSON Simülasyonu:** `fromJson` ve `toJson` fonksiyonlarıyla veri modeli serialization yapısı.

---

## 🛠 Kullanılan Teknolojiler & Sürüm
* **Flutter SDK:** `>= 3.0.0`
* **Dart SDK:** `>= 3.0.0`
* **Paketler:** Sadece standart Flutter `material.dart` (Harici paket kullanılmamıştır).

---

## 🚀 Projeyi Çalıştırma Adımları

1. Proje dizinine gidin:
```bash
cd inegol_mobilya_katalog
```

2. Paketleri doğrulayın:
```bash
flutter pub get
```

3. Uygulamayı bağlı bir emülatörde veya fiziksel cihazda çalıştırın:
```bash
flutter run
```

---

## 📱 Ekran Yapısı ve Klasör Mimarisi
```
lib/
├── main.dart                  # Uygulama başlangıcı ve temel MaterialApp
├── models/
│   ├── category.dart          # Kategori ve dinamik renk modeli
│   └── product.dart           # Mobilya ürün modeli (fromJson/toJson)
├── data/
│   └── furniture_data.dart    # Mock ürünler ve dinamik renk paletleri
├── screens/
│   ├── catalog_screen.dart    # Ortalanmış menülü katalog & arama ekranı
│   ├── detail_screen.dart     # Ürün detay & kumaş seçim ekranı
│   └── cart_screen.dart       # Teklif & sepet ekranı
└── widgets/
    ├── category_chip.dart     # Dinamik renkli kategori çipi
    └── product_card.dart      # GridView mobilya ürün kartı
```
