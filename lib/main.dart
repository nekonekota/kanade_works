import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import 'dart:math';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
    primaryColor: Colors.white,
    ),
    home:const MyPortfoliopage(),
    );
  }
}

class MyPortfoliopage extends StatefulWidget {
  const MyPortfoliopage({super.key});

  @override
  State<MyPortfoliopage> createState() => _MyPortfoliopageState();
}
class _MyPortfoliopageState extends State<MyPortfoliopage> {
  double? _deviceWidth, _deviceHeight;
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    print('width: $_deviceWidth');
    print('height: $_deviceHeight');
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1400,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ],
          background: Container(color: const Color.fromARGB(0,0,0,0))),
          initialRoute: "/",
          home:Scaffold(
            body:
              IntrinsicHeight(
                child: 
                Row(
                    children: [ 
                      SideNavigation(),
                      const VerticalDivider(thickness: 3, width: 0,color: Color.fromARGB(255, 0, 0, 0),),
                      Expanded(child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Transform.translate(offset: const Offset(-200.0,0.0),child: Transform.rotate(angle: -25 * pi / 180,/*ラジアンで角度を指定*/child: Container(margin: const EdgeInsets.only(top:0,left:0),color: Colors.yellow,height: 400,),)),
                            Column(
                              children: [
                                _Keyvisual(),
                                _CorectionPage(),
                                _MyprofilePage(),
                              ],
                            ),
                          ],
                        ),
                      ),),
                    ],
                  ),
    ),),
    );
  }
}
// class BottomNavigation extends StatefulWidget{
//   @override
//     _BottomNavigationstate createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<SideNavigation>{
  
// }

class SideNavigation extends StatefulWidget {
  @override
  _SideNavigationState createState() => _SideNavigationState();
}
class _SideNavigationState extends State<SideNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          labelType: NavigationRailLabelType.all,
          selectedIconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
          selectedLabelTextStyle: const TextStyle(color: Color.fromARGB(255, 36, 197, 255)),
          unselectedIconTheme:const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
          unselectedLabelTextStyle:const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          minWidth: 90,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.expand_less,
              color: Color.fromARGB(255, 0, 0, 0) ,
              size: 30,),
              label: Text('Top',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'BM HANNA',
                fontWeight: FontWeight.bold,
              ),),
            ),
            const NavigationRailDestination(
              icon: Icon(Icons.library_books,
              color: Color.fromARGB(255, 0, 0, 0) ,
              size: 30,),
              label: Text('Corection',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'BM HANNA',
                fontWeight: FontWeight.bold,
              ),),
            ),
            const NavigationRailDestination(
              icon: Icon(Icons.face,
              color: Color.fromARGB(255, 0, 0, 0) ,
              size: 30,),
              label: Text('Profile',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'BM HANNA',
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        // SelectContent(index: selectedIndex)
      ],
    );
  }
}
class SelectContent extends StatelessWidget {
  const SelectContent({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [_Keyvisual(), _CorectionPage(), _MyprofilePage()];
    if (pages.length <= index) {
      return pages[0];
    }
    return pages[index];
  }
}

class _Keyvisual extends StatelessWidget{
  const _Keyvisual({super.key});
  @override
  Widget build(BuildContext context){
    return 
    Stack(
      children: [
        Align(alignment: Alignment.topCenter,
          child: Container(
          margin: const EdgeInsets.only(top:100),
          width:800,
          height: 500,
          decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.black,width: 4)),
          ),
        ),
        Container(margin: const EdgeInsets.only(top:150,left:80),
        width:800,
        height: 400,
        color: Colors.white,
        ),
        Container(alignment: Alignment.centerLeft,width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 200, right: 50, bottom: 0, left: 120),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child:const FittedBox(fit: BoxFit.fitWidth,
                    child: Text('Flutter',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'BM HANNA',
                      fontSize: 109,
                      color: Color.fromARGB(255, 50, 200, 255) ,
                    ),),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const FittedBox(fit: BoxFit.fitWidth,
                    child: Text('Portfolio',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'BM HANNA',
                      fontSize: 100,
                      color: Color.fromARGB(255, 0, 0, 0) ,
                    ),),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.only(top:20) ,
                  alignment: Alignment.centerLeft,
                  child: const FittedBox(fit: BoxFit.fitWidth,
                    child: Text('''
Flutterの勉強を始めた学生が、
作ったものをただまとめているサイトです。
''',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'nasu-b',
                      fontSize: 24,
                      ),),
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

class _CorectionPage extends StatelessWidget{
  const _CorectionPage({super.key});
  @override
  Widget build(BuildContext context){
    return Container(
              height: 300,
              color: Colors.blue,
            );
  }
}

class _MyprofilePage extends StatelessWidget{
  const _MyprofilePage({super.key});
  @override
  Widget build(BuildContext context){
    return Container(
              height: 300,
              color: Color.fromARGB(255, 137, 174, 203),
            );
    }
}