import 'package:ecommerceapp/controller/main_screen_provider.dart';
import 'package:provider/provider.dart';

import '../shared/index.dart';
import '../tab_pages/more_details_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<Widget> _children =  [
    HomePage(),
    SearchPage(),
    MainPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
        builder: (context, mainScreenProvider, child) {
      return Scaffold(
        body: _children[mainScreenProvider.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainScreenProvider.selectedIndex,
          onTap: mainScreenProvider.navigationBottomNavbar,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: mainScreenProvider.selectedIndex == 0
                    ? const Icon(Icons.home)
                    : const Icon(Icons.home_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: mainScreenProvider.selectedIndex == 1
                    ? const Icon(Icons.search)
                    : const Icon(Icons.search),
                label: ''),
            BottomNavigationBarItem(
                icon: mainScreenProvider.selectedIndex == 2
                    ? const Icon(Icons.add)
                    : const Icon(Icons.add_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: mainScreenProvider.selectedIndex == 3
                    ? const Icon(Icons.shopping_cart)
                    : const Icon(Icons.shopping_cart_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: mainScreenProvider.selectedIndex == 4
                    ? const Icon(Icons.person)
                    : const Icon(Icons.person_outlined),
                label: ''),
          ],
        ),
      );
    });
  }
}
