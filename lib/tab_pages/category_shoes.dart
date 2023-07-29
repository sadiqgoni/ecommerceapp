// import 'package:flutter/material.dart';
//
// import '../shared/app_style.dart';
//
// class CategoryBtn extends StatelessWidget {
//   const CategoryBtn(
//       {super.key, required this.onPress, required this.buttonClr, required this.label});
//   final void Function()? onPress;
//   final Color buttonClr;
//   final String label;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: onPress,
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(
//               width: 1,
//               color: buttonClr,
//               style: BorderStyle.solid,
//             ),
//             borderRadius: const BorderRadius.all(Radius.circular(9))),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             label,
//             style: appStyle(20, buttonClr, FontWeight.w600),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import '../shared/index.dart';

class CategoryBtn extends StatelessWidget {
  final String label;
  final Color buttonClr;
  final VoidCallback onPress;
  final bool isSelected;

  const CategoryBtn({
    Key? key,
    required this.label,
    required this.buttonClr,
    required this.onPress,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = isSelected ? Colors.black : Colors.grey;
    Color bgColor = isSelected ? Colors.black : Colors.grey.shade500;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: bgColor,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
