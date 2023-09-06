

import 'dart:convert';

import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/links.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){
  group("Links", (){
    final list = [
      Apis.apiCharacters,
      Apis.apiBooks,
      Apis.apiSpells,
      Apis.apiMovies,
      Apis.apiPotions,
    ];
    test("Links test", ()async{
      List<Links> links = [];
      for(String api in list){
        final response = await Network.methodGet(api: api);
        final json = jsonDecode(response!);
        final link = Links.fromJson(json["links"] as Map<String,dynamic>);
        links.add(link);
      }
      expect(links, hasLength(5));
    });
  });
}