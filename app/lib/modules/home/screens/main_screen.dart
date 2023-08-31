import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selected = 0;

  void handleBottomNavigationSelect(String route, int index) {
    setState(() => _selected = index);
    Modular.to.navigate(route);
  }

  @override
  void initState() {
    super.initState();

    // Modular.to.navigate('/home/home');
  }

  @override
  Widget build(BuildContext context) {
    final leading = SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child:
                      Icon(_selected == 0 ? Icons.home : Icons.home_outlined),
                ),
                Text('Home')
              ],
            ),
            onPressed: () => handleBottomNavigationSelect('./home', 0),
          ),
          TextButton(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                      _selected == 1 ? Icons.person : Icons.person_outline),
                ),
                Text('Menu')
              ],
            ),
            onPressed: () => handleBottomNavigationSelect('./menu', 1),
          ),
        ],
      ),
    );

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: RouterOutlet(),
              ),
            ),
            leading,
          ],
        ),
      ),
    );
  }
}
