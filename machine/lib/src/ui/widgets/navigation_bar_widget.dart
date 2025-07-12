import 'package:flutter/material.dart';
import 'package:machine/src/shared/app_shared.dart';
import 'package:machine/src/ui/controller/navigation_bar_controller.dart';
import 'package:machine/src/ui/view/create/create_page.dart';

class NavigationBarWidget extends StatefulWidget {
  final NavigationBarController controller;
  const NavigationBarWidget({super.key, required this.controller});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppShared.defaultBlueColor,
          currentIndex: widget.controller.currentIndex,

          onTap: (value) {
            widget.controller.setCurrentIndex(index: value);
            switch (value) {
              case 1:
                Navigator.of(context).pushNamed(CreatePage.createRoute);
                break;
            }
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_rounded,
                size: widget.controller.currentIndex == 0 ? 50 : 25,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_rounded,
                size: widget.controller.currentIndex == 1 ? 50 : 25,
              ),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_rounded,
                size: widget.controller.currentIndex == 2 ? 50 : 25,
              ),
              label: '',
            ),
          ],
        );
      },
    );
  }
}
