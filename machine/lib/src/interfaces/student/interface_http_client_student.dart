abstract class InterfaceHttpClientStudent {
  Future getData({required String url});
  Future updateData({required String url, required Map<String, dynamic> map});
  Future createData({required String url, required Map<String, dynamic> map});
  Future deleteData({required String url, required int id});
}
