import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/shared/index.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/main_screen_provider.dart';
import '../model/sneakers_model.dart';
import '../services/helper.dart';

class MoreDetailsPage extends StatefulWidget {
  final String price;
  final String category;
  final int id;
  final int itemsLeft;
  final String name;
  final String gender;
  const MoreDetailsPage(
      {super.key,
      required this.price,
      required this.category,
      required this.id,
      required this.itemsLeft,
      required this.name,
      required this.gender});
  @override
  State<MoreDetailsPage> createState() => _MoreDetailsPageState();
}

class _MoreDetailsPageState extends State<MoreDetailsPage> {
  final PageController _pageController = PageController();
  Sneakers sneakers = Sneakers();

  late Future<List<SneakersShop>> _sneaker;

  void getShoes() {
    _sneaker = sneakers.getSneakersByItems(
      widget.id,
      widget.gender,
      widget.name,
      widget.category,
      widget.itemsLeft,
      widget.price,
    );
  }

  @override
  void initState() {
    super.initState();
    getShoes();
  }

  @override
  Widget build(BuildContext context) {
    // var productNotifier = Provider.of<MainScreenProvider>(context);
    return Scaffold(
        body: FutureBuilder<List<SneakersShop>>(
      future: _sneaker,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error fetching men product data'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No men product data available'));
        } else {
          List<SneakersShop> sneaker = snapshot.data!;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                leadingWidth: 0,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.more_horiz,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                pinned: true,
                snap: false,
                floating: true,
                backgroundColor: Colors.transparent,
                expandedHeight: MediaQuery.of(context).size.height,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            controller: _pageController,
                            onPageChanged: (page) {},
                            itemBuilder: (context, index) {
                              final currentImage = sneaker[index];

                              return Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.39,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.grey,
                                    child: CachedNetworkImage(
                                      imageUrl: currentImage.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                      top: MediaQuery.of(context).size.height *
                                          0.09,
                                      right: 20,
                                      child: const Icon(
                                        Icons.favorite_border_rounded,
                                        color: Colors.grey,
                                      )),
                                  Positioned(
                                    top: 250,
                                    bottom: 0,
                                    left: 160,
                                    child: SmoothPageIndicator(
                                      controller: _pageController,
                                      count: 3,
                                      effect: JumpingDotEffect(
                                          activeDotColor: Colors.black,
                                          dotColor: Colors.deepPurple.shade100,
                                          dotHeight: 10,
                                          dotWidth: 10,
                                          spacing: 15,
                                          verticalOffset: 20),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                      Positioned(
                        bottom: 20,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.645,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: appStyle(
                                        32, Colors.black, FontWeight.bold),
                                  ),
                                  // Text(
                                  //   widget.category,
                                  //   style: appStyle(
                                  //       40, Colors.black, FontWeight.bold),
                                  // ),
                                  // Text(
                                  //   widget.itemsLeft.toString(),
                                  //   style: appStyle(
                                  //       40, Colors.black, FontWeight.bold),
                                  // ),
                                  // Text(
                                  //   widget.id.toString(),
                                  //   style: appStyle(
                                  //       40, Colors.black, FontWeight.bold),
                                  // ),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        widget.category,
                                        style: appStyle(
                                            20, Colors.grey, FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 4,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 22,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Colors.black,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${widget.price}",
                                        style: appStyle(
                                            26, Colors.black, FontWeight.w600),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Colors',
                                            style: appStyle(18, Colors.black,
                                                FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const CircleAvatar(
                                            radius: 7,
                                            backgroundColor: Colors.black,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const CircleAvatar(
                                            radius: 7,
                                            backgroundColor: Colors.red,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Select Sizes',
                                            style: appStyle(20, Colors.black,
                                                FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'View size guide',
                                            style: appStyle(20, Colors.grey,
                                                FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        child: ListView.builder(
                                            itemCount: 3,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              bool isSelected = true;
                                              return ChoiceChip(
                                                  label: const Text("label"),
                                                  selected: isSelected);
                                            }),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      },
    ));
  }
}
