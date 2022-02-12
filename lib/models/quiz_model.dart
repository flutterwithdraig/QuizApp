import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

import 'models.dart';

part 'quiz_model.g.dart';

@HiveType(typeId: 1)
class Quiz {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<Question> questions;
  Quiz({
    required this.name,
    required this.id,
    required this.description,
    required this.questions,
  });

  factory Quiz.empty() => Quiz(
        name: '',
        id: '',
        description: '',
        questions: [],
      );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      description: map['description'] ?? '',
      questions: List<Question>.from(
          map['questions']?.map((x) => Question.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));
}

// List<Quiz> quizData = [
//   Quiz(
//     name: 'General Knowledge one',
//     id: 'gen1',
//     description: 'This is the quiz description one',
//     questions: [
//       Question(
//         text: 'What does CPU stand for? one',
//         choices: [
//           Answer(
//               text: 'Central Processing Unit',
//               correct: true,
//               feedback: 'Yes it is all about the processing'),
//           Answer(
//               text: 'Central Printing Unit',
//               correct: false,
//               feedback: 'It has nothing to do with printing'),
//           Answer(
//               text: 'Computational Pricing Unit',
//               correct: false,
//               feedback: 'It has nothing to do with pricing'),
//         ],
//       ),
//       Question(
//         text: 'Originally Amazon only sold which product?',
//         choices: [
//           Answer(text: 'Music', correct: false),
//           Answer(text: 'Books', correct: true),
//           Answer(text: 'Clothes', correct: false),
//           Answer(text: 'Furniture', correct: false),
//         ],
//       ),
//       Question(
//         text:
//             'What is the name of the British computer scientist who invented the World Wide Web in 1989?',
//         choices: [
//           Answer(text: 'Bill Gates', correct: false),
//           Answer(text: 'Tim Berners-Lee', correct: true),
//           Answer(text: 'Fred Flintstone', correct: false),
//         ],
//       ),
//       Question(
//         text: 'Which year was electronics company Nintendo Founded?',
//         choices: [
//           Answer(text: '1975', correct: false),
//           Answer(text: '1981', correct: false),
//           Answer(text: '1889', correct: true),
//         ],
//       ),
//     ],
//   ),
//   Quiz(
//     name: 'General Knowledge two',
//     id: 'gen2',
//     description: 'This is the quiz description two',
//     questions: [
//       Question(
//         text: 'What does CPU stand for? two',
//         choices: [
//           Answer(text: 'Central Processing Unit', correct: true),
//           Answer(text: 'Central Printing Unit', correct: false),
//           Answer(text: 'Computational Pricing Unit', correct: false),
//         ],
//       ),
//       Question(
//         text: 'Originally Amazon only sold which product?',
//         choices: [
//           Answer(text: 'Music', correct: false),
//           Answer(text: 'Books', correct: true),
//           Answer(text: 'Clothes', correct: false),
//           Answer(text: 'Furniture', correct: false),
//         ],
//       ),
//       Question(
//         text:
//             'What is the name of the British computer scientist who invented the World Wide Web in 1989?',
//         choices: [
//           Answer(text: 'Bill Gates', correct: false),
//           Answer(text: 'Tim Berners-Lee', correct: true),
//           Answer(text: 'Fred Flintstone', correct: false),
//         ],
//       ),
//       Question(
//         text: 'Which year was electronics company Nintendo Founded?',
//         choices: [
//           Answer(text: '1975', correct: false),
//           Answer(text: '1981', correct: false),
//           Answer(text: '1889', correct: true),
//         ],
//       ),
//     ],
//   ),
//   Quiz(
//     name: 'General Knowledge three',
//     id: 'gen3',
//     description: 'This is the quiz description three',
//     questions: [
//       Question(
//         text: 'What does CPU stand for? three',
//         choices: [
//           Answer(text: 'Central Processing Unit', correct: true),
//           Answer(text: 'Central Printing Unit', correct: false),
//           Answer(text: 'Computational Pricing Unit', correct: false),
//         ],
//       ),
//       Question(
//         text: 'Originally Amazon only sold which product?',
//         choices: [
//           Answer(text: 'Music', correct: false),
//           Answer(text: 'Books', correct: true),
//           Answer(text: 'Clothes', correct: false),
//           Answer(text: 'Furniture', correct: false),
//         ],
//       ),
//       Question(
//         text:
//             'What is the name of the British computer scientist who invented the World Wide Web in 1989?',
//         choices: [
//           Answer(text: 'Bill Gates', correct: false),
//           Answer(text: 'Tim Berners-Lee', correct: true),
//           Answer(text: 'Fred Flintstone', correct: false),
//         ],
//       ),
//       Question(
//         text: 'Which year was electronics company Nintendo Founded?',
//         choices: [
//           Answer(text: '1975', correct: false),
//           Answer(text: '1981', correct: false),
//           Answer(text: '1889', correct: true),
//         ],
//       ),
//     ],
//   )
// ];
