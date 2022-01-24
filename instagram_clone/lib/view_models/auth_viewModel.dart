import 'dart:async';

import 'package:instagram_clone/helper/email_password_validation.dart';

class AuthViewModel {

  final _emailSubject = StreamController<String>.broadcast();
  final _passwordSubject = StreamController<String>.broadcast();
  final _usernameSubject = StreamController<String>.broadcast();

  Sink<String> get emailSink => _emailSubject;
  Sink<String> get passwordSink => _passwordSubject;
  Sink<String> get usernameSink => _usernameSubject;

  Stream<String> get emailStream => _emailSubject.stream
      .map((email) => EmailPasswordValidation.validateEmail(email));

  Stream<String> get passwordStream => _passwordSubject.stream
      .map((password) => EmailPasswordValidation.validatePassword(password));

  Stream<String> get usernameStream => _usernameSubject.stream
      .map((username) => EmailPasswordValidation.validateUsername(username));

  dispose() {
    _emailSubject.close();
    _passwordSubject.close();
    _usernameSubject.close();
  }
}
