import 'dart:convert';

import 'package:flutter/foundation.dart';
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
  @HiveField(4, defaultValue: 'gen')
  final String category;
  @HiveField(5, defaultValue: 9999)
  final int sortOrder;
  @HiveField(6, defaultValue: false)
  final bool random;
  @HiveField(7, defaultValue: '')
  final String imageUrl;
  Quiz({
    required this.name,
    required this.id,
    required this.description,
    required this.questions,
    required this.category,
    required this.sortOrder,
    required this.random,
    required this.imageUrl,
  });

  int get time => (questions.length * .3).ceil();

  factory Quiz.empty() => Quiz(
        name: '',
        id: '',
        description: '',
        questions: [],
        category: 'gen',
        sortOrder: 9999,
        random: false,
        imageUrl: '',
      );

  Quiz copyWith({
    String? name,
    String? id,
    String? description,
    List<Question>? questions,
    String? category,
    int? sortOrder,
    bool? random,
    String? imageUrl,
  }) {
    return Quiz(
      name: name ?? this.name,
      id: id ?? this.id,
      description: description ?? this.description,
      questions: questions ?? this.questions,
      category: category ?? this.category,
      sortOrder: sortOrder ?? this.sortOrder,
      random: random ?? this.random,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'questions': questions.map((x) => x.toMap()).toList(),
      'category': category,
      'sortOrder': sortOrder,
      'random': random,
      'imageUrl': imageUrl,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      description: map['description'] ?? '',
      questions: List<Question>.from(
          map['questions']?.map((x) => Question.fromMap(x))),
      category: map['category'] ?? 'gen',
      sortOrder: map['sortOrder']?.toInt() ?? 9999,
      random: map['random'] ?? false,
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Quiz(name: $name, id: $id, description: $description, questions: $questions, category: $category, sortOrder: $sortOrder, random: $random, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Quiz &&
        other.name == name &&
        other.id == id &&
        other.description == description &&
        listEquals(other.questions, questions) &&
        other.category == category &&
        other.sortOrder == sortOrder &&
        other.random == random &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        description.hashCode ^
        questions.hashCode ^
        category.hashCode ^
        sortOrder.hashCode ^
        random.hashCode ^
        imageUrl.hashCode;
  }
}
