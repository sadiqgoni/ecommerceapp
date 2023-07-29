import '../shared/index.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SearchPage",style:appStyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
