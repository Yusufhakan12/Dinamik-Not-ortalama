import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';

class ortalamagoster extends StatelessWidget {
  const ortalamagoster({required this.dersSayisi,required this.ortalama, Key? key }) : super(key: key);
  final double ortalama;
  final int dersSayisi;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? '$dersSayisi Ders girildi':'Ders seçiniz',
          style: sabitler.DersSayisiStyle,
        ),
         Text(ortalama>0 ? ortalama.toStringAsFixed(2):'0.0',style: sabitler.OrtalamaStyle,),
          Text('Ortalama',style: sabitler.DersSayisiStyle,)
      ],
    );
  }
}