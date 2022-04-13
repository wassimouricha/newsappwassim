// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:newsappwassim/const.dart';
import 'package:newsappwassim/businesscreen/modelbusiness.dart';
import 'package:newsappwassim/businesscreen/biz_api.dart';
import 'package:newsappwassim/businesscreen/biz_screened.dart';
import 'package:newsappwassim/home_screen.dart';
import 'package:newsappwassim/entertainementscreen/ent_screen.dart';
import 'package:newsappwassim/santescreen/sante_screen.dart';
import 'package:newsappwassim/sportscreen/sport_screen.dart';
import 'package:newsappwassim/sciencescreen/science_screen.dart';
import 'package:newsappwassim/techscreen/tech_screen.dart';
import 'package:newsappwassim/messageac.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:newsappwassim/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class BizScreen extends StatefulWidget {
  const BizScreen({Key? key}) : super(key: key);

  @override
  _BizScreenState createState() => _BizScreenState();
}

class _BizScreenState extends State<BizScreen> {
  List<BizApiModel>? bizList;
  bool isLoading = true;
  var currentIndex = 0;

  void changePage(var index) {
    setState(() {
      currentIndex = index;
    });
  }

  late final List<BubbleBottomBarItem> items;
  @override
  void initState() {
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          bizList = value;
          isLoading = false;
        } else {
          print("La liste est vide");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: getColors[1],
      appBar: AppBar(
        //ici je code mon app bar qui me redirige vers mon drawer
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: Image.asset("image/pngegg.png"),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                Text("Wassim News App v1.2",
                    style: GoogleFonts.poppins(fontSize: 15, color: Colors.black)),
              ],
            )),
        titleSpacing: 0,
      ),
      drawer: const NavigationDraweer(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
              ExpansionTile(title: Text('Business',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
         textAlign: TextAlign.center,
        ),
        
        children: [
          ListTile(title: Text('Général',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen())),
        ),
         ListTile(title: Text('Sport',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SportScreen())),
        ),
          ListTile(title: Text('Science',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const ScienceScreen())),
        ),
          ListTile(title: Text('Santé',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SanteScreen())),
        ),
         ListTile(title: Text('Tech',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const TechScreen())),
        ),
         ListTile(title: Text('Entertainement',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const EntScreen())),
        ),
        ],
        ),
            const SizedBox(
              height: 10,
            ),
            const WelcomeWidget(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            isLoading
                ? SizedBox(
                    height: size.height / 20,
                    width: size.height / 20,
                    child: const CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: bizList!.length,
                      itemBuilder: (context, index) {
                        return listItems(size, bizList![index]);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget listItems(Size size, BizApiModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => Readingbiz(
              model: model,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          width: size.width / 1.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          child: Column(
            children: [
              Container(
                //le container de mon image
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: model.imageUrl != ""
                    ? Image.network(
                        model.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : const Text("Impossible de charger"),
              ),
              Container(
                //le container de mon titre
                width: size.width / 1.1,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  model.title,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //container de la description
              // Container(
              //   width: size.width / 1.1,
              //   padding: EdgeInsets.symmetric(vertical: 5),
              //   child: Text(
              //     model.description,
              //     style: TextStyle(
              //       fontSize: 13,
              //     ),
              //   ),
              // ),
              Container(
                  //Mon container pour la partie date de publication en bas à droite
                  width: size.width / 1.1,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ("Auteur: ") + getTruncatedContent(model.author,20),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        ("Publié le ") + getTruncatedContent(model.publishedAt, 20),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
      //fonction permettant de mettre des pointillé afin de ne pas mettre tout le texte et donc pas d'overflow
  String getTruncatedContent(String text, int truncatedNumber) {
    return text.length > truncatedNumber
        ? text.substring(0, truncatedNumber) + "..."
        : text;
  }
}
