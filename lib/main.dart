import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UnisphereApp());
  }

  unisphereApp() {}
}

class UnisphereApp extends StatefulWidget {
  const UnisphereApp({super.key});
  @override
  State<UnisphereApp> createState() => _UnisphereAppState();
}

class _UnisphereAppState extends State<UnisphereApp> {
  List<String> carouselImgList = [
    "assets/images/WhatsApp Image 2025-04-10 at 22.47.03_095f55ab.jpg",
    "assets/images/WhatsApp Image 2025-04-10 at 22.47.03_6eaaef5a.jpg",
    "assets/images/WhatsApp Image 2025-04-10 at 22.47.02_33b2ffa7.jpg",
    "assets/images/WhatsApp Image 2025-04-10 at 22.47.02_4bb7bda3.jpg",
  ];
  List<Map> highlights = [
    {
      "imgName": "assets/images/20240329_213204.jpg",
      "Description": 'F.E Freshers 2024',
    },
    {"imgName": 'assets/images/IMG_2183.JPG', "Description": 'Anveshan 2024'},
    {
      "imgName": "assets/images/IMG-20230905-WA0024.jpg",

      "Description": 'Teachers Day',
    },
    {
      "imgName": "assets/images/IMG-20230919-WA0045.jpg",

      "Description": 'Dhol Pathak',
    },
    {
      "imgName": "assets/images/IMG-20231129-WA0029.jpg",
      "Description": 'Blood Donation',
    },
  ];
  List<Map> explore = [
    {
      "imgName": "assets/images/IMG-20240302-WA0065.jpg",
      "Description": 'Felicitation',
    },
    {
      "imgName": "assets/images/IMG-20240722-WA0045.jpg",
      "Description": 'NSS Inauguration',
    },
    {
      "imgName": "assets/images/IMG-20240906-WA0069.jpg",
      "Description": 'Teachers Day 2024',
    },
    {
      "imgName": "assets/images/IMG20240329212245.jpg",
      "Description": 'FESA Committee',
    },
    {
      "imgName": "assets/images/Screenshot 2025-04-11 001529.png",
      "Description": 'Ganesh Festival',
    },
  ];
  int currentImgIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 10),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/WhatsApp Image 2025-04-10 at 22.41.12_dc79ba22.jpg',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Home",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Events",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Library",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),

                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Info",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Contact us",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(carouselImgList[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(carouselImgList[1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(carouselImgList[2]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(carouselImgList[3]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 10 / 8,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.6,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentImgIndex = index;
                    });
                  },
                ),
              ),
              DotsIndicator(
                dotsCount: carouselImgList.length,
                position: currentImgIndex.toDouble(),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "highlights",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: highlights.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      highlights[index]['imgName'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                highlights[index]['Description'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: explore.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 120,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),

                                  image: DecorationImage(
                                    image: AssetImage(
                                      explore[index]['imgName'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                explore[index]['Description'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
