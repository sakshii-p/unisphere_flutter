import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UnisphereApp(),
    );
  }
}

class UnisphereApp extends StatefulWidget {
  const UnisphereApp({super.key});

  @override
  State<UnisphereApp> createState() => _UnisphereAppState();
}

class _UnisphereAppState extends State<UnisphereApp> {
  int selectedIndex = 0;
  List<bool> isTappedList = List.generate(5, (_) => false);
  int currentImgIndex = 0;

  List<String> carouselImgList = [
    "assets/images/WhatsApp Image 2025-04-10 at 22.47.03_095f55ab.jpg",
    "assets/images/students.jpg",
    "assets/images/artcircle.jpg",
    "assets/images/antarang.jpg",
  ];

  List<Map> highlights = [
    {"imgName": "assets/images/antarang.jpg", "Description": 'Antarang 2025'},
    {"imgName": 'assets/images/shivjayanti.jpg', "Description": 'Shiv Jayanti'},
    {"imgName": "assets/images/guestspeaker.jpg", "Description": 'Guest Speaker'},
    {"imgName": "assets/images/IMG-20230919-WA0045.jpg", "Description": 'Dhol Pathak'},
    {"imgName": "assets/images/IMG-20231129-WA0029.jpg", "Description": 'Blood Donation'},
  ];

  List<Map> explore = [
    {"imgName": "assets/images/fshion.jpg", "Description": 'Fashion Show'},
    {"imgName": "assets/images/artcircle.jpg", "Description": 'Art Circle'},
    {"imgName": "assets/images/F.E.jpg", "Description": 'F.E 2024'},
    {"imgName": "assets/images/compdept.jpg", "Description": 'Computer Dept'},
    {"imgName": "assets/images/Screenshot 2025-04-11 001529.png", "Description": 'Ganesh Festival'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
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
                    const SizedBox(width: 10),
                    _navButton("Home", 0),
                    const SizedBox(width: 10),
                    _navButton("Committee", 1),
                    const SizedBox(width: 10),
                    _navButton("Library", 2),
                    const SizedBox(width: 10),
                    _navButton("Info", 3),
                    const SizedBox(width: 10),
                    _navButton("Contact Us", 4),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(right: 10),
                  child: _getSelectedPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(String label, int index) {
    return GestureDetector(
      onTap: () async {
        setState(() => isTappedList[index] = true);
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          selectedIndex = index;
          isTappedList[index] = false;
        });
      },
      child: AnimatedScale(
        scale: isTappedList[index] ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          decoration: BoxDecoration(
            color: selectedIndex == index ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: selectedIndex == index ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSelectedPage() {
    switch (selectedIndex) {
      case 0:
        return _homeView();
      case 1:
        return _committeeView();
      case 2:
        return _libraryView();
      case 3:
        return _infoView();
      case 4:
        return _contactView();
      default:
        return const Center(
          child: Text("Coming Soon...", style: TextStyle(color: Colors.white, fontSize: 20)),
        );
    }
  }

  Widget _homeView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: carouselImgList.map((imgPath) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            aspectRatio: 10 / 8,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.6,
            onPageChanged: (index, reason) {
              setState(() => currentImgIndex = index);
            },
          ),
        ),
        Center(
          child: DotsIndicator(
            dotsCount: carouselImgList.length,
            position: currentImgIndex.toDouble(),
            decorator: const DotsDecorator(
              activeColor: Colors.white,
              color: Colors.white38,
            ),
          ),
        ),
        const SizedBox(height: 20),
        _horizontalImageList("Highlights", highlights),
        const SizedBox(height: 20),
        _horizontalImageList("Explore", explore),
      ],
    );
  }

