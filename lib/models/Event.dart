class Event {
  String title;
  DateTime startDate;
  DateTime endDate;
  double budget;
  String address;
  String description;
  String organization;
  String imgUrl;



  Event(
      this.title,
      this.startDate,
      this.endDate,
      this.budget,
      this.address,
      this.description,
      this.organization,
      this.imgUrl
      );

  Map<String, dynamic> toJson() => {
    'title': title,
    'startDate': startDate,
    'endDate': endDate,
    'budget': budget,
    'address': address,
    'description': description,
    'organization': organization,
    'imgUrl': imgUrl,
  };
}