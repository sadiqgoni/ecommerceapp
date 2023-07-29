import 'package:flutter/material.dart';
import 'package:ecommerceapp/shared/men_stag.dart';
import '../model/sneakers_model.dart';
import '../services/helper.dart';
import '../shared/app_style.dart';
import '../shared/kids_stag.dart';
import '../shared/women_stag.dart';
import 'category_shoes.dart';

class ProductDetails extends StatefulWidget {
  final int tabIndex;

  ProductDetails({Key? key, required this.tabIndex}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  List<SneakersShop> menProductData = [];
  List<SneakersShop> womenProductData = [];
  List<SneakersShop> kidsProductData = [];

  void getMen() {
    Sneakers sneakers = Sneakers();
    sneakers.fetchProductData('MEN').then((data) {
      setState(() {
        menProductData.addAll(data);
      });
    });
  }

  void getWomen() {
    Sneakers sneakers = Sneakers();
    sneakers.fetchProductData('WOMEN').then((data) {
      setState(() {
        womenProductData.addAll(data);
      });
    });
  }

  void getKids() {
    Sneakers sneakers = Sneakers();
    sneakers.fetchProductData('KIDS').then((data) {
      setState(() {
        kidsProductData.addAll(data);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
    getMen();
    getWomen();
    getKids();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    "lib/images/adidas.png",
    "lib/images/gucci.png",
    "lib/images/jordan.png",
    "lib/images/nike.png",
  ];
   String? selectedBrand; // Mark selectedBrand as late
  List tabOptions = [
    ['Men Shoe', MenStagTile()],
    ['Women Shoe', WomenStagTile()],
    ['Kids Shoe', KidsStagTile()],
  ];
  bool isMenSelected = false;
  bool isWomenSelected = false;
  bool isKidsSelected = false;

  bool isShoesSelected = false;
  bool isApparelsSelected = false;
  bool isAccessoriesSelected = false;

  bool isAdidasSelected = false;
  bool isGucciSelected = false;
  bool isJordanSelected = false;
  bool isNikeSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            Icons.filter_list_alt,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appStyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Men Shoes",
                      ),
                      Tab(
                        text: "Women Shoes",
                      ),
                      Tab(
                        text: "Kids Shoes",
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.175,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    tabOptions[0][1],
                    tabOptions[1][1],
                    tabOptions[2][1],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.84,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black38,
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Filter",
                      style: appStyle(40, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Gender",
                      style: appStyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryBtn(
                          label: "Men",
                          buttonClr: isMenSelected ? Colors.black : Colors.grey,
                          onPress: () {
                            setState(() {
                              isMenSelected = true;
                              isWomenSelected = false;
                              isKidsSelected = false;
                            });
                          },
                          isSelected: isMenSelected,
                        ),
                        CategoryBtn(
                          label: "Women",
                          buttonClr:
                              isWomenSelected ? Colors.black : Colors.grey,
                          onPress: () {
                            setState(() {
                              isMenSelected = false;
                              isWomenSelected = true;
                              isKidsSelected = false;
                            });
                          },
                          isSelected: isWomenSelected,
                        ),
                        CategoryBtn(
                          label: "Kids",
                          buttonClr:
                              isKidsSelected ? Colors.black : Colors.grey,
                          onPress: () {
                            setState(() {
                              isMenSelected = false;
                              isWomenSelected = false;
                              isKidsSelected = true;
                            });
                          },
                          isSelected: isKidsSelected,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Category",
                      style: appStyle(20, Colors.black, FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryBtn(
                          label: "Shoes",
                          buttonClr:
                              isShoesSelected ? Colors.black : Colors.grey,
                          onPress: () {
                            setState(() {
                              isShoesSelected = true;
                              isApparelsSelected = false;
                              isAccessoriesSelected = false;
                            });
                          },
                          isSelected: isShoesSelected,
                        ),
                        CategoryBtn(
                          label: "Apparels",
                          buttonClr:
                              isApparelsSelected ? Colors.black : Colors.grey,
                          onPress: () {
                            setState(() {
                              isShoesSelected = false;
                              isApparelsSelected = true;
                              isAccessoriesSelected = false;
                            });
                          },
                          isSelected: isApparelsSelected,
                        ),
                        CategoryBtn(
                          label: "Accessories",
                          buttonClr: isAccessoriesSelected
                              ? Colors.black
                              : Colors.grey,
                          onPress: () {
                            setState(() {
                              isShoesSelected = false;
                              isApparelsSelected = false;
                              isAccessoriesSelected = true;
                            });
                          },
                          isSelected: isAccessoriesSelected,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Price",
                      style: appStyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Slider(
                      value: value,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.black,
                      max: 500,
                      divisions: 50,
                      label: value.toString(),
                      onChanged: (double newValue) {
                        setState(() {
                          value = newValue;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Brand",
                      style: appStyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 80,
                      child: ListView.builder(
                        itemCount: brand.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          bool isSelected = brand[index] == selectedBrand; // Track selection

                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: GestureDetector (
                              onTap: () {
                                setState(() {
                                  selectedBrand = brand[index]; // Update the selected brand
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: isSelected ? Colors.black : Colors.grey, // Change color based on selection
                                    style: BorderStyle.solid,
                                  ),
                                  color: isSelected ? Colors.grey[200] : Colors.transparent, // Change color based on selection

                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Image.asset(
                                  brand[index],
                                  height: 60,
                                  width: 80,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )


                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
