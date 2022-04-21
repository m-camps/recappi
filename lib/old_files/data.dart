import 'dart:convert';
import 'package:collection/collection.dart';

class Author {
  final String name;
  final String quote;
  final String portrait;

  Author({
    required this.name,
    required this.quote,
    required this.portrait,
  });

  Author copyWith({
    String? name,
    String? quote,
    String? portrait,
  }) {
    return Author(
      name: name ?? this.name,
      quote: quote ?? this.quote,
      portrait: portrait ?? this.portrait,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quote': quote,
      'portrait': portrait,
    };
  }

  factory Author.fromMap(Map<String, dynamic> map) {
    return Author(
      name: map['name'],
      quote: map['quote'],
      portrait: map['portrait'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Author.fromJson(String source) => Author.fromMap(json.decode(source));

  @override
  String toString() =>
      'Author(name: $name, quote: $quote, portrait: $portrait)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Author &&
        other.name == name &&
        other.quote == quote &&
        other.portrait == portrait;
  }

  @override
  int get hashCode => name.hashCode ^ quote.hashCode ^ portrait.hashCode;
}

class Recipe {
  String name;
  Future<dynamic> photo;
  Author author;
  int time;
  int kcal;
  int ingredients;
  List<String> instructions;
  List<String> ingredientlist;
  int likes;
  int comments;
  bool bookmark;
  int index;

  Recipe({
    required this.name,
    required this.photo,
    required this.author,
    required this.time,
    required this.kcal,
    required this.ingredients,
    required this.instructions,
    required this.ingredientlist,
    this.likes = 0,
    this.comments = 0,
    this.bookmark = false,
    this.index = 0,
  });

  Recipe copyWith({
    String? name,
    String? photo,
    Author? author,
    int? time,
    int? kcal,
    int? ingredients,
    List<String>? instructions,
    List<String>? ingredientlist,
    int? likes,
    int? comments,
    bool? bookmark,
    int? index,
  }) {
    return Recipe(
      name: name ?? this.name,
      photo: this.photo,
      author: author ?? this.author,
      time: time ?? this.time,
      kcal: kcal ?? this.kcal,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      ingredientlist: ingredientlist ?? this.ingredientlist,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      bookmark: bookmark ?? this.bookmark,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'author': author.toMap(),
      'time': time,
      'kcal': kcal,
      'ingredients': ingredients,
      'instructions': instructions,
      'ingredientlist': ingredientlist,
      'likes': likes,
      'comments': comments,
      'bookmark': bookmark,
      'index': index,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      name: map['name'],
      photo: map['photo'],
      author: Author.fromMap(map['author']),
      time: map['time'],
      kcal: map['kcal'],
      ingredients: map['ingredients'],
      instructions: List<String>.from(map['instructions']),
      ingredientlist: List<String>.from(map['ingredientlist']),
      likes: map['likes'],
      comments: map['comments'],
      bookmark: map['bookmark'],
      index: map['index'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Recipe(name: $name, photo: $photo, author: $author, time: $time, kcal: $kcal, ingredients: $ingredients, instructions: $instructions, ingredientlist: $ingredientlist, likes: $likes, comments: $comments, bookmark: $bookmark, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Recipe &&
        other.name == name &&
        other.photo == photo &&
        other.author == author &&
        other.time == time &&
        other.kcal == kcal &&
        other.ingredients == ingredients &&
        listEquals(other.instructions, instructions) &&
        listEquals(other.ingredientlist, ingredientlist) &&
        other.likes == likes &&
        other.comments == comments &&
        other.bookmark == bookmark &&
        other.index == index;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        photo.hashCode ^
        author.hashCode ^
        time.hashCode ^
        kcal.hashCode ^
        ingredients.hashCode ^
        instructions.hashCode ^
        ingredientlist.hashCode ^
        likes.hashCode ^
        comments.hashCode ^
        bookmark.hashCode ^
        index.hashCode;
  }
}
