import 'package:e_book_app/app.dart';
import 'package:e_book_app/models/book.dart';
import 'package:flutter/material.dart';
import 'package:e_book_app/themes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class BookmarkedBookComponent extends StatelessWidget {
  const BookmarkedBookComponent({
    required this.detailItem,
    super.key,
  });

  final BookItem detailItem;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<BookmarksProvider>();

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: borderColorRecentBook),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(detailItem.imageUrl),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        detailItem.writter,
                        style:
                            mediumText12.copyWith(color: grayColorRecentBook),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        detailItem.title,
                        style: semiBoldText14.copyWith(color: blackColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    LinearPercentIndicator(
                      padding: const EdgeInsets.all(0),
                      animation: true,
                      percent: 0.7,
                      width: 70,
                      progressColor: greenColor,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "70% Completed",
                        style: regularText12,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        appState.addOrDeleteFromBookmark(context, detailItem);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: grayColor),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text("Delete from bookmark",
                                  style: regularText11),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.delete_forever,
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
