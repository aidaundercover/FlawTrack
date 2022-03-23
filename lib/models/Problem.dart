import 'package:flutter/semantics.dart';

class Problem {
  String id;
  late double lat;
  late double long;
  late int mapMarker;
  late String? desc;
  late List? image;
  late String? timestamp;
  late String? user;

  Problem({
    required this.id,
    required this.lat,
    this.desc,
    this.image,
    this.timestamp,
    this.user,
    required this.long,
    required this.mapMarker,
  });

  factory Problem.fromMap(map) {
    return Problem(
        id: map['id'] ?? "6788",
        lat: map['lat'] ?? 4.7,
        long: map['long'] ?? 1.56,
        mapMarker: map['type'] ?? 5,
        user: map['user'] ?? "qwerty",
        desc: map['desc'] ?? "sad",
        timestamp: map['timestamp'] ?? "00:00",
        image: map['image'] ??
            [
              "https://firebasestorage.googleapis.com/v0/b/flawtrack-dabae.appspot.com/o/problems%2Fw5bIz56qVI4jerljqIzR.jpeg?alt=media&token=5275801f-6ebf-4440-8e0c-3cf33f3cac3e"
            ]);
    // time: map['time'] != null ? DateTime.fromMicrosecondsSinceEpoch(map['time']) : DateTime.now());
  }

  Problem.fromJson(this.id, Map map) {
    lat = map['lat'];
    long = map['long'];
    id = map['id'];
    mapMarker = map['type'];
    user = map['user'];
    desc = map['desc'];
    image = map['image'];
    timestamp = map['timestamp'];
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'lat': lat,
        'long': long,
        'mapMarker': mapMarker,
        'desc': desc,
        'image': image,
        'user' : user,
        'timestamp' : timestamp
      };
}
