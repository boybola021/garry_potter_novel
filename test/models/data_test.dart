

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/book.dart';
import 'package:garry_potter_novel/model/characters.dart';
import 'package:garry_potter_novel/model/data.dart';
import 'package:garry_potter_novel/model/movies.dart';
import 'package:garry_potter_novel/model/positions.dart';
import 'package:garry_potter_novel/model/spelles.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){
  group("Data model test", (){
    test("Data Book ", () async{
     final String? respons = await Network.methodGet(api: Apis.apiBooks,id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
     final json = jsonDecode(respons!);
     final dataJson = json["data"] as Map;
     final dataModel = Data<Book>.fromJson( dataJson as Map<String,dynamic>);
     debugPrint("title book : ${dataModel.attributes.title}");
     expect(dataModel, const TypeMatcher<Data<Book>>());
    });

    test("Data Character ", () async{
      final String? respons = await Network.methodGet(api: Apis.apiCharacters,id: "a3701158-39ed-4687-8b9a-a799cfca5811");
      final json = jsonDecode(respons!);
      final dataJson = json["data"] as Map;
      final dataModel = Data<Character>.fromJson( dataJson as Map<String,dynamic>);
      debugPrint("title book : ${dataModel.attributes.name}");
      expect(dataModel, const TypeMatcher<Data<Character>>());
    });

    test("Data Movie ", () async{
      final String? respons = await Network.methodGet(api: Apis.apiMovies,id: "b5c93f7c-49bb-43a6-84f3-796daa75f354");
      final json = jsonDecode(respons!);
      final dataJson = json["data"] as Map;
      final dataModel = Data<Movie>.fromJson( dataJson as Map<String,dynamic>);
      debugPrint("title book : ${dataModel.attributes.title}");
      expect(dataModel, const TypeMatcher<Data<Movie>>());
    });

    test("Data Potion ", () async{
      final String? respons = await Network.methodGet(api: Apis.apiPotions,id: "84d0e169-1b55-45b3-8328-29942238e535");
      final json = jsonDecode(respons!);
      final dataJson = json["data"] as Map;
      final dataModel = Data<Potion>.fromJson( dataJson as Map<String,dynamic>);
      debugPrint("title book : ${dataModel.attributes.name}");
      expect(dataModel, const TypeMatcher<Data<Potion>>());
    });

    test("Data Spell ", () async{
      final String? respons = await Network.methodGet(api: Apis.apiSpells,id: "94128c2f-4180-4daf-81b4-9b96494caa75");
      final json = jsonDecode(respons!);
      final dataJson = json["data"] as Map;
      final dataModel = Data<Spell>.fromJson( dataJson as Map<String,dynamic>);
      debugPrint("title book : ${dataModel.attributes.name}");
      expect(dataModel, const TypeMatcher<Data<Spell>>());
    });
  });
}