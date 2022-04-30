import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController();
  double opacity = 0;
  double padding = 50;

  void _onScroll() {
    setanimations();
    opacity = 0;
    padding = 30;
  }

  @override
  void initState() {
    // TODO: implement initState
    setanimations();
    _pageController = PageController(initialPage: 0)..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage(
              'assets/images/one.jpg',
              'Forest',
              "A forest is an area of land dominated by trees. Hundreds of definitions of forest are used throughout the world, incorporating factors such as tree density, tree height, land use, legal standing, and ecological function.",
              1),
          makePage(
              'assets/images/two.jpg',
              'Temple',
              "The temple-building tradition of Mesopotamia derived from the cults of gods and deities in the Mesopotamian religion. It spanned several civilizations; from Sumerian, Akkadian, Assyrian, and Babylonian.",
              2),
          makePage(
              'assets/images/three.jpg',
              'Mountain',
              "The highest known permanently tolerable altitude is at 5,950 metres (19,520 ft). At very high altitudes, the decreasing atmospheric pressure means that less oxygen is available for breathing, and there is less protection against solar radiation (UV).",
              3),
        ],
      ),
    );
  }

  Widget makePage(
      String imagePath, String title, String description, int pageNumber) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.2)
          ],
          begin: AlignmentDirectional.bottomEnd,
          stops: [0.3, 0.9],
        )),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "$pageNumber",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("/4",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ))
                  ],
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedPadding(
                      duration: Duration(seconds: 2),
                      padding: EdgeInsets.only(bottom: padding),
                      child: AnimatedOpacity(
                        opacity: opacity,
                        duration: Duration(seconds: 2),
                        child: Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 500),
                          margin: const EdgeInsets.only(right: 5),
                          child: const Icon(Icons.star,
                              color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: const Icon(Icons.star,
                              color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          child: const Icon(Icons.star,
                              color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child:
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.star, color: Colors.grey, size: 15),
                        ),
                        Text(
                          "4.0",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedPadding(
                      duration: Duration(seconds: 2),
                      padding: EdgeInsets.only(left: padding),
                      child: Text(
                        description,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  setanimations() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {
          opacity = 1;
          padding = 0;
        }));
  }
}
