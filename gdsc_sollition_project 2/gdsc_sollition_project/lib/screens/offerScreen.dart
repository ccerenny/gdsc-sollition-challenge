import 'package:flutter/material.dart';
import 'package:gdsc_sollition_project/const/colors.dart';
import 'package:gdsc_sollition_project/utils/helper.dart';
import 'package:gdsc_sollition_project/widgets/customNavBar.dart';

class OfferScreen extends StatelessWidget {
  static const routeName = "/offerScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Housewives",
                            style: Helper.getTheme(context).headline5,
                          ),
                          Image.asset(
                            Helper.getAssetName("cart.png", "virtual"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [Text("Find discounts, Offer special")],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         height: 30,
                    //         width: Helper.getScreenWidth(context) * 0.4,
                    //         child: ElevatedButton(
                    //             onPressed: () {}, child: const Text("Check Offers")),
                    //       ),
                    //     ],
                    //   ),
                    // // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    OfferCard(
                      image: Image.asset(
                        Helper.getAssetName("breakfast.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Cafe de Noires",
                    ),
                    OfferCard(
                      image: Image.asset(
                        Helper.getAssetName("western2.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Isso",
                    ),
                    OfferCard(
                      image: Image.asset(
                        Helper.getAssetName("coffee3.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                      name: "Cafe Beans",
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              offer: true,
            ),
          )
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required String name,
    required Image image,
  })  : _image = image,
        _name = name;

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: _image),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  _name,
                  style: Helper.getTheme(context)
                      .headline4
                      ?.copyWith(color: AppColor.primary),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Image.asset(
                  Helper.getAssetName("star_filled.png", "virtual"),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "4.9",
                  style: TextStyle(
                    color: AppColor.orange,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text("(124 ratings) Cafe"),
                const SizedBox(
                  width: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    ".",
                    style: TextStyle(
                        color: AppColor.orange, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(" Western Food"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
