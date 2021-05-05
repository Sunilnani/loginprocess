// To parse this JSON data, do
//
//     final videochannel = videochannelFromJson(jsonString);

import 'dart:convert';

Videochannel videochannelFromJson(String str) => Videochannel.fromJson(json.decode(str));

String videochannelToJson(Videochannel data) => json.encode(data.toJson());

class Videochannel {
  Videochannel({
    this.name,
    this.image,
    this.genre,
    this.url,
    this.nameOfCountry,
    this.channelType,
    this.created,
    this.updated,
  });

  String name;
  String image;
  String genre;
  String url;
  String nameOfCountry;
  bool channelType;
  DateTime created;
  DateTime updated;

  factory Videochannel.fromJson(Map<String, dynamic> json) => Videochannel(
    name: json["name"],
    image: json["image"],
    genre: json["genre"],
    url: json["url"],
    nameOfCountry: json["name_of_country"],
    channelType: json["channel_type"],
    created: DateTime.parse(json["created"]),
    updated: DateTime.parse(json["updated"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "genre": genre,
    "url": url,
    "name_of_country": nameOfCountry,
    "channel_type": channelType,
    "created": created.toIso8601String(),
    "updated": updated.toIso8601String(),
  };
}
