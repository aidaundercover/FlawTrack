class Problem {
  String? lat;
  String? long;
  String? type;
  late String time;
  late String user;
  late Map details;

  Problem({this.lat, this.long, this.type});

  factory Problem.fromMap(map) {
    return Problem(
      lat: map['lat'],
      long: map['long'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'long': long,
        'type': type,
        'time': time,
        'user': user,
        'details' : details
      };
}
