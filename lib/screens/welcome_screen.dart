import 'package:flutter/material.dart';
import 'package:homzes/Widgets/home_tile.dart';
import 'package:homzes/colors.dart';
import 'package:homzes/constants.dart';
import 'package:homzes/screens/search_and_catalog_1.dart';
import 'package:homzes/utils/column_spacer.dart';
import 'package:homzes/utils/row_spacer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/house_image_1.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: AppColors.black.withOpacity(0.8),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const ColumnSpacer(0.1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/homzes.png',
                        fit: BoxFit.scaleDown,
                        height: 30,
                        width: 130,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppColors.white, width: 2),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.menu, color: AppColors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const ColumnSpacer(0.34),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Find the best\n",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: AppColors.white,
                        ),
                      ),
                      TextSpan(
                        text: "place for you",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const ColumnSpacer(0.06),
                SizedBox(
                  height: Ui.getPadding(22),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        RowSpacer(0.03),
                        HomeTile(AppColors.lightYellow, "assets/rent_home.png",
                            "Rent"),
                        RowSpacer(0.03),
                        HomeTile(
                            AppColors.yellow, "assets/buy_home.png", "Buy"),
                        RowSpacer(0.03),
                        HomeTile(AppColors.lightGreen, "assets/sell_home.png",
                            "Sell"),
                        RowSpacer(0.03),
                      ],
                    ),
                  ),
                ),
                const ColumnSpacer(0.03),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SearchAndCatalog(),
                        ));
                  },
                  child: Container(
                    height: Ui.getPadding(6),
                    width: Ui.getPadding(45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.green),
                    child: const Center(
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const ColumnSpacer(0.02),
              ],
            ),
          )
        ],
      ),
    );
  }
}
