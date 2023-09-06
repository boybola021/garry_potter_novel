
import 'dart:convert';

import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/pagination.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){
  group("Pagination Model Test", (){
    test("pagination: book", ()async{
      final response = await Network.methodGet(api: Apis.apiBooks);
      final json = jsonDecode(response!);
      final meta = json["meta"] as Map;
      final pagination = Pagination.fromJson(meta["pagination"] as Map<String,dynamic>);
      expect(pagination, const TypeMatcher<Pagination>());
    });
    test("Pagination character test", ()async{
      final response = await Network.methodGet(api: Apis.apiCharacters);
      final json = jsonDecode(response!);
      final meta = json["meta"] as Map;
      final pagination = Pagination.fromJson(meta["pagination"] as Map<String,dynamic>);
      expect(pagination, const TypeMatcher<Pagination>());
    });
    test("Pagination movies test", ()async{
      final response = await Network.methodGet(api: Apis.apiMovies);
      final json = jsonDecode(response!);
      final meta = json["meta"] as Map;
      final pagination = Pagination.fromJson(meta["pagination"] as Map<String,dynamic>);
      expect(pagination, const TypeMatcher<Pagination>());
    });
    test("Pagination Positon test", ()async{
      final response = await Network.methodGet(api: Apis.apiPotions);
      final json = jsonDecode(response!);
      final meta = json["meta"] as Map;
      final pagination = Pagination.fromJson(meta["pagination"] as Map<String,dynamic>);
      expect(pagination, const TypeMatcher<Pagination>());
    });
    test("Pagination Spell test", ()async{
      final response = await Network.methodGet(api: Apis.apiSpells);
      final json = jsonDecode(response!);
      final meta = json["meta"] as Map;
      final pagination = Pagination.fromJson(meta["pagination"] as Map<String,dynamic>);
      expect(pagination, const TypeMatcher<Pagination>());
    });

  });
}