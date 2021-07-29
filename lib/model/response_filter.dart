// To parse this JSON data, do
//
//     final meal = mealFromJson(jsonString);

import 'dart:convert';

import 'meal.dart';

ResponseFilter responseFilterFromJson(String str) =>
    ResponseFilter.fromJson(json.decode(str));

String responseFilterToJson(ResponseFilter data) => json.encode(data.toJson());

class ResponseFilter {
  ResponseFilter({
    required this.meals,
  });

  List<Meal> meals;

  factory ResponseFilter.fromJson(Map<String, dynamic> json) => ResponseFilter(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}
