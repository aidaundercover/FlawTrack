import 'package:flawtrack/models/Event.dart';

class FlawtrackUser {
  String? uid;
  String? email;
  String? displayName;
  late String city;
  late int pins;
  late int coins;
  late String photo;
  late String role;
  late Event events;

  FlawtrackUser(this.uid, this.email, this.displayName);

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'city': city,
        'volunteer': role,
        'name': displayName,
        'coins': coins,
        'pins': pins,
        'email': email,
        'photo': photo,
        'events' : events
      };
}
