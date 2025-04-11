import 'package:lessons_tasks_assignment/data/services/rest_client.dart';
import 'package:lessons_tasks_assignment/domain/task.dart';

class ChallengesRepository {
  ChallengesRepository({
    required this.restClient,
  });

  final RestClient restClient;

  Future<List<Challenge>> getChallenges() async {
    return restClient.getChallenges();
  }
}
