

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/reletship.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){
  group("Chaper data Model", (){
    test("chater test", ()async{
      final respons = await Network.methodGet(api: Apis.apiBooks,id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
      final json = jsonDecode(respons!);
      final data = json["data"] as Map;
      final relationships = data["relationships"] as Map;
      final chapter = relationships["chapters"] as Map;
      final chapterData = chapter["data"] as List;
      final res = chapterData.map((e){
        final item = e as Map;
        final data = item as Map;
      }).toList();

      //final chapter = relationships["chapters"] as Map<String,dynamic>;
      //final data = chapter["data"] as Map;
      debugPrint(chapter.toString());
      //expect(book, const TypeMatcher<Book>());
    });
    });
}