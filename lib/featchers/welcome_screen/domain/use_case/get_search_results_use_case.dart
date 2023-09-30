import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/welcome_repository.dart';

class GetSearchResultsUseCase {
  WelcomeRepository welcomeRepository;
  GetSearchResultsUseCase(this.welcomeRepository);

  Stream<QuerySnapshot> call(String query) {
    return welcomeRepository.getSearchResults(query);
  }
}
