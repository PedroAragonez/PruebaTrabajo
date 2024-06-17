import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/addsModel.dart';
import '../styles/colors.dart';
import '../theme/theme.dart';

class Contact extends StatefulWidget {
  Anuncio anuncio;
  Contact({Key? key, required this.anuncio}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Widget _dividerWidget() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(MyColors.primary),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),

              Padding(
                padding:
                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 10),
                child: Container(
                  width: 60 ,
                  height: 60,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x9B000000).withOpacity(.3),
                          offset: Offset(0.0, 0.0), //(x,y)
                          blurRadius: 20.0,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(120))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.network(
                       'https://enar.com.mx/admin/assets/img/users/no-avatar.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  "John Smith",
                  style: GoogleFonts.getFont('Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Color(MyColors.bg01)),
                ),
              ),
              Container(

                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                child: Text(
                  "Llamar",
                  style: GoogleFonts.getFont('Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(MyColors.bg01)),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(

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
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,

                    child: Icon(
                      CupertinoIcons.phone,
                      color: Color(MyColors.bg01),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Text(
                    'Mobile',
                    style: TextStyle(
                      color: Color(MyColors.bg01),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                    Text(
                      '+52 614 100 0000',
                      style: TextStyle(
                        color: Color(MyColors.bg01),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),],),),

                ],
              ),
            ),
          ),

              Container(

                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                child: Text(
                  "Correo Electronico",
                  style: GoogleFonts.getFont('Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(MyColors.bg01)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(5),
                child: Container(
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
                      borderRadius:
                      BorderRadius.all(Radius.circular(15))),
                  child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        labelStyle:
                        ThemePA.of(context).title3,
                        hintText: 'Nombre',
                        hintStyle:
                        ThemePA.of(context).title3,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          CupertinoIcons.textformat_alt,
                          color: ThemePA.of(context)
                              .grayDark,
                          size: 25,
                        ),
                      ),
                      style: ThemePA.of(context).title3),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(5),
                child: Container(
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
                      borderRadius:
                      BorderRadius.all(Radius.circular(15))),
                  child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Correo Contacto',
                        labelStyle:
                        ThemePA.of(context).title3,
                        hintText: 'Correo Contacto',
                        hintStyle:
                        ThemePA.of(context).title3,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          CupertinoIcons.mail,
                          color: ThemePA.of(context)
                              .grayDark,
                          size: 25,
                        ),
                      ),
                      style: ThemePA.of(context).title3),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.all(5),
                child: Container(
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
                      borderRadius:
                      BorderRadius.all(Radius.circular(15))),
                  child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Texto Correo',
                        labelStyle:
                        ThemePA.of(context).title3,
                        hintText: 'Texto Correo',
                        hintStyle:
                        ThemePA.of(context).title3,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          CupertinoIcons.text_bubble,
                          color: ThemePA.of(context)
                              .grayDark,
                          size: 25,
                        ),
                      ),
                      style: ThemePA.of(context).title3),
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {

                  },
                  child: Material(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Container(
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
                          color: MyColors.yellow01,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(

                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 5,0, 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Enviar Correo',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ) ,

                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
