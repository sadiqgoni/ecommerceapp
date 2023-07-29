import 'package:ecommerceapp/shared/index.dart';
class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(120))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Athletics Shoes",
                        style: appStyleLarge(
                            42, Colors.white, FontWeight.bold, 0.0)),
                    const SizedBox(width: 40,),
                    Container(
                      height: 60,
                      width: 20,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(0),
                              bottom: Radius.circular(20))),
                      child: const Text(''),
                    )
                  ],
                ),
                Text("Collections ",
                    style: appStyleLarge(
                        42, Colors.white, FontWeight.bold, 0.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
