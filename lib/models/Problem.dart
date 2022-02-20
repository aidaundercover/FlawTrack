class Problem {
  double? lat;
  double? long;
  int? mapMarker;
  String? user;
  Map? details;

  Problem({this.lat,this.user, this.long, this.mapMarker, this.details});

  factory Problem.fromMap(map) {
    return Problem(
      lat: map['lat'],
      long: map['long'],
      mapMarker: map['type'],
      user: map['user'],
      details: map['details'],
    );
  }

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'long': long,
        'type': mapMarker,
        'user': user,
        'details' : details
      };
}
