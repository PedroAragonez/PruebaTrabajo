

import 'package:prueba/screen/Contact.dart';
import 'package:prueba/screen/DetallesAnuncio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/addsModel.dart';

class FuncionesApp {

//----------------------------------------------------------
// SECTION OF URLS
//----------------------------------------------------------

  static openAdd(
      BuildContext context, Anuncio add) async {
    Route perfilScreen = MaterialPageRoute(
        builder: (context) => DetallesAnunci(
              anuncioSelected: add,
            ));
    await Navigator.push(context, perfilScreen);
  }




 static Widget dividerWidget() {
    return FractionallySizedBox(
      widthFactor: 0.2, // width of top divider bar
      child: Container(
        margin: const EdgeInsets.symmetric(
          // margin of top divider bar
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: Colors.white, // color of top divider bar
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }

  static showContactDialog(
      BuildContext context, Anuncio add) async {
    // launch(_url, forceWebView: true, enableJavaScript: true);

    return showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      useSafeArea: true,
      context: context,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          topStart: Radius.circular(25),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
          bottom: 30,
          top: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            dividerWidget(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // color of card
                borderRadius:
                const BorderRadius.all(Radius.circular(16.0)),
              ),
              width: double.infinity,
              child: Container(
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .6,
                  child: Contact(
                   anuncio: add,
                  )),
            ),
          ],
        ),
      ),
    ).then((value) {
    });
  }



//----------------------------------------------------------
// END SECTION OF URLS
//----------------------------------------------------------




}
