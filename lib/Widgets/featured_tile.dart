import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homzes/colors.dart';
import 'package:homzes/constants.dart';

class FeaturedTile extends StatelessWidget {
  final String imageUrl;
  final String price;

  const FeaturedTile({super.key, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Ui.getPadding(19),
      width: Ui.getPadding(19),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            end: Ui.getPadding(2), bottom: Ui.getPadding(2)),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: Ui.getPadding(3),
            width: Ui.getPadding(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
            ),
            child: Center(
              child: Text(
                price,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
