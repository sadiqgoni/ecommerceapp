import 'package:flutter/material.dart';
import 'package:ecommerceapp/shared/index.dart';
import 'package:provider/provider.dart';
import '../controller/main_screen_provider.dart';
import '../model/sneakers_model.dart';
import '../services/helper.dart';
import '../shared/midProduct_card.dart';
import '../shared/product_card.dart';
import 'more_details_page.dart';
import 'shoe_details.dart';

class MenShoePage extends StatefulWidget {
  MenShoePage({Key? key}) : super(key: key);

  @override
  State<MenShoePage> createState() => _MenShoePageState();
}

class _MenShoePageState extends State<MenShoePage> {
  Sneakers sneakers = Sneakers();
  late Future<List<SneakersShop>> menProductData;

  @override
  void initState() {
    super.initState();
    menProductData = sneakers.fetchProductData('MEN');
  }

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<MainScreenProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: FutureBuilder<List<SneakersShop>>(
        future: menProductData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Error fetching men product data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No men product data available'));
          } else {
            List<SneakersShop> menProductData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: menProductData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final menShoes = menProductData[index];
                        return GestureDetector(
                          onTap: () {
                            productNotifier.shoeSizes = menShoes.sizes;
                            print(productNotifier.shoeSize);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoreDetailsPage(
                                          name: menShoes.name,
                                          category: menShoes.category,
                                          id: menShoes.id,
                                          price: menShoes.price,
                                          gender: menShoes.gender,
                                          itemsLeft: menShoes.itemsLeft,

                                        )));
                          },
                          child: ProductCard(
                              name: menShoes.name,
                              category: menShoes.category,
                              id: menShoes.id,
                              price: menShoes.price,
                              gender: menShoes.gender,
                              itemsLeft: menShoes.itemsLeft,
                            image: menShoes.imageUrl,
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: Container(
                      color: Colors.grey[400],
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Latest Shoes",
                                  style: appStyle(
                                    18,
                                    Colors.black,
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                            tabIndex: 2,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Show All',
                                      style: appStyle(
                                        18,
                                        Colors.black,
                                        FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 4.0),
                                    child: Icon(Icons.navigate_next),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: menProductData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final menShoes = menProductData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoreDetailsPage(
                                        name: menShoes.name,
                                        category: menShoes.category,
                                        id: menShoes.id,
                                        price: menShoes.price,
                                        gender: menShoes.gender,
                                        itemsLeft: menShoes.itemsLeft,
                                        )));
                          },
                          child: MidProduct_card(
                            image: menShoes.imageUrl,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
