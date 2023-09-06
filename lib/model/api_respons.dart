

import 'package:flutter/foundation.dart';
import 'package:garry_potter_novel/model/characters.dart';
import 'package:garry_potter_novel/model/movies.dart';
import 'package:garry_potter_novel/model/positions.dart';
import 'package:garry_potter_novel/model/spelles.dart';

import 'book.dart';
import 'data.dart';
import 'datas.dart';
import 'links.dart';
import 'meta.dart';


class BaseRespons{
  ApiResponse response;

  BaseRespons({required this.response});

  factory BaseRespons.fromJson(Map<String,Object?> json){
    if (json["data"] is List) {
      String type = (json["data"] as List).first["type"];
      switch (type) {
        case "book":
          return BaseRespons(
              response: ApiResponse<Datas<Book>, Book>.fomJson(json));
        case "character":
          return BaseRespons(
              response: ApiResponse<Datas<Character>, Character>.fomJson(json));
        case "movie":
          return BaseRespons(
              response: ApiResponse<Datas<Movie>, Movie>.fomJson(json));
        case "potion":
          return BaseRespons(
              response: ApiResponse<Datas<Potion>, Potion>.fomJson(json));
        default :
          return BaseRespons(
              response: ApiResponse<Datas<Spell>, Spell>.fomJson(json));
      }
    } else {
      String type = (json["data"] as Map)["type"];
      switch (type) {
        case "book":
          return BaseRespons(
              response: ApiResponse<Data<Book>, Book>.fomJson(json));
        case "character":
          return BaseRespons(
              response: ApiResponse<Data<Character>, Character>.fomJson(json));
        case "movie":
          return BaseRespons(
              response: ApiResponse<Data<Movie>, Movie>.fomJson(json));
        case "potion":
          return BaseRespons(
              response: ApiResponse<Data<Potion>, Potion>.fomJson(json));
        default :
          return BaseRespons(
              response: ApiResponse<Data<Spell>, Spell>.fomJson(json));
      }
    }
  }
}

class ApiResponse<T,R>{
  T data;
  Meta meta;
  Links links;
  ApiResponse({
    required this.data,
    required this.meta,
    required this.links
  });
  factory ApiResponse.fomJson(Map<String,Object?>json){
    final T data;
    if( json["data"] is Map){
      data = Data<R>.fromJson(json["data"] as Map<String,dynamic>) as T;
    }else{
      final listMap = (json["data"] as List).map((e) => e as Map).toList();
      data = Datas<R>.fromJson(listMap) as T;
    }
    final  meta = Meta.fromJson(json["meta"] as Map<String,Object?>);
    final  links = Links.fromJson(json["links"] as Map<String,Object?>);
    return ApiResponse<T,R>(data: data, meta: meta, links: links);
  }
}