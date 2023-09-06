

import 'dart:convert';

import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/api_respons.dart';
import 'package:garry_potter_novel/model/book.dart';
import 'package:garry_potter_novel/model/characters.dart';
import 'package:garry_potter_novel/model/movies.dart';
import 'package:garry_potter_novel/model/positions.dart';
import 'package:garry_potter_novel/model/spelles.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){
  group("Api respons", (){
    final apis = [
      Apis.apiBooks,
      Apis.apiCharacters,
      Apis.apiPotions,
      Apis.apiSpells,
      Apis.apiMovies,
    ];
    final ids = [
      "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7",
      "a3701158-39ed-4687-8b9a-a799cfca5811",
      "84d0e169-1b55-45b3-8328-29942238e535",
      "b51f2a56-61fc-4d82-8d81-07b3cc842442",
      "b5c93f7c-49bb-43a6-84f3-796daa75f354"
    ];
    test("All api test", ()async{
      List<BaseRespons> list = [];
      int count = 0;
      for(String api in apis){
        final respons = await Network.methodGet(api: api,id: ids[count++]);
        final json = jsonDecode(respons!);
        final  baseRespons = BaseRespons.fromJson(json as Map<String,dynamic>);
        list.add(baseRespons);
      }
      expect(list, hasLength(5));
    });
  });
}
