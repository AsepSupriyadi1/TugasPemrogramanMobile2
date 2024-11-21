import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/screens/home/components/recent_book_component.dart';
import 'package:e_book_app/screens/home/components/trending_book_component.dart';
import 'package:flutter/material.dart';
import 'package:e_book_app/themes.dart';

import '../detail/detail_book_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* 
    Default list variable untuk categories component
  */
  final List<String> _categories = [
    "All Books",
    "Comic",
    "Novel",
    "Manga",
    "Fairy tales",
  ];

  /* 
    Default list variable untuk list buku yang ditampilkan
  */
  final List<BookItem> _trendingBooks = [
    BookItem(
        imageUrl: "assets/images/trending-book-01.png",
        writter: "Brian Khrisna",
        title: "Sisi Tergelap Surga"),
    BookItem(
        imageUrl: "assets/images/trending-book-02.png",
        writter: "James Clear",
        title: "Atomic Habits"),
    BookItem(
        imageUrl: "assets/images/trending-book-03.png",
        writter: "Miura Kouji",
        title: "Blue Box 04"),
  ];

  /* 
    _isSelected merupakan variable default untuk index screen yang terpilih, nantinya page yang terbuka akan mengikuti index dari menu yang terpilih
  */
  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    Widget headerSection() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile-pic-2.jpg'),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello Asep,', style: semiBoldText16),
                Text('Good morning',
                    style: regularText14.copyWith(color: grayColor)),
              ],
            )
          ],
        ),
      );
    }

    Widget recentBookSection() {
      return const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            RecentBookComponent(
              title: "The Magic",
              image: 'assets/images/recent-book-01.png',
            ),
            SizedBox(width: 20),
            RecentBookComponent(
              title: "The Martian",
              image: 'assets/images/trending-book-02.png',
            ),
          ],
        ),
      );
    }

    Widget categoriesSection(int index) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isSelected = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                color: _isSelected == index ? greenColor : transparentColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                _categories[index],
                style: semiBoldText14.copyWith(
                    color: _isSelected == index ? whiteColor : grayColor),
              ),
            ),
          ),
          const SizedBox(width: 12)
        ],
      );
    }

    Widget listCategoriesSection() {
      return SingleChildScrollView(
        padding: const EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _categories
              .asMap()
              .entries
              .map((MapEntry map) => categoriesSection(map.key))
              .toList(),
        ),
      );
    }

    Widget listTrendingBookSection() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 210,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailBookScreen(detailItem: _trendingBooks[index]),
                  ),
                );
              },
              child: TrendingBookComponent(
                imageUrl: _trendingBooks[index].imageUrl,
                title: _trendingBooks[index].title,
                writter: _trendingBooks[index].writter,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: _trendingBooks.length,
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: ListView(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerSection(),
                  // searchFieldSection(),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Trending Now',
                      style: semiBoldText16.copyWith(color: blackColor),
                    ),
                  ),
                  const SizedBox(height: 20),
                  listCategoriesSection(),
                  const SizedBox(height: 30),
                  listTrendingBookSection(),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: whiteColor2,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Text(
                      'Now Reading',
                      style: semiBoldText16.copyWith(color: blackColor),
                    ),
                  ),
                  const SizedBox(height: 20),
                  recentBookSection(),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
