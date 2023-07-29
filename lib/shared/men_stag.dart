import 'package:ecommerceapp/shared/index.dart';
import 'package:ecommerceapp/shared/staggarredList.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../model/sneakers_model.dart';
import '../services/helper.dart';

class MenStagTile extends StatefulWidget {
  MenStagTile({Key? key}) : super(key: key);

  @override
  State<MenStagTile> createState() => _MenStagTileState();
}

class _MenStagTileState extends State<MenStagTile> {
  List<SneakersShop> menProductData = [];

  void getMen() {
    Sneakers sneakers = Sneakers();
    sneakers.fetchProductData('MEN').then((data) {
      setState(() {
        menProductData.addAll(data);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMen();
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
              itemCount: menProductData.length,
              itemBuilder: (context, index) {
                final currentShoesMen = menProductData[index];
                return StaggerTile(
                    imageUrl: currentShoesMen.imageUrl,
                    name: currentShoesMen.name,
                    price: "\$${currentShoesMen.price}"
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
