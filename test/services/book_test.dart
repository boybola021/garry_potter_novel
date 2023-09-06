
import 'package:flutter/foundation.dart';
import 'package:garry_potter_novel/care/apis.dart';
import 'package:garry_potter_novel/service/network_service.dart';
import 'package:test/test.dart';
void main(){
  group("Network service test", (){
    test("Test api", ()async{
      final respons = await Network.methodGet(api: Apis.apiBooks);
      debugPrint(respons);
      expect(respons, isNotNull);
    });
    test("Test api", ()async{
      final respons = await Network.methodGet(api: Apis.apiBooks,id: "cfb11f6c-dc82-474e-9f88-dcddbfee7ae7");
      debugPrint(respons);
      expect(respons, isNotNull);
    });
    test("Test api characters", ()async{
      final respons = await Network.methodGet(api: Apis.apiCharacters);
      debugPrint(respons);
      expect(respons, isNotNull);
    });
    test("Test api", ()async{
      final respons = await Network.methodGet(api: Apis.apiCharacters,id: "a3701158-39ed-4687-8b9a-a799cfca5811");
      debugPrint(respons);
      expect(respons, isNotNull);
    });
  });
}

final jsonAll = {
  "data" : [],
  "meta" : {},
  "links" : {},
};