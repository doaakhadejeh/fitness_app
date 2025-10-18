import 'package:fitnessapp/data/model/exerciesmodel.dart';

class Daymodel {
  final int id;
  final int dayNumber;
  final List<Exercisemodel>? exercises;
  final String description;

  Daymodel({
    required this.id,
    required this.dayNumber,
    required this.description,
    this.exercises,
  });

  factory Daymodel.fromJson(Map<String, dynamic> json) {
    return Daymodel(
      id: json['id'],
      dayNumber: json['day_number'],
      exercises: json['exercises'] != null
          ? (json['exercises'] as List)
              .map((e) => Exercisemodel.fromJson(e))
              .toList()
          : [],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'day_number': dayNumber,
      'description': description,
      'exercises': exercises?.map((e) => e.toJson()).toList(),
    };
  }
}
