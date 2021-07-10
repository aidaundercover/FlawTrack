class FlawtrackUser {
  String email;
  String firstname;
  String lastname;
  String homeCountry;
  int pins;
  int coins;
  String photo;
  bool volunteer;

  FlawtrackUser( this.homeCountry, 
        this.volunteer, 
        this.coins, 
        this.email, 
        this.firstname, 
        this.lastname, 
        this.photo,
        this.pins
        );

  Map<String, dynamic> toJson() => {
        'homeCountry': homeCountry,
        'volunteer': volunteer,
        'firstname' : firstname,
        'lastname' : lastname,
        'coins' : coins,
        'pins' : pins,
        'email' : email,
        'photo' : photo,
      };
}
