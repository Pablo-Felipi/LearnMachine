import 'package:flutter/material.dart';
import 'package:machine/src/shared/app_shared.dart';
import 'package:machine/src/ui/controller/navigation_bar_controller.dart';

class NavigationBarWidget extends StatefulWidget {
  final NavigationBarController controller;
  final ValueChanged<int> onTapFunction;

  const NavigationBarWidget({
    super.key,
    required this.controller,
    required this.onTapFunction,
  });

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
          onTap: widget.onTapFunction,
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
