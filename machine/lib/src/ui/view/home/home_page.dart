import 'package:flutter/material.dart';
import 'package:learn_machine/src/ui/controller/navigation_bar_controller.dart';
import 'package:learn_machine/src/ui/controller/students_controller.dart';
import 'package:learn_machine/src/ui/widgets/app_bar_widget.dart';
import 'package:learn_machine/src/ui/widgets/center_circular_progress_indicator_widget.dart';
import 'package:learn_machine/src/ui/widgets/center_text_is_error_widget.dart';
import 'package:learn_machine/src/ui/widgets/get_student_api_button_widget.dart';
import 'package:learn_machine/src/ui/widgets/navigation_bar_widget.dart';
import 'package:learn_machine/src/ui/widgets/student_list_container_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const homeRoute = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final studentController = Provider.of<StudentsController>(context);

    return Scaffold(
      appBar: const AppBarWidget(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (studentController.isLoading) {
            return const CenterCircularProgressIndicatorWidget();
          }

          if (studentController.isError.isNotEmpty) {
            return CenterTextIsErrorWidget(text: studentController.isError);
          }

          if (studentController.state.isEmpty) {
            return GetStudentApiButtonWidget(onPressed: studentController.get);
          }

          return ListView.separated(
            itemCount: studentController.state.length,
            separatorBuilder: (context, index) => SizedBox(height: 1),
            itemBuilder: (context, index) {
              final student = studentController.state[index];
              return StudentListContainerWidget(student: student);
            },
          );
        },
      ),
      bottomNavigationBar: NavigationBarWidget(
        controller: NavigationBarController(),
      ),
    );
  }
}
