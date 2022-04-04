import 'package:flutter/material.dart';
import 'package:newsappwassim/modelsport.dart';
import 'package:newsappwassim/const.dart';
import 'package:newsappwassim/const.dart';
import 'package:url_launcher/url_launcher.dart';



class Readingsport extends StatelessWidget {
  final SportApiModel model;

  const Readingsport({required this.model, Key? key}) : super(key: key);

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
                      color: Colors.blue,
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                Container(
                  width: size.width / 1.05,
                  child: Text(
                    model.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                 Container(
                  width: size.width / 1.05,
                  child: Text(
                   "Pour lire la suite de l'article allez sur " +  model.url,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
