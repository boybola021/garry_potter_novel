

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/book.dart';
import 'package:garry_potter_novel/model/reletship.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){
  group("Relateship", (){
    test("Book data one ", ()async{
      final respons = await Network.methodGet(api: Apis.apiBooks,id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
      final json = jsonDecode(respons!);
      final data = json["data"] as Map;
      final getData = data as Map<String,dynamic>;
      final relationships  = data["relationships"] as Map;
      final getRelationships = relationships as Map<String, dynamic>;

      final res = Book.fromJson(relationships as Map<String,Object?>);
     debugPrint(res.toString());
    });
    test("Book data", ()async{
      final List<Relationships> books;
      final respons = await Network.methodGet(api: Apis.apiBooks,);
      final json = jsonDecode(respons!);
      final data = json["data"] as List;
      books = data.map((e){
        final item = e as Map;
        final relationships = item["relationships"] as Map;
        return Relationships.fromJson(relationships as Map<String,Object?>);
      }).toList();
      debugPrint(books.toString());
      //expect(books, const TypeMatcher<Relationships>());
    });
  });
}