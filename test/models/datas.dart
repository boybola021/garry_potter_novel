
import 'dart:convert';

import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/book.dart';
import 'package:garry_potter_novel/model/characters.dart';
import 'package:garry_potter_novel/model/data.dart';
import 'package:garry_potter_novel/model/datas.dart';
import 'package:garry_potter_novel/model/movies.dart';
import 'package:garry_potter_novel/model/positions.dart';
import 'package:garry_potter_novel/model/spelles.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){
  group("Datas Model test", (){
    test("All books", ()async{
      final respons = await Network.methodGet(api: Apis.apiBooks);
      final json = jsonDecode(respons!);
      final data = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Book> books = Datas<Book>.fromJson(data);
      expect(books, const TypeMatcher<Datas<Book>>());
    });
    test(" Characters", ()async{
      final respons = await Network.methodGet(api: Apis.apiCharacters);
      final json = jsonDecode(respons!);
      final data = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Character> character = Datas<Character>.fromJson(data);
      expect(character, const TypeMatcher<Datas<Character>>());
    });
    test("Potion", ()async{
      final respose = await Network.methodGet(api: Apis.apiPotions);
      final json = jsonDecode(respose!);
      final data = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Potion> potion = Datas<Potion>.fromJson(data);
      expect(potion, const TypeMatcher<Datas<Potion>>());
    });
    test("Movie", ()async{
      final respose = await Network.methodGet(api: Apis.apiMovies);
      final json = jsonDecode(respose!);
      final data = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Movie> movie = Datas<Movie>.fromJson(data);
      expect(movie, const TypeMatcher<Datas<Movie>>());
    });
    test("Spell", ()async{
      final respose = await Network.methodGet(api: Apis.apiSpells);
      final json = jsonDecode(respose!);
      final data = (json["data"] as List).map((e) => e as Map).toList();
      final Datas<Spell> spell = Datas<Spell>.fromJson(data);
      expect(spell, const TypeMatcher<Datas<Spell>>());
    });
  });
}