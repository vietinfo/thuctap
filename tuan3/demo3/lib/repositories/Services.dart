import 'package:http/http.dart' as http;
import '../models/Users.dart';

class Services {
  static const String url =
      'http://demo.vietinfo.tech:8091/api/user/Demo_GetAll';

  static Future<List<Users>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<Users> users = usersFromJson(response.body);
        return users;
      } else {
        return <Users>[];
      }
    } catch (e) {
      return List<Users>();
    }
  }
}