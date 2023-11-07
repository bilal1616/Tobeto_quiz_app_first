// Flutter materyal tasarım kütüphanesini içeri aktarır.
import 'package:flutter/material.dart';
// 'start_screen.dart' dosyasını içeri aktarır. Bu dosya başlangıç ekranının görünümünü tanımlar.
import 'start_screen.dart';

void main() {
  // Flutter uygulamasını başlatır.
  runApp(
    // MaterialApp, uygulamanın temel yapı taşıdır ve uygulamanın genel tema ve yapılandırmasını sağlar.
    const MaterialApp(
      // Ana sayfa olarak 'StartScreen' sınıfından bir örneği kullanır. 
      home: StartScreen(),
    ),
  );
}
