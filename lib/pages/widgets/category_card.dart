import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/theme/theme.dart';



class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final int index;
  final int selectedCategory;
  final Function(int) onTap;

  const CategoryCard(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.index,
      required this.selectedCategory,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        height: 200,
        margin: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: appColorLighterGray,
                blurRadius: 15,
              )
            ],
            color: selectedCategory == index ? appColorSelect : appColorWhite),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(imagePath, width: 40),
            CommonText(
              text: name,
              size: 16,
              fontWeight: FontWeight.w800,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedCategory == index
                    ? appColorWhite
                    : appColorRed,
                shape: const CircleBorder(),
                elevation: 0,
              ),
              child: Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: selectedCategory == index
                    ? appColorBlack
                    : appColorWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
