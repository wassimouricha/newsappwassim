import 'package:flutter/material.dart';
import 'package:newsappwassim/const.dart';
import 'package:newsappwassim/sportscreen/modelsport.dart';
import 'package:newsappwassim/sportscreen/sport_api.dart';
import 'package:newsappwassim/sportscreen/sport_screened.dart';
import 'package:newsappwassim/santescreen/sante_screen.dart';
import 'package:newsappwassim/sciencescreen/science_screen.dart';
import 'package:newsappwassim/home_screen.dart';
import 'package:newsappwassim/techscreen/tech_screen.dart';
import 'package:newsappwassim/businesscreen/biz_screen.dart';
import 'package:newsappwassim/entertainementscreen/ent_screen.dart';
import 'package:newsappwassim/newscarousel.dart';
import 'package:newsappwassim/messageac.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:newsappwassim/user_page.dart';
import 'package:newsappwassim/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

class SportScreen extends StatefulWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  _SportScreenState createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {
  List<SportApiModel>? sportList;
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
          sportList = value;
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
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: Image.asset("image/pngegg.png"),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                ),
                Container(
                  child: Text("Wassim News App v1.2",
                      style: GoogleFonts.poppins(fontSize: 15, color: Colors.black)),
                ),
              ],
            )),
        titleSpacing: 0,
      ),
      drawer: const NavigationDrawer(),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
              ExpansionTile(title: Text('Sport',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w300),
         textAlign: TextAlign.center,
        ),
        
        children: [
          ListTile(title: Text('Général',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w300),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen())),
        ),
         ListTile(title: Text('Santé',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w300),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SanteScreen())),
        ),
          ListTile(title: Text('Science',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w300),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ScienceScreen())),
        ),
           ListTile(title: Text('Tech',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w300),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => TechScreen())),
        ),
            ListTile(title: Text('Business',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w300),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => BizScreen())),
        ),
         ListTile(title: Text('Entertainement',
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w300),
         textAlign: TextAlign.center,
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => EntScreen())),
        ),
        ],
        ),
            SizedBox(
              height: 10,
            ),
            WelcomeWidget(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            isLoading
                ? Container(
                    height: size.height / 20,
                    width: size.height / 20,
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: sportList!.length,
                        itemBuilder: (context, index) {
                          return listItems(size, sportList![index]);
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget listItems(Size size, SportApiModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => Readingsport(
              model: model,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          width: size.width / 1.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
          child: Column(
            children: [
              Container(
                //le container de mon image
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: model.imageUrl != ""
                    ? Image.network(
                        model.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Text("Impossible de charger"),
              ),
              Container(
                //le container de mon titre
                width: size.width / 1.1,
                padding: EdgeInsets.symmetric(vertical: 5),
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
                  padding: EdgeInsets.symmetric(vertical: 5),
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
                        ("Publié le ") + getTruncatedContent(model.publishedAt,10),
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

//mon drawer = ma sidebar

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
       
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      );
}

//le widget du header du drawer/sidebar
Widget buildHeader(BuildContext context) => Material(
      color: Colors.blue,
      child: InkWell(
        onTap: () {
          //pour fermer le navigation drawer
          Navigator.pop(context);
          //pour rediriger vers la page
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const UserPage(),
          ));
        },
        child: Container(
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    'https://media-exp1.licdn.com/dms/image/D4E03AQHKyal9OiD12g/profile-displayphoto-shrink_800_800/0/1648624925960?e=2147483647&v=beta&t=NimRdFpaBcn7mrK3Abem2USfCRhEsZ8K7-h8NAQ9xYY'),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Wassim Bouricha",
                style: GoogleFonts.poppins(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "wbouricha5@gmail.com",
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );

//le widget du menu du drawer/sidebar
Widget buildMenuItems(BuildContext context) => Container(
      
      child: Wrap(
        runSpacing: 16, //espace vertical
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title:  Text(
                'Accueil' ,  style:  GoogleFonts.poppins(fontSize: 25, color: Colors.white),), //je peux remplacement pushreplacement par push pour avoir le bouton en haut a gauche pour revenir
            //il faut cependant ajouter Navigator.pop(context); pour que le drawer se ferme lorsque l'on va revenir sur la page
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title:  Text('Notifications' ,  style:  GoogleFonts.poppins(fontSize: 25, color: Colors.white),),
            onTap: () {},
          ),
          ListTile(
           leading: const Icon(Icons.login),
            title:  Text('Connexion' ,  style:  GoogleFonts.poppins(fontSize: 25, color: Colors.white),),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login())),
          ),
            InkWell(
                borderRadius: BorderRadius.circular(500),
                splashColor: Colors.black,
                onTap: () {
                  //pour fermer le drawer
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),),
      
        ],
      ),
    );
