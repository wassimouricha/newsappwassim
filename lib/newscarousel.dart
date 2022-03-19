import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:newsappwassim/values.dart';

class NewsCarousel extends StatelessWidget {
  NewsCarousel({Key? key}) : super(key: key);
  final StaticValues staticValues = StaticValues();
   CarouselController _buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CarouselSlider(
       carouselController: _buttonCarouselController,
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
      ),
      items: staticValues.news.map((newsItem) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      newsItem.image,
                      fit: BoxFit.contain,
                      height: 150,
                    ),
                  ),
                  Container(
                    width: size.width,
                   
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter, 
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xCC000000),
                          Color.fromARGB(73, 0, 0, 0),
                          Color(0xCC000000),
                        ]
                      )
                    ),),
                    Align(alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Text(newsItem.title, 
                      style: TextStyle(fontSize: 15,color: Colors.white),
                      
                      ),
                      ),),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
