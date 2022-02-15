class Correction {
  String? lat;
  String? long;
  String? type;
  late String time;
  late String user;

  Correction({this.lat, this.long, this.type});

  factory Correction.fromMap(map) {
    return Correction(
      lat: map['lat'], 
      long: map['long'], 
      type : map['type'], 
    );
  }

  Map<String, dynamic> toMap() => {
        'lat': lat,
        'long': long,
        'type': type,
        'time': time,
        'user': user,
      };
}
