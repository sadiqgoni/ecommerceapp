import '../shared/index.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ProfilePage",style:appStyle(40, Colors.black, FontWeight.bold),),
      ),
    );
  }
}
