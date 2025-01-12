import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homzes/colors.dart';
import 'package:homzes/constants.dart';
import 'package:homzes/utils/row_spacer.dart';

class RentOffersTile extends StatelessWidget {
  final String imageUrl;
  final String noBeds;
  final String noBarthRoom;

  const RentOffersTile(
      {super.key,
      required this.imageUrl,
      required this.noBeds,
      required this.noBarthRoom});

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
                start: Ui.getPadding(1.5), bottom: Ui.getPadding(1.5)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Container(
                    height: Ui.getPadding(3),
                    width: Ui.getPadding(9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                    ),
                    child: Center(
                      child: Text(
                        noBeds,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  const RowSpacer(0.02),
                  Container(
                    height: Ui.getPadding(3),
                    width: Ui.getPadding(13),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                    ),
                    child: Center(
                      child: Text(
                        noBarthRoom,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
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
