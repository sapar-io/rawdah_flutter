import 'package:firespeed/firespeed.dart';

class FirestoreRef {
  // Users
  static final users = FRRef.collection(_Collection.users.name);
  static user(String uid) => users.doc(uid);
  // Parcels
  static final parcels = FRRef.collection(_Collection.parcels.name);
  static parcel(String id) => parcels.doc(id);
  // Trips
  static final trips = FRRef.collection(_Collection.trips.name);
  static trip(String id) => trips.doc(id);
  // Notifications
  static final notifications = FRRef.collection(_Collection.notifications.name);
  static notification(String id) => notifications.doc(id);
  // Notifications
  static final chats = FRRef.collection(_Collection.chats.name);
  static chat(String id) => chats.doc(id);
  // Complaint
  static final complaints = FRRef.collection(_Collection.complaints.name);
  static complaint(String id) => complaints.doc(id);
  // Complaint
  static final stories = FRRef.collection(_Collection.stories.name);
  static story(String id) => stories.doc(id);
}

enum _Collection {
  users,
  parcels,
  trips,
  notifications,
  chats,
  complaints,
  stories,
}
