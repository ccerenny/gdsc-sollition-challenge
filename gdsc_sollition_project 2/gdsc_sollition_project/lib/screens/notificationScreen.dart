import 'package:flutter/material.dart';
import 'package:gdsc_sollition_project/const/colors.dart';
import 'package:gdsc_sollition_project/utils/helper.dart';
import 'package:gdsc_sollition_project/widgets/customNavBar.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notiScreen";

  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Notifications",
                        style: Helper.getTheme(context).headline5,
                      ),
                    ),
                    Image.asset(
                      Helper.getAssetName("cart.png", "virtual"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const NotiCard(
                title: "Your order has been picked up",
                time: "Now",
              ),
              const NotiCard(
                title: "Your order has been delivered",
                time: "1 h ago",
                color: AppColor.placeholderBg,
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "3 h ago",
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "5 h ago",
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "05 Sep 2020",
                color: AppColor.placeholderBg,
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "12 Aug 2020",
                color: AppColor.placeholderBg,
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "20 Jul 2020",
              ),
              const NotiCard(
                title: "Lorem ipsum dolor sit amet, consectetur",
                time: "12 Jul 2020",
              ),
            ],
          )),
          const Positioned(
              bottom: 0,
              left: 0,
              child: CustomNavBar(
                menu: true,
              ))
        ],
      ),
    );
  }
}

class NotiCard extends StatelessWidget {
  const NotiCard({
    super.key,
    required String time,
    required String title,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _color = color;

  final String _time;
  final String _title;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
        border: const Border(
          bottom:  BorderSide(
            color: AppColor.placeholder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 5,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _title,
                style: const TextStyle(
                  color: AppColor.primary,
                ),
              ),
              Expanded(child: Text(_time)),
            ],
          )
        ],
      ),
    );
  }
}
