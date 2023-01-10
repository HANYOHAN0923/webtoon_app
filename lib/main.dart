import 'package:flutter/material.dart';
import 'package:webtoon_app/screen/tap_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 위젯은 key라는 ID를 갖고 있고, 이 ID는 위젯을 식별하기 위해 사용된다.

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TabScreen(),
    );
  }
}
