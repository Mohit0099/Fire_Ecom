import 'package:ecom_firebase/cart/cart_screen.dart';
import 'package:ecom_firebase/catagory/catagory_screen.dart';
import 'package:ecom_firebase/catagory/item_screen.dart';
import 'package:ecom_firebase/home/home_screen_controller.dart';
import 'package:ecom_firebase/model/catagories_model.dart';
import 'package:ecom_firebase/model/homemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenView extends StatefulWidget {
  HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  // Categories? categories;
  List<String> banner8text2 = [
    'Floral Print',
    'Embelished Cown',
    'Silk Sarees(pink)',
    'Crepe Straight Kurta',
    'Embelished Cown',
    'Silk Sarees(pink)',
    'Crepe Straight Kurta',
  ];
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    // final controller = Get.put(HomeScreenController());

    return Container(
        color: Colors.blueAccent,
        child:
            SafeArea(child: GetBuilder<HomeScreenController>(builder: (value) {
          if (!value.isLoading) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Ecommerce App"),
                backgroundColor: Colors.blueAccent,
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.to(() => CartScreen());
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ],
              ),
              drawer: Drawer(),
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // banner
                      SizedBox(
                        height: size.height / 3.5,
                        width: size.width,
                        child: PageView.builder(
                          itemCount: homeScreenController.bannerData.length,
                          onPageChanged: homeScreenController.changeIndicator,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(homeScreenController
                                          .bannerData[index].image),
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),

                      // indicator

                      SizedBox(
                          height: 20,
                          width: 200,
                          child: Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0;
                                    i < homeScreenController.isSelected.length;
                                    i++)
                                  indicator(size,
                                      homeScreenController.isSelected[i].value)
                              ],
                            );
                          })),

                      // // categories..

                      categoriesTitle(size, "All Categories", () {
                        Get.to(() => CategoriesAndFeaturedScreen(
                              model: homeScreenController.categoriesData,
                            ));
                      }),

                      listViewBuilder(
                          size, homeScreenController.categoriesData),

                      SizedBox(
                        height: size.height / 25,
                      ),

                      categoriesTitle(size, "Featured", () {
                        Get.to(() => CategoriesAndFeaturedScreen(
                              model: homeScreenController.featuredData,
                            ));
                      }),

                      listViewBuilder(size, homeScreenController.featuredData),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        })));
  }

  Widget listViewBuilder(Size size, List<CategoriesModel> data) {
    return SizedBox(
      height: size.height / 7,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return listViewBuilderItems(size, data[index]);
        },
      ),
    );
  }

  Widget listViewBuilderItems(Size size, CategoriesModel categroies) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ItemsScreen(
                categoryId: categroies.id.toString(),
                categoryTitle: categroies.title.toString(),
              ));
        },
        child: SizedBox(
          height: size.height / 7,
          width: size.width / 4.2,
          child: Column(
            children: [
              Container(
                height: size.height / 10,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(categroies.image.toString()),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    categroies.title.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoriesTitle(Size size, String title, Function function) {
    return SizedBox(
      height: size.height / 17,
      width: size.width / 1.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () => function(),
            child: const Text(
              "View More",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget indicator(size, bool isSelected) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Container(
        height: 20,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
