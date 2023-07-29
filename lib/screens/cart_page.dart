import '../shared/index.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("CartPage",style:appStyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
