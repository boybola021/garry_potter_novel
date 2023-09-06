import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/characters.dart';
import 'package:garry_potter_novel/model/positions.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';


void main(){
  group("Potion Model test", (){
    test("Potion all test",()async{
     final List<Potion> position;
      final String? response = await Network.methodGet(api: Apis.apiPotions,);
      final Map json = jsonDecode(response!);
      final List data = json["data"] as List;
      position = data.map<Potion>((e){
        final Map<String,Object?> attributes = e["attributes"] as Map<String,Object?>;
        return Potion.fromJson(attributes);
      }).toList();
      expect(position, const TypeMatcher<List<Potion>>());
    });
    test("Potion one test",()async{

      final String? response = await Network.methodGet(api: Apis.apiPotions,id: "84d0e169-1b55-45b3-8328-29942238e535");
      final Map json = jsonDecode(response!);
      final Map data = json["data"] as Map;
       final attributes = data["attributes"] as Map<String,Object?>;
       final  Potion potion = Potion.fromJson(attributes);
       debugPrint(attributes.toString());
       expect(potion, const TypeMatcher<Potion>());
    });
  });
}