import 'package:flutter/material.dart';
import 'package:e_book_app/themes.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecentBookComponent extends StatelessWidget {
  const RecentBookComponent({
    super.key,
    required this.image,
    required this.title,
  });

  /* 
    Default variable untuk component recent Book
  */
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: borderColorRecentBook),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 90,
          ),
          const SizedBox(width: 18),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: semiBoldText14.copyWith(color: blackColor2),
              ),
              CircularPercentIndicator(
                reverse: true,
                radius: 30,
                lineWidth: 7,
                animation: true,
                percent: 0.5,
                progressColor: greenColor,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              Text(
                '50% Completed',
                style: mediumText12.copyWith(color: grayColorRecentBook),
              ),
            ],
          )
        ],
      ),
    );
  }
}
