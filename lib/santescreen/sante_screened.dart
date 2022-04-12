import 'package:flutter/material.dart';
import 'package:newsappwassim/santescreen/modelsante.dart';
import 'package:newsappwassim/const.dart';
import 'package:newsappwassim/const.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

class Readingsante extends StatelessWidget {
  final SanteApiModel model;

  const Readingsante({required this.model, Key? key}) : super(key: key);

  //ma fon,ction pour ouvrir le site de l'article
  void _launchURL() async {
    if (!await launch(
      model.url,
      forceWebView: true,
      enableJavaScript: true,
    )) throw 'Impossible de lancer $model.url';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: getColors[1],
        appBar: AppBar(
          //ici je code mon app bar qui me redirige vers mon drawer
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text("Wassim News App v1.2",
                        style:  GoogleFonts.poppins(fontSize: 15, color: Colors.black)),
                  ),
                ],
              )),
          titleSpacing: 0,
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: size.width / 1.05,
                  child: Text(
                    model.title,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: size.height / 3,
                  width: size.width / 1.05,
                  alignment: Alignment.center,
                  child: model.imageUrl != ""
                      ? Image.network(
                          model.imageUrl,
                          fit: BoxFit.cover,
                        )
                      : Text(
                          "Impossible de charger l'image",
                          style:  GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                Container(
                  width: size.width / 1.05,
                  child: Text(
                    getTruncatedContent(model.content, 200),
                    style:  GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                 Row(
                   
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Container(
                        width: size.width / 1.05,
                        child: 
                      Column( children:[
                           Text(
                        ("Auteur: ") + getTruncatedContent(model.author,20),
                        style:  GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ("Publié le ") + model.publishedAt,
                        style:  GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                       ], ),),
                     
                    ],
                  ),
                    SizedBox(height: 5,),
                Container(
                  width: size.width / 1.05,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                       TextSpan(
                        text: "Pour lire la suite de l'article  ",
                        style:  GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                          text: "Cliquez ici",
                          style:   GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              _launchURL();
                            }),
                    ]),
                  ),
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getTruncatedContent(String text, int truncatedNumber) {
    return text.length > truncatedNumber
        ? text.substring(0, truncatedNumber) + "..."
        : text;
  }
}
