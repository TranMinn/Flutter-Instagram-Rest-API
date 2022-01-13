
import 'package:instagram_clone/models/User.dart';
import 'package:instagram_clone/services/auth.dart';

class SignUpViewModel {
  final AuthService _auth = AuthService();

  Future<MyUserData> registerUser(String email, String fullName, String username, String password) async {
    return await _auth.registerUser(email, fullName, username, password);
  }

}