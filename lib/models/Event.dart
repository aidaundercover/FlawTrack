import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String title;
  DateTime startDate;
  DateTime endDate;
  double budget;
  String address;
  String description;
  String organization;
  String imgUrl;
  String eventType;
  String documentId;

  final DocumentReference reference;

  Event.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
          snapshot.data() as Map<String, dynamic>,
          'title',
          ''.toDate(),
          '',
          '',
          'address',
          'description',
          'organization',
          'imgUrl',
          'eventType',
          'documentId',
          reference: snapshot.reference,
        );

  Event.fromMap(
      Map<String, dynamic> map,
      this.title,
      this.startDate,
      this.endDate,
      this.budget,
      this.address,
      this.description,
      this.organization,
      this.imgUrl,
      this.eventType,
      this.documentId,
      {required this.reference});

  @override
  String toString() => 'Event<$title:$description>';

  int getDaysUntilEvent() {
    int diff = startDate.difference(DateTime.now()).inDays;
    if (diff < 0) {
      diff = 0;
    }
    return diff;
  }
}
