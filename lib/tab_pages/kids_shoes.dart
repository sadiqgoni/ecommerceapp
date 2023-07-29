import 'package:flutter/material.dart';
import 'package:ecommerceapp/shared/index.dart';
import '../model/sneakers_model.dart';
import '../services/helper.dart';
import '../shared/midProduct_card.dart';
import '../shared/product_card.dart';
import 'more_details_page.dart';
import 'shoe_details.dart';

class KidsShoePage extends StatefulWidget {
  KidsShoePage({Key? key}) : super(key: key);

  @override
  State<KidsShoePage> createState() => _KidsShoePageState();
}

class _KidsShoePageState extends State<KidsShoePage> {
  Sneakers sneakers = Sneakers();
  late Future<List<SneakersShop>> kidsProductData;

  @override
  void initState() {
    super.initState();
    kidsProductData = sneakers.fetchProductData('KIDS');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: FutureBuilder<List<SneakersShop>>(
        future: kidsProductData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching kids product data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No kids product data available'));
          } else {
            List<SneakersShop> kidsProductData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: kidsProductData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final kidsShoes = kidsProductData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoreDetailsPage(
                                      name: kidsShoes.name,
                                      category: kidsShoes.category,
                                      id: kidsShoes.id,
                                      price: kidsShoes.price,
                                      gender: kidsShoes.gender,
                                      itemsLeft: kidsShoes.itemsLeft,
                                    )));
                          },
                          child: ProductCard(
                            name: kidsShoes.name,
                            category: kidsShoes.category,
                            id: kidsShoes.id,
                            price: kidsShoes.price,
                            gender: kidsShoes.gender,
                            itemsLeft: kidsShoes.itemsLeft, image: kidsShoes.imageUrl,
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
                                          builder: (context) =>
                                              ProductDetails(
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
                      itemCount: kidsProductData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final kidsShoes = kidsProductData[index];
                        return  GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  MoreDetailsPage(
                                      name: kidsShoes.name,
                                      category: kidsShoes.category,
                                      id: kidsShoes.id,
                                      price: kidsShoes.price,
                                      gender: kidsShoes.gender,
                                      itemsLeft: kidsShoes.itemsLeft,
                                    )));
                          },
                          child: MidProduct_card(
                            image: kidsShoes.imageUrl,
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
