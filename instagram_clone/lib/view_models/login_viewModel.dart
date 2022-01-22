import 'package:instagram_clone/services/auth.dart';

class LoginViewModel {
  final AuthService _auth = AuthService();

  Future<String> loginUser(String username, String password) async {
    return await _auth.loginUser(username, password);
  }

}