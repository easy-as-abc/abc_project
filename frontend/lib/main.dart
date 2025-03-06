// lib/main.dart
import 'package:flutter/material.dart';
import 'navigation/routes.dart';
import 'navigation/bottom_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      onGenerateRoute: Routes.generateRoute, // 네비게이션 라우트 관리
      home: BottomNav(), // 하단 네비게이션 바 사용
    );
  }
}
