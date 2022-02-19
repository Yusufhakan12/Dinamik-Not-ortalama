import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/helper/data.dart';
import 'package:flutter_application_1/wigets/derslistesi.dart';
import 'package:flutter_application_1/wigets/ortalama_goster.dart';

import '../model/ders.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({ Key? key }) : super(key: key);

  @override
  _OrtalamaHesaplaState createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  double secilenDeger=4;
  double secilenKrediDeger=1;
  String secilenDersAdi='';

  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Text(sabitler.baslikText,style: sabitler.baslikStyle,),
        
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
            child: buildForm(),
            ),
             Expanded(
                flex: 1,
            child: ortalamagoster(dersSayisi: DataHelper.tumeklenecekDersler.length, 
            ortalama: DataHelper.ortalamaHesapla())
            )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: DersListesi(
              
              onElemanCikarildi: (index){
                DataHelper.tumeklenecekDersler.removeAt(index);
                setState(() {
                  
                });

              },
            ),
          )
        ],

      )
    );
  }

  buildForm() {
    return Form(
      key: formkey,
      child: Column(

        
        children: [
          Padding(
            padding: sabitler.yatayPadding8,
            child: buildTextFormField(),
            ),
            SizedBox(
              height: 5,
            ),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          
            children: [
              Expanded(
                child: Padding(
                  padding:sabitler.yatayPadding8,
                  child: buildHarfler(),
                   ),
              ),
                 Expanded(
                   child: Padding(
                    padding:sabitler.yatayPadding8,
                     child: buildKrediler(),
                   ),
                 ),
            
            
            
           IconButton(
             onPressed: DersEkleVeOrtalamaHesapla,
           icon: Icon(Icons.arrow_forward_ios_sharp),
           color: sabitler.anaRenk,
           iconSize: 30,
            )
            ]
            
          )
        ],
      ),
    );
  }

  buildTextFormField() {
    return TextFormField(
      onSaved: (deger){
        setState(() {
          secilenDersAdi=deger!;
        });
      },
      validator: (s){
        if(s!.length<=0){
          return 'Ders Adını Giriniz';
        }else return null;
      },
      decoration: 
      
      InputDecoration(
        hintText: 'Ders Adı Giriniz',
        border: OutlineInputBorder(
          borderRadius: sabitler.borderRadius,borderSide: BorderSide.none
          
        ),
        
        filled: true,
        fillColor: sabitler.anaRenk.shade100.withOpacity(0.2)
      ),
    );
  }

  buildHarfler() {
    
    return Container(
      alignment: Alignment.center,
      padding: sabitler.dropDownPadding,
      
      decoration: BoxDecoration(
        color: sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: sabitler.borderRadius
      ),
      child:  DropdownButton<double>(
        value: secilenDeger,
        onChanged: (deger){
          setState(() {
            secilenDeger=deger!;
          });
        },
        items: 
            DataHelper.tumderslerinHarfleri(),
        underline: Container() ,
      ),
    );
  }
   buildKrediler() {
    
    return Container(
      alignment: Alignment.center,
      padding: sabitler.dropDownPadding,
      
      decoration: BoxDecoration(
        color: sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: sabitler.borderRadius
      ),
      child:  DropdownButton<double>(
        value: secilenKrediDeger,
        onChanged: (deger){
          setState(() {
            secilenKrediDeger=deger!;
          });
        },
        items: 
            DataHelper.tumderslerinKredileri(),
        underline: Container() ,
      ),
    );
  }

  void DersEkleVeOrtalamaHesapla() {
    
    if(formkey.currentState!.validate()){
      formkey.currentState!.save();
      var eklenecekDers=Ders(ad:secilenDersAdi,harfDegeri: secilenDeger,
      krediDegeri: secilenKrediDeger
      );
      DataHelper.dersEkle(eklenecekDers);
      setState(() {
        
      });
    }

  }
}