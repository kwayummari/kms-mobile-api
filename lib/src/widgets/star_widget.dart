import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gugu/src/utils/app_const.dart';

class StarRating extends StatelessWidget {
  final String numberOfStars;

  StarRating({required this.numberOfStars});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: double.parse(numberOfStars),
        itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
        itemCount: 5,
        itemSize: 20.0,
        direction: Axis.horizontal,
        unratedColor: AppConst.whiteOpacity);
  }
}
