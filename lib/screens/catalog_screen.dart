import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../data/furniture_data.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  // Seçili kategori (Varsayılan: Tümü - İnegöl Masif Ahşap tonu)
  FurnitureCategory _selectedCategory = FurnitureData.categories.first;
  String _searchQuery = '';
  final List<FurnitureProduct> _cartItems = [];

  // Mobilya türüne göre dinamik tema rengi
  Color get _currentPrimaryColor => Color(_selectedCategory.primaryColorValue);
  Color get _currentBgColor => Color(_selectedCategory.backgroundColorValue);

  // Kategoriye ve arama kelimesine göre filtrelenmiş ürün listesi
  List<FurnitureProduct> get _filteredProducts {
    return FurnitureData.products.where((product) {
      final matchesCategory = _selectedCategory.id == 'all' ||
          product.categoryId == _selectedCategory.id;
      final matchesSearch = product.name
              .toLowerCase()
              .contains(_searchQuery.toLowerCase()) ||
          product.description.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void _addToCart(FurnitureProduct product) {
    setState(() {
      _cartItems.add(product);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${product.name} sipariş/teklif listesine eklendi!',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: _currentPrimaryColor,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Sepete Git',
          textColor: Colors.white,
          onPressed: _openCartScreen,
        ),
      ),
    );
  }

  void _openCartScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(
          cartItems: _cartItems,
          primaryColor: _currentPrimaryColor,
          onItemRemoved: (product) {
            setState(() {
              _cartItems.remove(product);
            });
          },
          onClearCart: () {
            setState(() {
              _cartItems.clear();
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _currentBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _currentPrimaryColor,
        // İstenen: Tam ortada Menü Yazısı
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              'İNEGÖL MOBİLYA MENÜSÜ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'ÖZEL ATÖLYE KATALOĞU',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w300,
                letterSpacing: 1.5,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          // Sepet / Teklif Listesi Butonu
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
              child: Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
                    onPressed: _openCartScreen,
                  ),
                  if (_cartItems.isNotEmpty)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFC5A059), // Altın Vurgu
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Text(
                          _cartItems.length.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Dinamik Renkli Üst Bilgi & Banner Alanı
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            decoration: BoxDecoration(
              color: _currentPrimaryColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Arama Kutusu
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        _searchQuery = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Koltuk, yemek masası veya yatak ara...',
                      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                      prefixIcon: Icon(Icons.search, color: _currentPrimaryColor),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // İnegöl Sanatı Vurgu Metni
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seçili Koleksiyon: ${_selectedCategory.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${_filteredProducts.length} Mobilya',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Yatay Kaydırılabilir Mobilya Katalog Seçimleri
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: FurnitureData.categories.length,
              itemBuilder: (context, index) {
                final category = FurnitureData.categories[index];
                return CategoryChip(
                  category: category,
                  isSelected: _selectedCategory.id == category.id,
                  activePrimaryColor: Color(category.primaryColorValue),
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          // Ürünler GridView Alanı
          Expanded(
            child: _filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inventory_2_outlined,
                            size: 64, color: Colors.grey.shade400),
                        const SizedBox(height: 12),
                        Text(
                          'Bu kategoride mobilya bulunamadı.',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 0.68,
                    ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return ProductCard(
                        product: product,
                        themeColor: Color(product.itemThemeColor),
                        onAddToCart: () => _addToCart(product),
                        onTap: () {
                          // Detay Ekranına Geçiş ve Ürün Verisinin Aktarımı
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                product: product,
                                onAddToCart: () => _addToCart(product),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
