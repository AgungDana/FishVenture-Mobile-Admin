import 'package:admin/common/http/http.dart';
import 'package:admin/config/hosts.dart';
import 'package:admin/modules/pond/model/model_pond.dart';
import 'package:admin/modules/pond/model/service_pond.dart';

class PondHttpRepo extends HttpService implements PondService {
  @override
  Future<List<PondModel>> getListPond() async {
    try {
      final response = await get('$host/list-pond');
      if (response is List) {
        return List<Map<String, dynamic>>.from(response)
            .map((e) => PondModel.fromMap(e))
            .toList();
      }
      throw 'Can\'t parse pond model';
    } catch (e) {
      rethrow;
    }
  }
}
