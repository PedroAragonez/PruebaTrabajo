import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:prueba/backend/funciones_app.dart';
import 'package:prueba/backend/funciones_connect.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/addsModel.dart';
import '../styles/colors.dart';

class DetallesAnunci extends StatefulWidget {
  Anuncio anuncioSelected;
  DetallesAnunci({
    Key? key,
    required this.anuncioSelected,
  }) : super(
          key: key,
        );

  @override
  _DetallesAnunciState createState() => _DetallesAnunciState();
}

class _DetallesAnunciState extends State<DetallesAnunci> {
  List<Map> categories = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  List<String> ImageList = [
    "https://concepto.de/wp-content/uploads/2015/03/nutricion-1-e1550713442289.jpg",
    "https://concepto.de/wp-content/uploads/2015/03/nutriccion-2-e1550713244467.jpg",
    "https://concepto.de/wp-content/uploads/2015/03/nutricion-3-e1550713101401.jpg",
    "https://concepto.de/wp-content/uploads/2015/03/Piramide-alimenticia-e1640876100831.png"
  ];
  int InitialPage = 0;
  CarouselController _controller = CarouselController();

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
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              HeaderDetalle(),
              if (ImageList != null && ImageList.isNotEmpty)
                CarouselSlider(
                    carouselController: _controller,
                    items: ImageList.map((ImageList) {
                      return Builder(builder: (BuildContext context) {
                        return InkWell(
                            onTap: () {},
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      image: NetworkImage(ImageList),
                                      fit: BoxFit.cover)),
                            ));
                      });
                    }).toList(),
                    options: CarouselOptions(
                      height: 150.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          InitialPage = index;
                        });
                      },
                    )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${widget.anuncioSelected.titulo}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                        child: Text(
                          'Mapa',
                          style: TextStyle(
                            color: MyColors.yellow01,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          launch(
                              'https://www.google.com/maps/search/?api=1&query=${widget.anuncioSelected.latitud}%2C${widget.anuncioSelected.longitud}&hl=es-419');
                        },
                      )
                    ],
                  )
                ],
              ),
              Text(
                '${FuncionesProvider.formatCurrency(widget.anuncioSelected.precio)}',
                maxLines: 50,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                maxLines: 50,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FuncionesApp.showContactDialog(
                        context, widget.anuncioSelected);
                  },
                  child: Material(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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
                          color: MyColors.yellow01,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Contactar Vendedor',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
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

class HeaderDetalle extends StatelessWidget {
  HeaderDetalle({Key? key}) : super(key: key);

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
            "Detalle Anuncio",
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
