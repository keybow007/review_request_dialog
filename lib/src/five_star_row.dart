import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class FiveStarRow extends StatelessWidget {
  const FiveStarRow({super.key});

  @override
  Widget build(BuildContext context) {
    Widget star(Duration delay) =>
        ZoomIn(
          delay: delay,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Icon(
              Icons.star,
              // FontAwesomeIcons.solidStar,
              size: 28,
              color: Colors.orange,
            ),
          ),
        );

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            star(const Duration(milliseconds: 200)),
            star(const Duration(milliseconds: 300)),
            star(const Duration(milliseconds: 400)),
            star(const Duration(milliseconds: 500)),
            star(const Duration(milliseconds: 600)),

          ],
        ),
      ),
    );
  }
}
