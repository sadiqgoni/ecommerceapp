import 'package:ecommerceapp/model/sneakers_model.dart';
import 'package:ecommerceapp/shared/index.dart';
import 'package:ecommerceapp/shared/staggarredList.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../services/helper.dart';

class KidsStagTile extends StatefulWidget {
  KidsStagTile({Key? key}) : super(key: key);

  @override
  State<KidsStagTile> createState() => _KidsStagTileState();
}

class _KidsStagTileState extends State<KidsStagTile> {
  List<SneakersShop> kidsProductData = [];

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
    getKids();
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
              itemCount: kidsProductData.length,
              itemBuilder: (context, index) {
                final currentShoesKids = kidsProductData[index];
                return StaggerTile(
                    imageUrl: currentShoesKids.imageUrl,
                    name: currentShoesKids.name,
                    price: "\$${currentShoesKids.price}"
                );
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.extent(
                  (index % 2 == 0) ? 1 : 1,
                  (index % 4 == 1 || index % 4 == 3)
                      ? MediaQuery.of(context).size.height * 0.40
                      : MediaQuery.of(context).size.height * 0.38,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
