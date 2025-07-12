import 'package:flutter/material.dart';
import 'package:machine/src/data/repositories/adress_from_zipcode/adress_viacep_repository.dart';
import 'package:machine/src/data/repositories/student/student_repository.dart';
import 'package:machine/src/data/services/adress_from_zipcode_clients/http_client_adress.dart';
import 'package:machine/src/data/services/student_clients/http_client_student.dart';
import 'package:machine/src/shared/app_shared.dart';
import 'package:machine/src/ui/controller/adress_from_zicode_controller.dart';
import 'package:machine/src/ui/controller/create_page_controller.dart';
import 'package:machine/src/ui/controller/student_form_controller.dart';
import 'package:machine/src/ui/controller/students_controller.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // todos os seus Providers aqui:
        ChangeNotifierProvider(
          create:
              (context) => StudentsController(
                repository: StudentRepository(
                  client: HttpClientStudent(),
                  urlBase: AppShared.studentUrl,
                ),
              ),
        ),
        ChangeNotifierProvider(
          create:
              (context) => AddressFromZicodeController(
                repository: AdressViacepRepository(
                  client: HttpClientAdress(),
                  urlAdress: AppShared.cepUrl,
                ),
              ),
        ),
        ChangeNotifierProvider(create: (context) => CreatePageController()),
        ChangeNotifierProvider(create: (context) => StudentFormController()),
      ],
      child: child,
    );
  }
}
