import 'package:flutter/material.dart';
import '../data/ingredients.dart';
import '../theme/theme.dart';

class DetailPage extends StatelessWidget {
  final String imagePath;

  const DetailPage(this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            backgroundColor: appColorSelect,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: 'Заказать',
                fontWeight: FontWeight.w600,
                size: 18,
              ),
              Icon(
                Icons.chevron_right,
                color: appColorBlack,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          customAppBar(context),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonText(
                  text: 'Чикен \nпремьер',
                  size: 45,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ruble-currency-sign.png',
                      color: appColorRed,
                      width: 15,
                    ),
                    const CommonText(
                      text: '399.99',
                      size: 48,
                      fontWeight: FontWeight.w700,
                      color: appColorRed,
                      height: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: 'Размер',
                              color: appColorLightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CommonText(
                                text: 'Большой"', fontWeight: FontWeight.w600),
                            SizedBox(
                              height: 20,
                            ),
                            CommonText(
                              text: 'Начинка',
                              color: appColorLightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CommonText(
                                text: 'Котлета', fontWeight: FontWeight.w600),
                            SizedBox(
                              height: 20,
                            ),
                            CommonText(
                              text: 'Доставка',
                              color: appColorLighterGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CommonText(
                                text: '30 мин', fontWeight: FontWeight.w600),
                          ]),
                    ),
                    Hero(
                      tag: imagePath,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: (Colors.grey[400])!, blurRadius: 150),
                          ],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 200,
                        child: Image.asset(imagePath, fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const CommonText(
                    text: 'Ингридиенты', fontWeight: FontWeight.w700, size: 22),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ingredients.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                child: ingredientCard(ingredients[index]['name']!),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container ingredientCard(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: (Colors.grey[400])!),
        color: appColorWhite,
      ),
      child: Center(
        child: Text(name),
      ),
    );
  }

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: (Colors.grey[400])!)),
              child: const Icon(Icons.chevron_left),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: appColorSelect,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.star, color: appColorWhite),
          ),
        ],
      ),
    );
  }
}
