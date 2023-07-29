// import 'package:ecommerceapp/shared/index.dart';
// import '../services/helper.dart';
//
// class ProductPage extends StatefulWidget {
//   @override
//   _ProductPageState createState() => _ProductPageState();
// }
//
// class _ProductPageState extends State<ProductPage> {
//   List<dynamic> menProductData = [];
//   List<dynamic> femaleProductData = [];
//   List<dynamic> kidsProductData = [];
//
//   void getMale() {
//     fetchProductData('MEN').then((data) {
//       setState(() {
//         menProductData.addAll(data);
//       });
//     });
//   }
//
//   void getFemale() {
//     fetchProductData('WOMEN').then((data) {
//       setState(() {
//         femaleProductData.addAll(data);
//       });
//     });
//   }
//
//   void getKids() {
//     fetchProductData('KIDS').then((data) {
//       setState(() {
//         kidsProductData.addAll(data);
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getMale();
//     getFemale();
//     getKids();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Page'),
//       ),
//       body: kidsProductData.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//         itemCount: kidsProductData.length,
//         itemBuilder: (context, index) {
//           final product = kidsProductData[index];
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ListTile(
//               title: Text(product['name']),
//               subtitle: Text(product['gender']),
//               leading: Image.network(product['imageURL']),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
