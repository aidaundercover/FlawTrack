import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/models/Event.dart';
import 'package:flawtrack/widgets/provider_widget.dart';

class FirebaseService {

  static Future<Event> getNextTrip(context) async {
    final uid = Provider.of(context).auth.getCurrentUID();
    var snapshot = await FirebaseFirestore.instance
        .collection('userData')
        .doc(uid)
        .collection('events')
        .orderBy('startDate')
        .limit(1)
        .get();
    return Event.fromSnapshot(snapshot.docs.first);
  }

  static void addToLedger(context, documentId, item) async {
    await Provider.of(context).db
        .collection('userData')
        .doc(Provider.of(context).auth.getCurrentUID())
        .collection('events')
        .doc(documentId)
        .update(item);
  }
}
