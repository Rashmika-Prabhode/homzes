import 'package:flutter/material.dart';
import 'package:homzes/colors.dart';
import 'package:homzes/constants.dart';

class HomeTile extends StatelessWidget {
  final Color color;
  final String imageName;
  final String name;
  const HomeTile(this.color, this.imageName, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: Ui.getPadding(22),
        width: Ui.getPadding(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Ui.getPadding(1.5), top: Ui.getPadding(1.5)),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 28,
                child: Image.asset(
                  imageName,
                  width: 25,
                  height: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Ui.getPadding(2), top: Ui.getPadding(3)),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
