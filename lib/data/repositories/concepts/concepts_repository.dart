import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/domain/concept.dart';

class ConceptsRepository {
  ConceptsRepository({
    required this.restClient,
  });

  final RestClient restClient;

  Future<List<Concept>> getConcepts() async {
    return restClient.getConcepts();
  }
}
