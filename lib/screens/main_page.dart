import '../shared/index.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("MainPage",style:appStyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
