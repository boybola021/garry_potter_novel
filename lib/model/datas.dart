

import 'package:garry_potter_novel/model/data.dart';

class Datas<T>{
  List<Data<T>> datas;

  Datas({required this.datas});

  factory Datas.fromJson(List<Map>json){
    final datas = json.map((e) => Data<T>.fromJson(e as Map<String,Object?>)).toList();
    return Datas(datas: datas);
  }
}