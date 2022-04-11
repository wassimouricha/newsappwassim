import 'package:flutter/material.dart';
import 'package:newsappwassim/model.dart';
import 'package:newsappwassim/const.dart';
import 'package:newsappwassim/const.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class ReadingNews extends StatelessWidget {
  final NewsApiModel model;

  const ReadingNews({required this.model, Key? key}) : super(key: key);
  
    
      //ma fon,ction pour ouvrir le site de l'article
    void _launchURL() async {
    if (!await launch(model.url,
      forceWebView: true,
      enableJavaScript: true,)) throw 'Impossible de lancer $model.url';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: getColors[1],
        appBar: AppBar(
          //ici je code mon app bar qui me redirige vers l'accueil
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
                    child: Text("Wassim News App",
                        style: TextStyle(fontSize: 15, color: Colors.black)),
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
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //le container de l'image
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                SizedBox(height: 10,),
                 Container(
                  width: size.width / 1.05,
                  child: Text(
                    getTruncatedContent(model.content,200),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                       
                SizedBox(
                  height: 10,
                ),
                //l'hyperlien permettant d'acceder à l'article 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                Container(
                  width: size.width / 1.05,
                  child:
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "Pour lire la suite de l'article  ",
                        style: TextStyle(fontSize: 18,
                        color: Colors.black,
                      fontWeight: FontWeight.w500,),
                      ),
                      TextSpan(
                          text: "Cliquez ici",
                          style: const TextStyle(
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
                ],),
                  SizedBox(height: 15),
                //l'auteur de l'article et la date de sa publication
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Text(
                        ("Auteur: ") + getTruncatedContent(model.author,20),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        ("Publié le ") + model.publishedAt,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
              
              ],),
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
