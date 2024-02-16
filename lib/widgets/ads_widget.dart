// ignore_for_file: prefer_const_constructors

import 'package:currency_converter/providers/api_links.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({
    super.key,
    required this.imagepath,
  });

  final String imagepath;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 7),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: Color.fromARGB(255, 1, 60, 106)),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: FancyShimmerImage(
                  imageUrl: ApiLinks.linkStorage + imagepath,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
