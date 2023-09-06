

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/characters.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){

  group("Character Model test", (){
    test("All characters", ()async{
      List<Character> character;
      final response = await Network.methodGet(api: Apis.apiCharacters);
      final json = jsonDecode(response!);
      final data = json["data"] as List;
      character = data.map((e){
        final item = e as Map;
        final attributes = item["attributes"] as Map;
        return Character.fromJson(attributes as Map<String,dynamic>);
      }).toList();
      expect(character, hasLength(data.length));
    });

    test("one characters", ()async{
      final response = await Network.methodGet(api: Apis.apiCharacters,id: "a3701158-39ed-4687-8b9a-a799cfca5811");
      final json = jsonDecode(response!);
      final data = json["data"] as Map;
      final attributes = data["attributes"] as Map;
      final characters = Character.fromJson(attributes as Map<String,dynamic>);
      debugPrint(characters.name);
      expect(characters, const TypeMatcher<Character>());
    });
  });
}