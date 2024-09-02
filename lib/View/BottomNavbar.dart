import 'package:flutter/material.dart';
import 'package:plan_shop_app/View/plant_shop_home_screen.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    page = [
       PlantShopHomeScreen(),
      navBarPage(Icons.favorite),
      navBarPage(Icons.notifications),
      navBarPage(Icons.person),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: BottomNavigationBar(
         iconSize: 35,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black45,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
           setState(() {
             selectedIndex = index;
           });

          },
          items: [
        BottomNavigationBarItem(icon : Icon(Icons.home),
        label: ""
        ),
        BottomNavigationBarItem(icon : Icon(Icons.favorite),
            label: ""
        ),
        BottomNavigationBarItem(icon : Icon(Icons.notifications),
            label: ""
        ),
        BottomNavigationBarItem(icon : Icon(Icons.person),
            label: ""
        ),
      ]),

      //------------------------
      body: page[selectedIndex],
    );
  }
  navBarPage(iconName) {
    return Center(child: Icon(iconName, size: 100, color: Colors.black,),);
  }
}
