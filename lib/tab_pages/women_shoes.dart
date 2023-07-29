import 'package:flutter/material.dart';
import 'package:ecommerceapp/shared/index.dart';
import '../model/sneakers_model.dart';
import '../services/helper.dart';
import '../shared/midProduct_card.dart';
import '../shared/product_card.dart';
import 'more_details_page.dart';
import 'shoe_details.dart';

class WomenShoePage extends StatefulWidget {
  WomenShoePage({Key? key}) : super(key: key);

  @override
  State<WomenShoePage> createState() => _WomenShoePageState();
}

class _WomenShoePageState extends State<WomenShoePage> {
  Sneakers sneakers = Sneakers();
  late Future<List<SneakersShop>> womenProductData;

  @override
  void initState() {
    super.initState();
    womenProductData = sneakers.fetchProductData('WOMEN');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: FutureBuilder<List<SneakersShop>>(
        future: womenProductData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Error fetching women product data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Women product data available'));
          } else {
            List<SneakersShop> womenProductData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: womenProductData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final womenShoes = womenProductData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoreDetailsPage(
                                          name: womenShoes.name,
                                          category: womenShoes.category,
                                          id: womenShoes.id,
                                          price: womenShoes.price,
                                          gender: womenShoes.gender,
                                          itemsLeft: womenShoes.itemsLeft,
                                        )));
                          },
                          child: ProductCard(
                            name: womenShoes.name,
                            category: womenShoes.category,
                            id: womenShoes.id,
                            price: womenShoes.price,
                            gender: womenShoes.gender,
                            itemsLeft: womenShoes.itemsLeft,
                            image: womenShoes.imageUrl,
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
                                            tabIndex: 1,
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
                      itemCount: womenProductData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final womenShoes = womenProductData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoreDetailsPage(
                                          name: womenShoes.name,
                                          category: womenShoes.category,
                                          id: womenShoes.id,
                                          price: womenShoes.price,
                                          gender: womenShoes.gender,
                                          itemsLeft: womenShoes.itemsLeft,
                                        )));
                          },
                          child: MidProduct_card(
                            image: womenShoes.imageUrl,
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
