import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String companyLogo = 'assets/svg/yofunding.svg';
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 20),
        child: SvgPicture.asset(companyLogo),
      ),
      leadingWidth: 180,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
