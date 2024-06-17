
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FuncionesProvider {

  //---------------------------------------
  //---------------------------INICIO ERROR
  //---------------------------------------
  static showMessageError(BuildContext context, String titulo,
      String mensaje) async {
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger, title: titulo, text: mensaje),
    );
  }

  //---------------------------------------
  //------------------------------FIN ERROR
  //---------------------------------------


  //---------------------------------------
  //-------------------------FORMATO DINERO
  //---------------------------------------
  static String formatCurrency(double amount) {
    NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
    );
    return currencyFormat.format(amount);
  }

  //---------------------------------------
  //---------------------FIN FORMATO DINERO
  //---------------------------------------

  //---------------------------------------
  //-------------------------FORMATO DOBLES
  //---------------------------------------
  static String formatDouble(double amount) {
    NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'en_US',
      symbol: '',
    );
    return currencyFormat.format(amount);
  }
//---------------------------------------
//---------------------FIN FORMATO DOBLES
//---------------------------------------
}