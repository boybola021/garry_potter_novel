import 'package:garry_potter_novel/model/book.dart';
import 'package:garry_potter_novel/model/characters.dart';
import 'package:garry_potter_novel/model/positions.dart';
import 'package:garry_potter_novel/model/reletship.dart';
import 'package:garry_potter_novel/model/spelles.dart';

import 'movies.dart';
//
// class Data<T> {
//   String id;
//   String type;
//   T attributes;
//   Relationships? relationships;
//   Data({required this.id, required this.type, required this.attributes,required this.relationships});
//
//   factory Data.fromJson(Map<String, Object?> json) {
//     String id = json["id"] as String;
//     String type = json["type"] as String;
//     Relationships? relationships = Relationships.fromJson(json["relationships"] as Map<String,Object?>);
//     T attributes;
//
//     switch (T) {
//       case Book:
//         attributes =
//             Book.fromJson(json["attributes"] as Map<String, Object?>) as T;
//         break;
//       case Character:
//         attributes =
//             Character.fromJson(json["attributes"] as Map<String, Object?>) as T;
//         break;
//       case Potion:
//         attributes =
//             Potion.fromJson(json["attributes"] as Map<String, Object?>) as T;
//         break;
//       case Movie:
//         attributes =
//             Movie.fromJson(json["attributes"] as Map<String, Object?>) as T;
//         break;
//       default:
//         attributes =
//             Spell.fromJson(json["attributes"] as Map<String, Object?>) as T;
//     }
//     return Data(id: id, type: type, attributes: attributes,relationships: relationships);
//   }
// }

class Data<T> {
  String id;
  String type;
  T attributes;

  Data({
    required this.id,
    required this.type,
    required this.attributes,
  });

  factory Data.fromJson(Map<String, Object?> json) {
    String id = json['id'] as String;
    String type = json['type'] as String;
    T attributes;

    switch(T) {
      case Book: attributes = Book.fromJson(json['attributes'] as Map<String, dynamic>) as T; break;
      case Character: attributes = Character.fromJson(json['attributes'] as Map<String, dynamic>) as T; break;
      case Movie: attributes = Movie.fromJson(json['attributes'] as Map<String, dynamic>) as T; break;
      case Potion: attributes = Potion.fromJson(json['attributes'] as Map<String, dynamic>) as T; break;
      default: attributes = Spell.fromJson(json['attributes'] as Map<String, dynamic>) as T;
    }

    return Data(id: id, type: type, attributes: attributes);
  }
}