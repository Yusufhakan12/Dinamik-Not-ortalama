
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/wigets/ortalamahesapla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik Ortalama Hesapla',
      theme: ThemeData(
        primarySwatch: sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: OrtalamaHesapla(),
      
    );
  }
}