import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({
    Key? key,
    required this.tabOptions,
  }) : super(key: key);

  final List tabOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelColor: Colors.grey[500],
            labelStyle: GoogleFonts.bebasNeue(fontSize: 24),
            // isScrollable: true,
            tabs: [
              Tab(
                child: Text(
                  tabOptions[0][0],
                ),
              ),
              Tab(
                height: 30,
                child: Text(
                  tabOptions[1][0],
                ),
              ),
              Tab(
                child: Text(
                  tabOptions[2][0],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            children: [
              tabOptions[0][1],
              tabOptions[1][1],
              tabOptions[2][1],
            ],
          ),
        ),
      ],
    );
  }
}
