import '../shared/index.dart';

class MainScreenProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  get selectedIndex => _selectedIndex;


  void _navigationBottomNavbar(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  get navigationBottomNavbar {
    return _navigationBottomNavbar;
  }


  List<dynamic> _shoeSize = [];
  List<dynamic> get shoeSize => _shoeSize;
  set shoeSizes(List<dynamic> newSizes){
    _shoeSize = newSizes;
    notifyListeners();

  }

  void toggleCheck(int index){
    for(int i = 0;i < _shoeSize.length;i++){
      if(i == index){
        _shoeSize[index]['isSelected'] = !_shoeSize[index]['isSelected'];
      }
    }
  }
}
