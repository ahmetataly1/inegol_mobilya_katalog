import 'package:flutter/material.dart';
import 'screens/catalog_screen.dart';

void main() {
  runApp(const InegolMobilyaApp());
}

class InegolMobilyaApp extends StatelessWidget {
  const InegolMobilyaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'İnegöl Mobilya Kataloğu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Varsayılan malzeme teması
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFFBF9F7),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const CatalogScreen(),
    );
  }
}
