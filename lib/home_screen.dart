import 'package:flutter/material.dart';
import 'package:newsappwassim/const.dart';
import 'package:newsappwassim/model.dart';
import 'package:newsappwassim/news_api.dart';
import 'package:newsappwassim/news_screen.dart';
import 'package:newsappwassim/sport_screen.dart';
import 'package:newsappwassim/sante_screen.dart';
import 'package:newsappwassim/science_screen.dart';
import 'package:newsappwassim/tech_screen.dart';
import 'package:newsappwassim/biz_screen.dart';
import 'package:newsappwassim/newscarousel.dart';
import 'package:newsappwassim/messageac.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:newsappwassim/user_page.dart';
import 'package:newsappwassim/loginpage.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsApiModel>? newsList;
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
          newsList = value;
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
                      icon: Image.asset("image/drawer.png"),
                      onPressed: () => Scaffold.of(context).openDrawer(),
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
      drawer: const NavigationDrawer(),
      body: 
      
      Container(
       
        height: size.height,
        width: size.width,
        child: Column(
          
          children: [
             ExpansionTile(title: Text('Général',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
        
        ),
        
        children: [
          ListTile(title: Text('Sport',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SportScreen())),
        ),
          ListTile(title: Text('Santé',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SanteScreen())),
        ),
           ListTile(title: Text('Science',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ScienceScreen())),
        ),
            ListTile(title: Text('Tech',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => TechScreen())),
        ),
        
            ListTile(title: Text('Business',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
        ),
        onTap:() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => BizScreen())),
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
                        itemCount: newsList!.length,
                        itemBuilder: (context, index) {
                          return listItems(size, newsList![index]);
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget listItems(Size size, NewsApiModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ReadingNews(
              model: model,
            ),
          ),
        ),
        child: 
        Container(
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
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
             
              Container(
                  //Mon container pour la partie date de publication en bas à droite
                  width: size.width / 1.1,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
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
                  )),
            ],
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

//mon drawer = ma sidebar

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: 
            Column(
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
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "wbouricha5@gmail.com",
                style: TextStyle(fontSize: 15, color: Colors.white),
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
            title: const Text(
                'Accueil'), //je peux remplacement pushreplacement par push pour avoir le bouton en haut a gauche pour revenir
            //il faut cependant ajouter Navigator.pop(context); pour que le drawer se ferme lorsque l'on va revenir sur la page
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Notifications'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Connexion'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Login())),
          ),
            InkWell(
                borderRadius: BorderRadius.circular(500),
                splashColor: Colors.blue,
                onTap: () {
                  //pour fermer le drawer
                  Navigator.of(context).pop();
                },
                child: Center(
                  child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),),
          const Divider(
            color: Colors.black,
          ),
          // Expanded(
          //     child: Align(
          //       alignment: Alignment.bottomCenter,
          //       child: Container(
          //         height: 65,
          //         width: MediaQuery.of(context).size.width,
          //         color: Colors.black,
          //         child: Center(
          //           //premet de mettre l'enfant du widget et donc ce qu'il y à a l'interieur au centre
          //           child: Text(
          //             "v1.0.3",
          //             style: TextStyle(
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w600,
          //                 color: Colors.white),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
