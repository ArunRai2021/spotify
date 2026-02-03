import 'package:dartz/dartz.dart';
import 'package:spotify/core/configs/usecase/usecases.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest? params}) async {
    return sl<AuthRepository>().signUp(params!);
  }
}
