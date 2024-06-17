
import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../backend/database_connect.dart';
import '../backend/funciones_app.dart';
import '../backend/funciones_connect.dart';
import '../models/addsModel.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';

class SearchTab extends StatefulWidget {
  final void Function()? onPressedScheduleCard;
  SearchTab({
    Key? key,
    this.onPressedScheduleCard,
  }) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List<Map> categories = [];
  List<Anuncio> listAdds = [];
  List<Anuncio> listAddsGlobal = [];

  @override
  void initState() {
    // TODO: implement initState

    _getAdds();
    super.initState();
  }

  int InitialPage = 0;

  _getAdds() {
    DatabaseProvider.getAdds().then((value) {
      setState(() {
        listAddsGlobal = value;
        listAdds = value;
      });
    });
  }

  _searchPaciente(String query) async {
    return await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        listAdds = [];

        listAdds = listAddsGlobal.where((e) {
          if (removeDiacritics(e.titulo)
              .toLowerCase()
              .contains(removeDiacritics(query).toLowerCase())) {
            return true;
          }

          if (removeDiacritics(e.tipo)
              .toLowerCase()
              .contains(removeDiacritics(query).toLowerCase())) {
            return true;
          }

          return false;
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Header(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      offset: Offset(0.0, 0.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: TextFormField(
                onChanged: (query) {
                  _searchPaciente(query);
                },
                decoration: const InputDecoration(
                  icon: Icon(CupertinoIcons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                  children: listAdds.map((e) {
                return InkWell(
                  onTap: (){
                    FuncionesApp.openAdd(context, e);
                  },
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                offset: Offset(0.0, 0.0), //(x,y)
                                blurRadius: 2.0,
                              ),
                            ],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      e.imagen,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, exception, stackTrace) {
                                        return Image.network(
                                          'https://t3.ftcdn.net/jpg/05/04/28/96/360_F_504289605_zehJiK0tCuZLP2MdfFBpcJdOVxKLnXg1.jpg',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${e.titulo}',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '${FuncionesProvider.formatCurrency(e.precio)}',
                                        style: kTitleStyle.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: kTitleStyle.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )));
              }).toList()),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(120))),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Text(
            "Buscador Anuncio",
            style: GoogleFonts.getFont('Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Color(MyColors.bg01)),
          ),
        ),
      ],
    );
  }
}
