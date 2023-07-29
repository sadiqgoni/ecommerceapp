import 'package:ecommerceapp/model/sneakers_model.dart';
import 'package:ecommerceapp/shared/index.dart';
import 'package:ecommerceapp/shared/staggarredList.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../services/helper.dart';

class WomenStagTile extends StatefulWidget {
  WomenStagTile({Key? key}) : super(key: key);

  @override
  State<WomenStagTile> createState() => _WomenStagTileState();
}

class _WomenStagTileState extends State<WomenStagTile> {
  List<SneakersShop> womenProductData = [];

  void getWomen() {
    Sneakers sneakers = Sneakers();
    sneakers.fetchProductData('WOMEN').then((data) {
      setState(() {
        womenProductData.addAll(data);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getWomen();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        children: [
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              scrollDirection: Axis.vertical,
              itemCount: womenProductData.length,
              itemBuilder: (context, index) {
                final currentShoesWomen = womenProductData[index];
                return StaggerTile(

                    imageUrl: currentShoesWomen.imageUrl,
                    name: currentShoesWomen.name,
                    price: "\$${currentShoesWomen.price}"
                );
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.extent(
                  (index % 2 == 0) ? 1 : 1,
                  (index % 4 == 1 || index % 4 == 3)
                      ? MediaQuery.of(context).size.height * 0.40
                      : MediaQuery.of(context).size.height * 0.34,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
