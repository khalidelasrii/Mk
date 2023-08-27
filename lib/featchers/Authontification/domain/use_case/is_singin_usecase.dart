import '../repository/user_repository.dart';

class IsSingInUsecase {
  UserRepository userRepository;
  IsSingInUsecase(this.userRepository);
  Future<bool> call() async {
    return userRepository.isSignIn();
  }
}
