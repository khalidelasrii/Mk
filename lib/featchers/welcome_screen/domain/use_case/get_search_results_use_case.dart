import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/welcome_repository.dart';

class GetSearchResultsUseCase {
  WelcomeRepository welcomeRepository;
  GetSearchResultsUseCase(this.welcomeRepository);

  Future<Stream<QuerySnapshot<Object?>>> call(String query) async {
    return await welcomeRepository.getSearchResults(query);
  }
}
