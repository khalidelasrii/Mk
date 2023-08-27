import '../entitie/user.dart';
import '../repository/user_repository.dart';

class GetUserIdUSecase {
  UserRepository userRepository;

  GetUserIdUSecase(this.userRepository);

  Future<Usr> call() async {
    return await userRepository.getUserId();
  }
}
