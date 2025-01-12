import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/Widgets/featured_tile.dart';
import 'package:homzes/Widgets/new_offer_tile.dart';
import 'package:homzes/Widgets/search_bar.dart';
import 'package:homzes/colors.dart';
import 'package:homzes/constants.dart';
import 'package:homzes/property_cubit.dart';
import 'package:homzes/screens/search_and_catalog_3.dart';
import 'package:homzes/utils/animated_route.dart';
import 'package:homzes/utils/column_spacer.dart';
import 'package:homzes/utils/row_spacer.dart';

class SearchAndCatalog extends StatefulWidget {
  const SearchAndCatalog({super.key});

  @override
  State<SearchAndCatalog> createState() => _SearchAndCatalogState();
}

class _SearchAndCatalogState extends State<SearchAndCatalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: AppBar(
          backgroundColor: AppColors.yellow,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.dehaze_rounded,
                        color: AppColors.black,
                      ),
                    ),
                    const RowSpacer(0.4),
                    const Text(
                      'Hi, Stanislav',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.grey,
                            ),
                            child: const Center(
                              child: Text(
                                "S",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black,
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Container(
                            height: 12,
                            width: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.purple,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const ColumnSpacer(0.02),
                const CustomSearchBar(),
                const ColumnSpacer(0.03),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ColumnSpacer(0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        AnimatedRoute.slideTo(
                            context, const SearchAndCatalog3());
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ))
                ],
              ),
            ),
            const ColumnSpacer(0.005),
            BlocBuilder<PropertyCubit, Map<String, dynamic>>(
              builder: (context, state) {
                final isLoading = state['loading'];
                final properties = state['data'];

                if (isLoading) {
                  return SizedBox(
                    height: Ui.getPadding(27),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (properties.isEmpty) {
                  return SizedBox(
                    height: Ui.getPadding(27),
                    child: const Center(child: Text("No data available")),
                  );
                }
                return SizedBox(
                  height: Ui.getPadding(27),
                  child: ListView.builder(
                    itemCount: properties.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final property = properties[index];

                      final isFirst = index == 0;
                      final isLast = index == properties.length - 1;

                      return Padding(
                        padding: EdgeInsets.only(
                          left: isFirst ? Ui.getPadding(2) : 0,
                          right: isLast ? Ui.getPadding(2) : Ui.getPadding(1.5),
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FeaturedTile(
                                  imageUrl: property['Image'],
                                  price: property['Price']
                                      .replaceAll('/ mo', '')
                                      .trim(),
                                ),
                                const ColumnSpacer(0.01),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    property['Title'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    property['Number of beds'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const ColumnSpacer(0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Ui.getPadding(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "New Offers",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        AnimatedRoute.slideTo(
                            context, const SearchAndCatalog3());
                      },
                      child: const Text(
                        "View all",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ))
                ],
              ),
            ),
            BlocBuilder<PropertyCubit, Map<String, dynamic>>(
              builder: (context, state) {
                final isLoading = state['loading'];
                final properties = state['data'];

                if (isLoading) {
                  return SizedBox(
                    height: Ui.getPadding(20),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (properties.isEmpty) {
                  return SizedBox(
                    height: Ui.getPadding(20),
                    child: const Center(child: Text("No data available")),
                  );
                }
                return ListView.builder(
                  itemCount: properties.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final property = properties[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Ui.getPadding(2),
                          vertical: Ui.getPadding(1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          NewOffersTile(
                            imageUrl: property['Image'],
                            price:
                                property['Price'].replaceAll('/ mo', '').trim(),
                          ),
                          const ColumnSpacer(0.01),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  property['Title'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  property['Number of beds'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                              const RowSpacer(0.2),
                              Image.asset(
                                'assets/star.png',
                                fit: BoxFit.cover,
                                height: 18,
                                width: 18,
                              ),
                              const Text(
                                " 4.9",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                              const Text(
                                " (29 Reviews)",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
