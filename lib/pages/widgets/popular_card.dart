import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import '../detail_page.dart';

class PopularCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final int index;
  final String weight;
  final String star;

  const PopularCard(
      {Key? key,
      required this.index,
      required this.imagePath,
      required this.name,
      required this.weight,
      required this.star})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(imagePath)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 25, left: 25, top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: appColorLighterGray)
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: appColorSelect,
                              ),
                              SizedBox(width: 5),
                              CommonText(
                                text: "Популярное за неделю",
                                size: 14,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: CommonText(
                              text: name,
                              size: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CommonText(
                            text: weight,
                            size: 18,
                            color: appColorLightGray,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 20),
                      decoration: const BoxDecoration(
                          color: appColorSelect,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: const Icon(Icons.add, size: 20),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 12),
                          const SizedBox(width: 5),
                          CommonText(
                            text: star,
                            size: 18,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Hero(
              tag: imagePath,
              child: Transform.translate(
                offset: const Offset(
                  30,
                  0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(color: appColorLightGray, blurRadius: 100)
                      ]),
                  child: Image.asset(
                    imagePath,
                    width: MediaQuery.of(context).size.width / 2.9,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
