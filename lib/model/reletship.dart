/*
final relateship = [
  "relationships" : {
    "chapters": {
      "data": [
        {
          "id": "fc856b8e-bbf2-45c4-af24-00c7ba7b5978",
          "type": "chapter"
        },
        {
          "id": "f4885193-3f27-416a-b12f-a064354bfd89",
          "type": "chapter"
        },
        {
          "id": "d5460684-3ab9-4944-9e55-6a04ad5cc7ab",
          "type": "chapter"
        },
        {
          "id": "f00b2d46-361e-4359-a9dc-fe9049dcbf8c",
          "type": "chapter"
        },
        {
          "id": "f7fab6e8-c35a-44ad-9ad0-517174472715",
          "type": "chapter"
        },
        {
          "id": "e62d779a-917e-4db0-9ecf-18f4449cefa2",
          "type": "chapter"
        },
        {
          "id": "bf71036d-0aa4-487b-b42c-1c1cf281a922",
          "type": "chapter"
        },
        {
          "id": "fb6065f6-89c3-443b-88fa-db4950b8b150",
          "type": "chapter"
        },
        {
          "id": "1ebb6a07-a125-4892-8d46-93e5466d7245",
          "type": "chapter"
        },
        {
          "id": "4dd13381-75f8-4717-9395-a3a57be5e601",
          "type": "chapter"
        },
        {
          "id": "460d7833-1338-430a-b05f-2b8fddaff70d",
          "type": "chapter"
        },
        {
          "id": "c9ff8829-01d5-40bc-95f7-e804c42745fd",
          "type": "chapter"
        },
        {
          "id": "e5b4609e-acf7-4757-b7a0-b4c4c55e6fc7",
          "type": "chapter"
        },
        {
          "id": "0eaf3bbc-4c0d-4ab9-b95e-8e3a58a06649",
          "type": "chapter"
        },
        {
          "id": "ff02343f-53d3-4d67-99f5-57931be5bc94",
          "type": "chapter"
        },
        {
          "id": "c152d323-80d8-475b-b44a-4896ede3eafb",
          "type": "chapter"
        },
        {
          "id": "de33bbf0-d3e3-4c85-878e-bf06d9c2a14d",
          "type": "chapter"
        }
      ]
    }
  }
];
*/

class Relationships {
  Chapter chapter;

  Relationships({required this.chapter});

  factory Relationships.fromJson(Map<String, Object?> json) {
    return Relationships(
        chapter: Chapter.fromJson(json["chapters"] as Map<String, Object?>));
  }
}

class Chapter {
  final List<ChapterData> data;

  Chapter({required this.data});

  factory Chapter.fromJson(Map<String, Object?> json) {
    return Chapter(
        data: (json["data"] as List).map((e) => ChapterData.fromJson(e as Map<String,Object?>)).toList());
  }
}

class ChapterData {
  String id;
  String type;
  ChapterData({
    required this.type,
    required this.id,
  });

  factory ChapterData.fromJson(Map<String, Object?> json) {
    return ChapterData(
      type: json["type"] as String,
      id: json["id"] as String,
    );
  }
}
