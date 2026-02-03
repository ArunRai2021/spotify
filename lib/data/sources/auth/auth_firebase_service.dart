import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserRequest createUserRequest);

  Future<void> signIn();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequest.email,
        password: createUserRequest.password,
      );
      return Right("SignUp was SuccessFull");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "week -Password") {
        message = "The Password Provided is too week";
      } else if (e.code == "email already in use") {
        message = "An account Already exists with that email";
      }
      return left(message);
    }
  }
}