  Widget _committeeView() {
    final List<Map<String, String>> committees = [
      {"name": "Student Council", "image": "assets/images/sc.jpg"},
      {"name": "ACES Committee", "image": "assets/images/aces.jpg"},
      {"name": "ETSA Committee", "image": "assets/images/etsa.jpg"},
      {"name": "MESA Committee", "image": "assets/images/mesa.jpg"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Committees",
          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ...committees.map((committee) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  committee['name']!,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    committee['image']!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _infoView() {
  const infoText = '''
Dear Students,

Jayawant Shikshan Prasarak Mandal (JSPM) and The Shetkari Shikshan Mandal Sangli, Pune (TSSM) have been established with the objective of creating centres of excellence for education in the field of Engineering, Medical, Pharmacy, Management, and Computing.

We visualise that a social transformation can be brought about through the medium of dynamic education. JSPM and TSSM are thus institutions of higher education with social commitment.

With India & Indians emerging as leaders across various professional sectors, it becomes an even greater challenge for the education sector to nurture and groom such abundant talent, which is all set to take industry’s quest for excellence to dazzling new heights.

It is in this same spirit of excellence, that we at JSPM have laid each brick. We, at RSCOE, have created a learning culture, a friendly environment that facilitates complete development of our students.

Our three-pronged focus on knowledge, skill, and attitude is aimed at meeting the needs of our customers i.e. the industry. To achieve this we have hand-picked the best faculty from diverse fields & expertise.

We have invested in state-of-the-art facilities, infrastructure and skilled human resources to supplement the culture and environment of JSPM’s and TSSM’s good governance.

Moreover, it’s our pledge to change in tandem with the changing requirements of the industry and mould, develop and nurture talent that will make the nation proud.

I hope you would be one of those fortunate students who would get admission to one of our colleges. I am certain that your life at our campus will be academically fruitful and otherwise pleasant.

My best wishes to you for all the success in your professional career after graduation.
''';

  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        infoText,
        style: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ),
  );
}

  Widget _contactView() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact Us",
            style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Row(
            children: const [
              Icon(Icons.phone, color: Colors.white),
              SizedBox(width: 10),
              Text("+91 12345 67890", style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Icon(Icons.email, color: Colors.white),
              SizedBox(width: 10),
              Text("info@jspmntc.edu.in", style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _horizontalImageList(String title, List<Map> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 22)),
        const SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(items[index]['imgName']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(items[index]['Description'], style: const TextStyle(color: Colors.white)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _libraryView() {
    final List<Map<String, String>> departments = [
      {"name": "Computer", "icon": "assets/images/comp.jpg"},
      {"name": "EXTC", "icon": "assets/images/etc.jpg"},
      {"name": "Electrical", "icon": "assets/images/ele.jpg"},
      {"name": "Civil", "icon": "assets/images/mech.jpg"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Library",
          style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: departments.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final dept = departments[index];
            return GestureDetector(
              onTap: () {
                if (dept['name'] == "Computer") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const YearSelectionPage(),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(color: Colors.white12, blurRadius: 6, spreadRadius: 1),
                  ],
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(dept['icon']!, height: 100),
                    const SizedBox(height: 15),
                    Text(dept['name']!, style: const TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class YearSelectionPage extends StatelessWidget {
  const YearSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> yearOptions = [
      {"year": "2024 PYQs", "path": ""},
      {"year": "2023 PYQs", "path": "assets/pdf/mathspyq.pdf"},
      {"year": "2022 PYQs", "path": ""},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Year"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: yearOptions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          final item = yearOptions[index];
          return ListTile(
            tileColor: Colors.white10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Text(item["year"]!, style: const TextStyle(color: Colors.white, fontSize: 18)),
            onTap: () {
              if (item['path']!.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PdfViewerPage(pdfAssetPath: item['path']!),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("PDF not available yet."),
                    backgroundColor: Colors.grey,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  final String pdfAssetPath;

  const PdfViewerPage({super.key, required this.pdfAssetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2023 PYQs"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SfPdfViewer.asset(pdfAssetPath),
    );
  }
}
