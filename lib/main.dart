import 'package:flutter/material.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color.fromARGB(255, 131, 57, 0),
          ),
        ),
        home: TabsScreen(),
      ),
    ),
  );
}
