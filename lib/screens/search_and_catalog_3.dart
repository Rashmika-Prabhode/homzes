import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homzes/Widgets/rent_offers.tile.dart';
import 'package:homzes/Widgets/search_bar.dart';
import 'package:homzes/colors.dart';
import 'package:homzes/constants.dart';
import 'package:homzes/property_cubit.dart';
import 'package:homzes/utils/column_spacer.dart';
import 'package:homzes/utils/row_spacer.dart';

class SearchAndCatalog3 extends StatefulWidget {
  const SearchAndCatalog3({super.key});

  @override
  State<SearchAndCatalog3> createState() => _SearchAndCatalog3State();
}

class _SearchAndCatalog3State extends State<SearchAndCatalog3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: AppBar(
            backgroundColor: AppColors.lightGreen,
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            flexibleSpace: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: AppColors.black, width: 2),
                            color: AppColors.black,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.menu, color: AppColors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Ui.getPadding(6),
                        width: Ui.getPadding(38),
                        child: const CustomSearchBar(),
                      ),
                    ],
                  ),
                  const RowSpacer(2),
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ColumnSpacer(0.03),
            const Text(
              "Popular rent offers",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            BlocBuilder<PropertyCubit, Map<String, dynamic>>(
              builder: (context, state) {
                final isLoading = state['loading'];
                final properties = state['data'];

                if (isLoading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (properties.isEmpty) {
                  return SizedBox(
                    height: Ui.getPadding(15),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RentOffersTile(
                            imageUrl: property['Image'],
                            noBeds: property['Number of beds'],
                            noBarthRoom: property['Number of bathrooms'],
                          ),
                          const ColumnSpacer(0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          property['Title'],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        Text(
                                          property['Number of beds'],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      property['Location'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    property['Price'],
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const Text(
                                    " / mo",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            const ColumnSpacer(0.05),
          ],
        ),
      ),
    );
  }
}
