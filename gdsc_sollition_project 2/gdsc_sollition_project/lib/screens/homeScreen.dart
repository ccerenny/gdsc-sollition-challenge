import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_sollition_project/screens/moreScreen.dart';
import 'package:gdsc_sollition_project/service/auth.firebase.dart';
import 'package:gdsc_sollition_project/widgets/searchBar.dart';

import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customNavBar.dart';
import '../screens/individualItem.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseService firebaseService = FirebaseService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Good morning ${user!.displayName ?? ""}",
                          style: Helper.getTheme(context).headlineSmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MoreScreen()));
                          },
                          child: const Icon(Icons.more_vert),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: 20,
                  //   ),
                  //   child: Text("Deilivering to"),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 20,
                  //   ),
                  //   child: DropdownButtonHideUnderline(
                  //     child: SizedBox(
                  //       width: 250,
                  //       child: DropdownButton(
                  //         value: "current location",
                  //         items: const [
                  //           DropdownMenuItem(
                  //             child: Text("Current Location"),
                  //             value: "current location",
                  //           ),
                  //         ],
                  //         icon: Image.asset(
                  //           Helper.getAssetName(
                  //               "dropdown_filled.png", "virtual"),
                  //         ),
                  //         style: Helper.getTheme(context).headline4,
                  //         onChanged: (_) {},
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SearchBarMenu(
                    title: "Search Food",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Restaurants",
                          style: Helper.getTheme(context).headline5,
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text("View all"))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RestaurantCard(
                    image: Image.asset(
                      Helper.getAssetName("foof_1.jpeg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Flavor Corner",
                    ratings: '129',
                  ),
                  RestaurantCard(
                    image: Image.asset(
                      Helper.getAssetName("food_2.jpeg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Home Flavors Market",
                    ratings: '133',
                  ),
                  RestaurantCard(
                    image: Image.asset(
                      Helper.getAssetName("food_3.jpeg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Street Tastes",
                    ratings: '100',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Neighbor's choice",
                          style: Helper.getTheme(context).headline5,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("View all"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MostPopularCard(
                            image: Image.asset(
                              Helper.getAssetName("pizza2.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Fame Cafe",
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          MostPopularCard(
                            name: "Burger by Bella",
                            image: Image.asset(
                              Helper.getAssetName("dessert3.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today chef's plate",
                          style: Helper.getTheme(context).headline5,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("View all"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(IndividualItem.routeName);
                          },
                          child: RecentItemCard(
                            image: Image.asset(
                              Helper.getAssetName("food_4.jpeg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Kumpiro",
                          ),
                        ),
                        RecentItemCard(
                            image: Image.asset(
                              Helper.getAssetName("coffee.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Barita"),
                        RecentItemCard(
                            image: Image.asset(
                              Helper.getAssetName("pizza.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Street Tastes Pizza"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // const Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: CustomNavBar(
          //     home: true,
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(home: true),
    );
  }
}

class RecentItemCard extends StatelessWidget {
  const RecentItemCard({
    required String name,
    required Image image,
  })  : _name = name,
        _image = image;

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 80,
            height: 80,
            child: _image,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name,
                  style: Helper.getTheme(context)
                      .headline4
                      ?.copyWith(color: AppColor.primary),
                ),
                const Row(
                  children: [
                    Text("Cafe"),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          color: AppColor.orange,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Food"),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
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
                    const SizedBox(width: 10),
                    const Text('(124) Ratings')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MostPopularCard extends StatelessWidget {
  const MostPopularCard({
    super.key,
    required String name,
    required Image image,
  })  : _name = name,
        _image = image;

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 350,
            height: 200,
            child: _image,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headline4
              ?.copyWith(color: AppColor.primary),
        ),
        Row(
          children: [
            const Text("Cafe"),
            const SizedBox(
              width: 5,
            ),
            // const Padding(
            //   padding: EdgeInsets.only(bottom: 5.0),
            //   child: Text(
            //     ".",
            //     style: TextStyle(
            //       color: AppColor.orange,
            //       fontWeight: FontWeight.w900,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   width: 5,
            // ),
            // const Text("Western Food"),
            const SizedBox(
              width: 20,
            ),
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
            )
          ],
        )
      ],
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required String name,
    required Image image,
    required this.ratings,
  })  : _image = image,
        _name = name;

  final String _name, ratings;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 200, width: double.infinity, child: _image),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _name,
                      style: Helper.getTheme(context).headline3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
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
                    Text('$ratings Ratings' ),
                    const SizedBox(
                      width: 5,
                    ),
                    // const Text("Cafe"),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(bottom: 5.0),
                    //   child: Text(
                    //     ".",
                    //     style: TextStyle(
                    //       color: AppColor.orange,
                    //       fontWeight: FontWeight.w900,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    required Image image,
    required String name,
  })  : _image = image,
        _name = name;

  final String _name;
  final Image _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 100,
            height: 100,
            child: _image,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          _name,
          style: Helper.getTheme(context)
              .headline4
              ?.copyWith(color: AppColor.primary, fontSize: 16),
        ),
      ],
    );
  }
}
