

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/book.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';

void main(){

  group("Book Model test", (){
    test("Book one book", ()async{
      final respons = await Network.methodGet(api: Apis.apiBooks,id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
      final json = jsonDecode(respons!);
      /// json ichidagi data map ga murojat
      final data = json["data"] as Map;
      /// datani ichidagi attributes map ga murojat
      final attributes = data["attributes"] as Map;
      /// map ni ichiad bir nechta meplar bor ularni
      /// abject qilib olamiz
      final book = Book.fromJson(attributes as Map<String,dynamic>);
      debugPrint("title: ${book.title}");
      expect(book, const TypeMatcher<Book>());
    });
    test("All books", ()async{
      List<Book> books;
      final response = await Network.methodGet(api: Apis.apiBooks,);
      final json = jsonDecode(response!);
      /// data type asli list
      final data = json["data"] as List;
      books = data.map((e){
        final item = e as Map;
        final attributes = item["attributes"] as Map;
        return Book.fromJson(attributes as Map<String,dynamic>);
      }).toList();
      expect(books, hasLength(7));
    });
  });
}

final jsonAll = {
  "data": [
    {
      "id": "94128c2f-4180-4daf-81b4-9b96494caa75",
      "type": "spell",
      "attributes": {
        ///
      },
      /// optional
      "relationships": {
        "chapters": {
          "data": [
            {
              "id": "fc856b8e-bbf2-45c4-af24-00c7ba7b5978",
              "type": "chapter"
            },
          ],
        },
      },
    },
  ],
  "meta": {
    /// optional
    "pagination": {
      "current": 2,
      "first": 1, // optional
      "prev": 1, // optional
      "next": 3, // optional
      "last": 4, // optional
      "records": 309
    },
    "copyright": "© 2023 Potter DB API",
    "generated_at": "2023-07-13T11:52:10.247Z"
  },
  "links": {
    "self": "https://api.potterdb.com/v1/spells?page[number]=2",
    "current": "https://api.potterdb.com/v1/spells?page[number]=2", // optional
    "first": "https://api.potterdb.com/v1/spells?page[number]=1", // optional
    "prev": "https://api.potterdb.com/v1/spells?page[number]=1", // optional
    "next": "https://api.potterdb.com/v1/spells?page[number]=3", // optional
    "last": "https://api.potterdb.com/v1/spells?page[number]=4", // optional
  },
};


final jsonOne = {
  "data": {
    "id": "94128c2f-4180-4daf-81b4-9b96494caa75",
    "type": "spell",
    "attributes": {
      ///
    },
    /// optional
    "relationships": {
      "chapters": {
        "data": [
          {
            "id": "fc856b8e-bbf2-45c4-af24-00c7ba7b5978",
            "type": "chapter"
          },
        ],
      },
    },
  },
  "meta": {
    "copyright": "© 2023 Potter DB API",
    "generated_at": "2023-07-13T11:20:20.968Z"
  },
  "links": {
    "self": "https://api.potterdb.com/v1/spells/94128c2f-4180-4daf-81b4-9b96494caa75"
  },
};