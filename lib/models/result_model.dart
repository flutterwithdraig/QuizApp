import 'package:cloud_firestore/cloud_firestore.dart';

class Result {
  final String date;
  final String nickName;
  final int score;
  final int time;
  Result({
    required this.date,
    required this.nickName,
    required this.score,
    required this.time,
  });

  Map<String, dynamic> toFirestoreMap() => {
        'date': date,
        'nickName': nickName,
        'score': score,
        'time': time,
      };

  factory Result.fromSnapshot(DocumentSnapshot snap) => Result(
        date: snap['date'],
        nickName: snap['nickName'],
        score: snap['score'],
        time: snap['time'],
      );
}
