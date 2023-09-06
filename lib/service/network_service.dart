
import 'package:http/http.dart';
import '../care/apis.dart';


sealed class Network{

  static Future<String?> methodGet({required String api, String? id, Map<String, String> headers = Apis.headers,}) async {
    try {
      Uri url = Uri.https(Apis.baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await get(url, headers: headers);
      if(response.statusCode == 200) {
        return response.body;
      }
    } catch(e) {
      return null;
    }
    return null;
  }
  //
  // static List<> parseCharacterList(String data) {
  //   final json = jsonDecode(data) as List;
  //   return json.map((item) => Character.fromJson(item)).toList();
  // }

// static List<UserModel> parseUserList(String data) {
//   final json = jsonDecode(data) as List;
//   return json.map((json) => UserModel.fomJson(json as Map<String,Object?>)).toList();
//}

}
