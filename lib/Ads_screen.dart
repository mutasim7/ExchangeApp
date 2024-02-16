import 'package:currency_converter/model/ads_model.dart';
import 'package:currency_converter/providers/ads_provider.dart';
import 'package:currency_converter/widgets/ads_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  Widget build(BuildContext context) {
    final adsProvider = Provider.of<AdsProvider>(context);
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      body: LiquidPullToRefresh(
        backgroundColor: const Color.fromARGB(255, 41, 162, 186),
        color: const Color.fromARGB(255, 1, 60, 106),
        onRefresh: () async {
          await adsProvider.gatAllAds();
          setState(() {});
        },
        showChildOpacityTransition: false,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/image/1.jpg'), // استبدل بمسار الصورة الخاصة بك
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder<List<AdsModel>>(
            future: adsProvider.gatAllAds(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('حدث خطأ: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return const Text('لا توجد بيانات');
              } else {
                return adsProvider.adsList.isEmpty
                    ? const Center(
                        child: Text(
                          "لم يتم إضافة إعلانات",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 1, 60, 106),
                          ),
                        ),
                      )
                    : DynamicHeightGridView(
                        itemCount: adsProvider.adsList.length,
                        builder: (context, index) {
                          return AdsWidget(
                            imagepath: adsProvider.adsList[index].imageUrl,
                          );
                        },
                        crossAxisCount: 1,
                      );
              }
            },
          ),
        ),
      ),
    );
  }
}
