import 'package:flutter/material.dart';
import 'package:flutterappdogandcat/ui/views/admod/admod_view.dart';
import 'package:flutterappdogandcat/ui/views/favorite/favorite_view.dart';
import 'package:flutterappdogandcat/ui/views/home/home_view.dart';
import 'entertainment/entertainment_view.dart';

class NavigationBottomBar extends StatefulWidget {
  static const routeName = '/navigation-bar';

  @override
  _NavigationBottomBarState createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {

  final List<Widget> _pages = <Widget>[
    HomeView(),
    EntertaimentView(),
    FavoriteView()
//    AdmodView()
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(title: Text("Trang Chủ"), icon: Icon(Icons.home)),
    BottomNavigationBarItem(title: Text("Giải trí"), icon: Icon(Icons.games)),
    BottomNavigationBarItem(
        title: Text("Tuyển sinh"), icon: Icon(Icons.library_books)),
//    BottomNavigationBarItem(
//        title: Text("Quảng cáo"), icon: Icon(Icons.account_balance_wallet))
  ]; // Cre

  final PageStorageBucket _bucket =
  PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(bucket: _bucket,child: IndexedStack(children: _pages, index: _selectedIndex)),
    );
  }

  Widget _bottomNavigationBar(int selectedIndex) =>
      BottomNavigationBar(
          onTap: (int index) {
            setState(() => _selectedIndex = index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(39, 65, 143, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          items: _items);
}
