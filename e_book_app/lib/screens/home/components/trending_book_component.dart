import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class TrendingBookComponent extends StatelessWidget {
  const TrendingBookComponent(
      {super.key,
      required this.title,
      required this.writter,
      required this.imageUrl});

  /* 
    Default variable untuk component trending book
  */
  final String title;
  final String writter;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            writter.length >= 13 ? "${writter.substring(0, 12)}.." : writter,
            style: mediumText12.copyWith(color: grayColor),
          ),
          Text(
            title.length >= 12 ? "${title.substring(0, 10)}.." : title,
            style: semiBoldText14.copyWith(color: blackColor),
          ),
        ],
      ),
    );
  }
}
