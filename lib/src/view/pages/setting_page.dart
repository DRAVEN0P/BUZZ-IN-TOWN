import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/app/const/const.dart';
import 'package:untitled/src/view/widgets/bottom_bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black)),
                  child: Image.asset(
                    width: 100,
                    height: 100,
                    "assets/background.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const Text(
                  "Aman Singh",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "+91 9234335089",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: MaterialButton(
                    color: const Color(0xFFF8D461),
                    elevation: 0,
                    onPressed: () {},
                    child: const Text("Edit Profile"),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                _OptionCard(
                  onTap: (){
                    context.go("/crE");
                  },
                  title: "Create Event",
                  iconData: Icons.add,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                    const SizedBox(
                      height: 8,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return _OptionCard(
                        onTap: (){},
                        title: settingList[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 15,
            child: BottomBar(
              index: 3,
            ),
          ),
        ]),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({super.key,
    required this.title,
    this.iconData = Icons.navigate_next_outlined,
    required this.onTap,
  });

  final void Function() onTap;

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFFF5AD),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Icon(
              iconData,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
