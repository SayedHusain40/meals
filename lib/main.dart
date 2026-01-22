import 'package:flutter/material.dart';
import 'package:meals/screens/main_tabs.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 131, 57, 0),
        ),
      ),
      home: const MainTabs(),
    ),
  );
}
