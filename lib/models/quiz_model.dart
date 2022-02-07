import 'models.dart';

class Quiz {
  final String name;
  final String id;
  final String description;
  final List<Question> questions;
  Quiz({
    required this.name,
    required this.id,
    required this.description,
    required this.questions,
  });
}

List<Quiz> quizData = [
  Quiz(
    name: 'General Knowledge one',
    id: 'gen1',
    description: 'This is the quiz description',
    questions: [
      Question(
        text: 'What does CPU stand for?',
        choices: [
          Answer(text: 'Central Processing Unit', correct: true),
          Answer(text: 'Central Printing Unit', correct: false),
          Answer(text: 'Computational Pricing Unit', correct: false),
        ],
      ),
      Question(
        text: 'Originally Amazon only sold which product?',
        choices: [
          Answer(text: 'Music', correct: false),
          Answer(text: 'Books', correct: true),
          Answer(text: 'Clothes', correct: false),
          Answer(text: 'Furniture', correct: false),
        ],
      ),
      Question(
        text:
            'What is the name of the British computer scientist who invented the World Wide Web in 1989?',
        choices: [
          Answer(text: 'Bill Gates', correct: false),
          Answer(text: 'Tim Berners-Lee', correct: true),
          Answer(text: 'Fred Flintstone', correct: false),
        ],
      ),
      Question(
        text: 'Which year was electronics company Nintendo Founded?',
        choices: [
          Answer(text: '1975', correct: false),
          Answer(text: '1981', correct: false),
          Answer(text: '1889', correct: true),
        ],
      ),
    ],
  ),
  Quiz(
    name: 'General Knowledge two',
    id: 'gen1',
    description: 'This is the quiz description',
    questions: [
      Question(
        text: 'What does CPU stand for?',
        choices: [
          Answer(text: 'Central Processing Unit', correct: true),
          Answer(text: 'Central Printing Unit', correct: false),
          Answer(text: 'Computational Pricing Unit', correct: false),
        ],
      ),
      Question(
        text: 'Originally Amazon only sold which product?',
        choices: [
          Answer(text: 'Music', correct: false),
          Answer(text: 'Books', correct: true),
          Answer(text: 'Clothes', correct: false),
          Answer(text: 'Furniture', correct: false),
        ],
      ),
      Question(
        text:
            'What is the name of the British computer scientist who invented the World Wide Web in 1989?',
        choices: [
          Answer(text: 'Bill Gates', correct: false),
          Answer(text: 'Tim Berners-Lee', correct: true),
          Answer(text: 'Fred Flintstone', correct: false),
        ],
      ),
      Question(
        text: 'Which year was electronics company Nintendo Founded?',
        choices: [
          Answer(text: '1975', correct: false),
          Answer(text: '1981', correct: false),
          Answer(text: '1889', correct: true),
        ],
      ),
    ],
  ),
  Quiz(
    name: 'General Knowledge three',
    id: 'gen1',
    description: 'This is the quiz description',
    questions: [
      Question(
        text: 'What does CPU stand for?',
        choices: [
          Answer(text: 'Central Processing Unit', correct: true),
          Answer(text: 'Central Printing Unit', correct: false),
          Answer(text: 'Computational Pricing Unit', correct: false),
        ],
      ),
      Question(
        text: 'Originally Amazon only sold which product?',
        choices: [
          Answer(text: 'Music', correct: false),
          Answer(text: 'Books', correct: true),
          Answer(text: 'Clothes', correct: false),
          Answer(text: 'Furniture', correct: false),
        ],
      ),
      Question(
        text:
            'What is the name of the British computer scientist who invented the World Wide Web in 1989?',
        choices: [
          Answer(text: 'Bill Gates', correct: false),
          Answer(text: 'Tim Berners-Lee', correct: true),
          Answer(text: 'Fred Flintstone', correct: false),
        ],
      ),
      Question(
        text: 'Which year was electronics company Nintendo Founded?',
        choices: [
          Answer(text: '1975', correct: false),
          Answer(text: '1981', correct: false),
          Answer(text: '1889', correct: true),
        ],
      ),
    ],
  )
];
