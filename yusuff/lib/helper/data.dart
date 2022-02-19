import 'package:flutter/material.dart';

import '../model/ders.dart';

class DataHelper{
  static List<Ders>tumeklenecekDersler=[

  ];
  static dersEkle(Ders ders){
    tumeklenecekDersler.add(ders);
  }

static List<String> tumDerslerHarfNotu(){
  return ['AA','BA','BB','CB','CC','DC','DD','FD','FF'];
}
static  ortalamaHesapla(){
  double toplamNot=0;
  double toplamKredi=0;
  tumeklenecekDersler.forEach((element) {
    toplamNot=toplamNot+(element.krediDegeri*element.harfDegeri);
    toplamKredi+=element.krediDegeri;
  }
  );
return toplamNot/toplamKredi;
}

static double ?harfNotunuCevir(String harf){
  switch(harf){
    case 'AA':
    return 4;
    case 'BA':
    return 3.5;
    case 'BB':
    return 3.0;
    case 'CB':
    return 2.5;
    case 'CC':
    return 2;
    case 'DC':
    return 1.5;
    case 'DD':
    return 1;
    case 'FD':
    return 0.5;
    case 'FF':
    return 0.0;
    
  }
}
static List<DropdownMenuItem<double>> ?tumderslerinHarfleri(){
return tumDerslerHarfNotu().map((e) => DropdownMenuItem(child: Text(e),value:harfNotunuCevir(e) ,)).toList();
}
static List <int> tumKrediler(){
  return List.generate(10, (index) => index+1).toList();
}
static List<DropdownMenuItem<double>>tumderslerinKredileri(){
  return tumKrediler().map((e) => DropdownMenuItem(child: Text(e.toString()),value: e.toDouble(),)).toList();
}
}