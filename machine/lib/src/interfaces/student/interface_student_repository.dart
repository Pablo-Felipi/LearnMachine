abstract class InterfaceStudentRepository {
  Future getStudent();
  Future updateStudent({required Map<String, dynamic> map});
  Future createStudent({required Map<String, dynamic> map});
  Future deleteStudent({required int id});
}
