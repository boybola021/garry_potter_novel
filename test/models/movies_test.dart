
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/model/movies.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';


void main(){
  group("Movie model test", (){
    test("One movie test",() async{
      final respons = await Network.methodGet(api: Apis.apiMovies,id: "b5c93f7c-49bb-43a6-84f3-796daa75f354");
      final json = jsonDecode(respons!);
      final data = json["data"] as Map;
      final attributes = data["attributes"] as Map<String,dynamic>;
      final Movie movie = Movie.fromJson(attributes);
      debugPrint(movie.title);
      expect(movie, const TypeMatcher<Movie>());
    });
  });
}