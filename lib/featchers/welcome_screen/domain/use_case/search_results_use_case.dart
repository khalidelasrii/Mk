import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mk/featchers/welcome_screen/domain/repository/repository_welcome.dart';

class SearchResultsUseCase {
  RepositoryWelcome welcomeRepository;
  SearchResultsUseCase(this.welcomeRepository);

  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> call(String query) async {
    return await welcomeRepository.searchResults(query);
  }
}
