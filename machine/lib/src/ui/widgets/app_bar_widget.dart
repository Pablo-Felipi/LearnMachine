import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 20),
        child: SvgPicture.asset('assets/svg/yofunding.svg'),
      ),
      leadingWidth: 180,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
