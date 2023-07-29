import 'package:google_fonts/google_fonts.dart';

import '../shared/index.dart';
import '../tab_pages/kids_shoes.dart';
import '../tab_pages/men_shoes.dart';
import '../tab_pages/women_shoes.dart';
import '../utils/app_bar.dart';
import '../utils/tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tabOptions =  [
    ['Men Shoe', MenShoePage()],
    ['Women Shoe',  WomenShoePage()],
    ['Kids Shoe',  KidsShoePage()],
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            const MyAppBar(),
            Container(

              // color: Colors.grey[200],
                height: 650,
                child: Tabbar(tabOptions: tabOptions))
          ],
        ),
      ),
    );
  }
}

