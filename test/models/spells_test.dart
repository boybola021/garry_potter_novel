

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/spelles.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){
  group("Spell Model test",(){
    test("Spell all test",()async {
     final List<Spell> spell;
     final String? response = await Network.methodGet(api: Apis.apiSpells,);
     final json = jsonDecode(response!);
     final data = json["data"] as List;
     spell = data.map<Spell>((e){
       final  item = e as Map;
       final attributes = item["attributes"] as Map<String,Object?>;
      return Spell.fromJson(attributes);
     }).toList();
     expect(spell, const TypeMatcher<List<Spell>>());
    });
     test("Spell one test",()async {
     final String? response = await Network.methodGet(api: Apis.apiSpells,id: "94128c2f-4180-4daf-81b4-9b96494caa75");
     final json = jsonDecode(response!);
     final  data = json["data"] as Map;
     final attributes = data["attributes"] as Map;
     final spell = Spell.fromJson(attributes as Map<String,Object?>);
     debugPrint(spell.name);
     expect(spell, const TypeMatcher<Spell>());
    });
  });
}