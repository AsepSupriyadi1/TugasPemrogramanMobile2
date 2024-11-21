import 'package:e_book_app/screens/home/home_screen.dart';
import 'package:e_book_app/screens/save/save_page.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  final _screens = [const HomePage(), const SavePage()];

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (i) {
            setState(() {
              _selectedIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 15),
                child: Image.asset('assets/icons/icon-home.png',
                    width: 20,
                    color: _selectedIndex == 0 ? greenColor : grayColor),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 15),
                child: Image.asset('assets/icons/icon-save.png',
                    width: 14,
                    color: _selectedIndex == 1 ? greenColor : grayColor),
              ),
              label: '',
            )
          ]);
    }

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: customBottomNav(),
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: _selectedIndex != i,
                  child: screen,
                )))
            .values
            .toList(),
      ),
    );
  }
}
