import 'dart:convert';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/addsModel.dart';


class DatabaseProvider {
  static const ROOT = "https://okutv.com/test/";
  static const ROOTADDS = ROOT+"adds.php";

  static const version = "1.0.3";



  static showMessageError(
      BuildContext context, String titulo, String mensaje) async {
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger, title: titulo, text: mensaje),
    );
  }
  static String getFormatDate(DateTime fecha){
    DateFormat formatter = DateFormat.yMMMMd().add_jm();

    // Formatear la fecha
    String formattedDate = formatter.format(fecha);
    return formattedDate;
  }


  static Future<List<Anuncio>> getAdds() async {

    var response = await http.get(Uri.parse(ROOTADDS),
        headers: {"Content-Type": "application/json"} );
    if (response.statusCode == 200) {

      List<Anuncio> list = parseAdds(json.decode(response.body));

      return list;
    } else {
      throw <Anuncio>[];
    }
  }
  static List<Anuncio> parseAdds(Map<String, dynamic> responseBody) {

    List<dynamic> detallesjson =  responseBody['anuncios'];
    return detallesjson.map<Anuncio>((json) => Anuncio.fromJson(json)).toList();
  }


}
