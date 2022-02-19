// class FlawtrackUser {
//   String? uid;
//   String? email;
//   String? name;
//   late String city;
//   late String organization;
//   late int pins;
//   late int coins;
//   late String photo;
//   bool? volunteer;

//   FlawtrackUser({this.uid, this.email, this.name, this.volunteer});

//   factory FlawtrackUser.fromMap(map) {
//     return FlawtrackUser(
//       uid: map['uid'], 
//       email: map['email'], 
//       name : map['name'], 
//       volunteer : map[false]
//     );
//   }

//   Map<String, dynamic> toMap() => {
//         'uid': uid,
//         'city': city,
//         'volunteer': volunteer,
//         'name': name,
//         'coins': coins,
//         'pins': pins,
//         'email': email,
//         'photo': photo,
//         'oragnization' : organization
//       };
// }
