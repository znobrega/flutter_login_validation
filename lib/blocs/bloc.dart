import 'dart:async';

import 'package:login_bloc/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators{
  // BehaviorSubject is a special streamcontroller
  // and has the last value that came to the stream

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email,
   password, (e, p) => true);

  // Change data 
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

  }

  // Clean up
  dispose() {
    _email.close();
    _password.close();
  }
}

// Single global instance
//final bloc = Bloc();