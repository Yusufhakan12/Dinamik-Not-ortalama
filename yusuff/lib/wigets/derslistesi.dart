import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/helper/data.dart';
import 'package:flutter_application_1/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  
  const DersListesi({ required this.onElemanCikarildi, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders>tumdersler=DataHelper.tumeklenecekDersler;
    return tumdersler.length>0 ? ListView.builder(itemCount:tumdersler.length ,itemBuilder: (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
          onElemanCikarildi(index);
          

        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(tumdersler[index].ad),
              leading: CircleAvatar(
                backgroundColor: sabitler.anaRenk,
                child: Text((tumdersler[index].harfDegeri*tumdersler[index].krediDegeri).toStringAsFixed(0)),
              ),
              subtitle: Text('${tumdersler[index].krediDegeri} kredi,Not Değeri ${tumdersler[index].harfDegeri}'),
      
            ),
          ),
        ),
      );

    }
    ) : Container(child: Center(child: Text('Lütfen Ders Ekleyin',style: sabitler.baslikStyle,)),);
  }
}