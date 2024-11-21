import 'package:e_book_app/app.dart';
import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../themes.dart';

class DetailBookScreen extends StatefulWidget {
  const DetailBookScreen({super.key, required this.detailItem});

  final BookItem detailItem;

  @override
  State<DetailBookScreen> createState() => _DetailBookScreenState();
}

class _DetailBookScreenState extends State<DetailBookScreen> {
  @override
  Widget build(BuildContext context) {
    /* 
      Variable appState berasal dari file app.dart, dimana variable ini berfungsi untuk mengakses setiap variable dan method global
    */
    var appState = context.watch<BookmarksProvider>();

    /* 
      variable is bookmarked disini akan mengecheck apabila buku yang di buka detailnya itu sudah di masukan kedalam bookmark atau belum
    */
    var isBoomarked = appState.getBookmark().contains(widget.detailItem);

    /* ================================= SUB SECTION =============================================== */
    Widget bookDetail() {
      /* 
        Stack disini fungsinya adalah untuk menimpa layer, layer yang ditimpa antara lain
        1. Container / Layer ke-1 : Background dari bukunya
        2. Container / Layer ke-2 : Adalah linear gradient untuk menutupi background dari bukunya
        3. Column / Layer ke-3 : Adalah component untuk detail dari bukunya itu sendiri
      */
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: transparentColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.detailItem.imageUrl,
                ),
              ),
            ),
            height: 400,
          ),
          Container(
            height: 401,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    whiteColor.withOpacity(0.3),
                    whiteColor,
                  ],
                )),
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BottomNavbar()),
                            );
                          },
                          icon: const Icon(Icons.arrow_back_ios, size: 20),
                          style: IconButton.styleFrom(
                            backgroundColor: whiteColor,
                          )),
                      IconButton(
                          onPressed: () {
                            appState.addOrDeleteFromBookmark(
                                context, widget.detailItem);
                          },
                          icon: isBoomarked
                              ? const Icon(Icons.bookmark_outlined, size: 20)
                              : const Icon(Icons.bookmark_outline, size: 20),
                          style: IconButton.styleFrom(
                            backgroundColor: whiteColor,
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 120,
                height: 180,
                decoration: BoxDecoration(
                  color: grayColor,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.detailItem.imageUrl),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                widget.detailItem.writter,
                style: regularText14,
              ),
              const SizedBox(height: 5),
              Text(
                widget.detailItem.title,
                style: semiBoldText16,
              ),
            ],
          )
        ],
      );
    }

    /* ================================= SUB SECTION =============================================== */
    Widget infoDescription() {
      return Container(
        height: 60,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: grayColorSearchField,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Rating',
                  style: mediumText10.copyWith(color: dividerColor),
                ),
                const SizedBox(height: 2),
                Text(
                  '4.8',
                  style: semiBoldText12.copyWith(color: blackColor2),
                ),
              ],
            ),
            VerticalDivider(color: dividerColor, thickness: 1),
            Column(
              children: [
                Text(
                  'Number of pages',
                  style: mediumText10.copyWith(color: dividerColor),
                ),
                const SizedBox(height: 2),
                Text(
                  '180 Page',
                  style: semiBoldText12.copyWith(color: blackColor2),
                ),
              ],
            ),
            VerticalDivider(color: dividerColor, thickness: 1),
            Column(
              children: [
                Text(
                  'Language',
                  style: mediumText10.copyWith(color: dividerColor),
                ),
                const SizedBox(height: 2),
                Text(
                  'ENG',
                  style: semiBoldText12.copyWith(color: blackColor2),
                ),
              ],
            ),
          ],
        ),
      );
    }

    /* ================================= MAIN SECTION =============================================== */
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          bookDetail(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                infoDescription(),
                const SizedBox(height: 30),
                Text(
                  "Synopsis",
                  style: semiBoldText16.copyWith(color: blackColor),
                ),
                const SizedBox(height: 12),
                Text(
                  "Atomic Habits: Perubahan Kecil yang Memberikan Hasil Luar Biasa adalah buku kategori self improvement karya James Clear. Pada umumnya, perubahan-perubahan kecil seringkali terkesan tak bermakna karena tidak langsung membawa perubahan nyata pada hidup suatu manusia. Jika diumpamakan sekeping koin tidak bisa menjadikan kaya, suatu..",
                  style: regularText12.copyWith(color: blackColor),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Continue Reading',
                      style: semiBoldText14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
