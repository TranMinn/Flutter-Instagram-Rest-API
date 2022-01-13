
import 'package:instagram_clone/models/User.dart';
import 'package:instagram_clone/services/auth.dart';

class LoginViewModel {
  final AuthService _auth = AuthService();

  Future<MyUserData> loginUser(String email, String password) async {
    return await _auth.loginUser(email, password);
  }

}