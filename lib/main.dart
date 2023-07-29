
import 'package:ecommerceapp/controller/main_screen_provider.dart';
import 'package:ecommerceapp/screens/product.dart';
import 'package:provider/provider.dart';

import '../shared/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>MainScreenProvider(),
      builder: (context,child)=> MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: BottomNavbar(),
      )
      ,);
  }
}
