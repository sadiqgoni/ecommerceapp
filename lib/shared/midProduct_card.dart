import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapp/shared/index.dart';

class MidProduct_card extends StatelessWidget {
  final String image;
  const MidProduct_card({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 1,
                  blurRadius: 0.8,
                  offset: Offset(0, 1),
                )
              ]),
          width: MediaQuery.of(context).size.width * 0.28,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: image,

              fit: BoxFit.fill,
            ),
          )),
    );
  }
}
