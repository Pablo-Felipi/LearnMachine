import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:machine/src/domain/models/student/student_model.dart';
import 'package:machine/src/shared/app_shared.dart';
import 'package:machine/src/ui/widgets/simple_text_widget.dart';

class StudentListContainerWidget extends StatelessWidget {
  final StudentModel student;
  final String editSvg = 'assets/svg/edit.svg';
  const StudentListContainerWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppShared.defaultBlueColor,
        ),
        child: ListTile(
          leading: CircleAvatar(backgroundColor: Colors.white),
          title: SimpleTextWidget(
            text: student.name,
            fontSizeText: 14,
            fontWeightText: FontWeight.bold,
            colorText: Colors.white,
          ),
          subtitle: SimpleTextWidget(
            text: student.address.city.name,
            fontSizeText: 12,
            fontWeightText: FontWeight.w500,
            colorText: Colors.white,
          ),

          trailing: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(editSvg),
          ),
        ),
      ),
    );
  }
}
