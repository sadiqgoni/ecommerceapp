import 'package:google_fonts/google_fonts.dart';

import '../shared/index.dart';

TextStyle appStyle(double size,Color color, FontWeight fw){
  return GoogleFonts.adventPro(fontSize: size,fontWeight: fw,color: color,);
}
TextStyle appStyleLarge(double size,Color color, FontWeight fw,double ht){
  return GoogleFonts.bebasNeue(fontSize: size,fontWeight: fw,color: color,height: ht);
}