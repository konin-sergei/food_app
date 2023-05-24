import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../data/category.dart';
import '../data/popular.dart';
import '../theme/theme.dart';
import 'widgets/category_card.dart';
import 'widgets/popular_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedCategory = 0;

  void _onCategoryTap(int index) {
    setState(() {
      _selectedCategory = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/icons/mac.webp'),
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10),
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CommonText(
                  text: "Вкусно — и точка",
                  height: 1.1,
                  size: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 25,
                      color: appColorBlack,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: appColorLighterGray,
                            ),
                          ),
                          hintText: 'Search..',
                          hintStyle: TextStyle(
                              color: appColorLighterGray,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CommonText(
                  text: "Категории",
                  size: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                    child: CategoryCard(
                      imagePath: categoryList[index]['imagePath']!,
                      name: categoryList[index]['name']!,
                      index: index,
                      selectedCategory: _selectedCategory,
                      onTap: _onCategoryTap,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: CommonText(
                  text: "Популярное",
                  size: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Column(
                children: List.generate(
                  popularList.length,
                  (index) => PopularCard(
                    index: index,
                    imagePath: popularList[index]['imagePath']!,
                    name: popularList[index]['name']!,
                    weight: popularList[index]['weight']!,
                    star: popularList[index]['star']!,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
