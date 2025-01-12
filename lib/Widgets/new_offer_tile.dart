import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homzes/colors.dart';
import 'package:homzes/constants.dart';

class NewOffersTile extends StatelessWidget {
  final String imageUrl;
  final String price;

  const NewOffersTile({super.key, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Ui.getPadding(30),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
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
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/heart.png',
                fit: BoxFit.cover,
                height: 25,
                width: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
