import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_quiz_app/models/result_model.dart';

class ResultRepository {
  final FirebaseFirestore _firestore;

  ResultRepository() : _firestore = FirebaseFirestore.instance;

  saveResult(String quizId, Result result) {
    _firestore
        .collection('quizzes')
        .doc(quizId)
        .collection('results')
        .add(result.toFirestoreMap());
  }

  Future<List<Result>> getHighScoresForQuiz(String quizId) async {
    return await _firestore
        .collection('quizzes')
        .doc(quizId)
        .collection('results')
        .orderBy('score', descending: true)
        .limit(10)
        .get()
        .then((snap) =>
            snap.docs.map((doc) => Result.fromSnapshot(doc)).toList());
  }
}
