import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final ScrollController controller = ScrollController();

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    const _Keyvisual(),
    const _CorectionPage(),
    const _MyprofilePage(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              unselectedLabelStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'BM HANNA',
                fontWeight: FontWeight.bold,
              ),
              selectedLabelStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'BM HANNA',
                fontWeight: FontWeight.bold,
              ),
              currentIndex: _selectedIndex,
              unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
              selectedItemColor: const Color.fromARGB(255, 36, 197, 255),
              // called when one tab is selected
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              // bottom tab items
              items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.expand_less),
                    label: ('Top'),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.library_books), label: 'Corection'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.face), label: 'Profile'),
                ])
          : null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              onDestinationSelected: (int index) {
                setState(() {
                  // ignore: avoid_print
                  print(index); // デバッグ用に出力（タップされたボタンによって数値がかわる）
                  if (index == 0) {
                    // 上から30pxまで移動
                    controller.animateTo(
                      0.0,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  } else if (index == 1) {
                    // 上から300pxまで移動
                    controller.animateTo(
                      30.0,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  } else if (index == 2) {
                    // 上から300pxまで移動
                    controller.animateTo(
                      50.0,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                    );
                  }
                });
              },
              selectedIndex: _selectedIndex,
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.expand_less),
                    label: Text(
                      'Top',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'BM HANNA',
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                NavigationRailDestination(
                    icon: Icon(Icons.library_books),
                    label: Text(
                      'Corection',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'BM HANNA',
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                NavigationRailDestination(
                  icon: Icon(Icons.face),
                  label: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'BM HANNA',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: const TextStyle(
                color: Color.fromARGB(255, 36, 197, 255),
              ),

              unselectedLabelTextStyle: const TextStyle(),
              // Called when one tab is selected
              leading: Column(
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  // CircleAvatar(
                  //   radius: 20,
                  //   child: Icon(Icons.person),
                  // ),
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              controller: controller,
              child: MediaQuery.of(context).size.width < 640
                  ?

                  /// mobile用
                  _screens[_selectedIndex]
                  :

                  /// web用
                  Column(
                      children: _screens,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

class _Keyvisual extends StatelessWidget {
  const _Keyvisual();
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(const Size(800,900)),
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              width: deviceWidth * 0.85,
              height: deviceHeight * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 4)),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 180, left: 90),
          width: 200,
          height: 400,
          color: Colors.white,
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 220, right: 80, bottom: 0, left: 90),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Flutter',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'BM HANNA',
                        fontSize: 105,
                        color: Color.fromARGB(255, 50, 200, 255),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Portfolio',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'BM HANNA',
                        fontSize: 98,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  alignment: Alignment.centerLeft,
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      '''
Flutterの勉強を始めた学生が、
作ったものをただまとめているサイトです。
''',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'nasu-b',
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CorectionPage extends StatelessWidget {
  const _CorectionPage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.blue,
    );
  }
}

class _MyprofilePage extends StatelessWidget {
  const _MyprofilePage();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color.fromARGB(255, 137, 174, 203),
    );
  }
}
