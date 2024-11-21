import 'package:e_book_app/app.dart';
import 'package:e_book_app/screens/save/components/bookmarked_book_component.dart';
import 'package:flutter/material.dart';
import 'package:e_book_app/themes.dart';
import 'package:provider/provider.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<BookmarksProvider>();

    /* ================================= SUB COMPONENT =============================================== */
    Widget searchFieldSection() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Find Your Bookmarked Book',
              hintStyle: mediumText12.copyWith(color: grayColor),
              fillColor: grayColorSearchField,
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              isCollapsed: true,
              contentPadding: const EdgeInsets.all(18),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Icon(
                    Icons.search_rounded,
                    color: whiteColor,
                  ),
                ),
              )),
        ),
      );
    }

    /* ================================= MAIN SECTION =============================================== */
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Bookmarked",
                    style: semiBoldText20,
                  ),
                ),
                const SizedBox(height: 20),
                searchFieldSection(),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: appState.getBookmark().isNotEmpty
                      ? Column(
                          children: [
                            for (var item in appState.getBookmark())
                              BookmarkedBookComponent(detailItem: item),
                          ],
                        )
                      : Center(
                          child: Text(
                            "Belum ada buku yang disimpan",
                            style: regularText14,
                          ),
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
