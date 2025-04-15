import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeaturedItemCommentsRecord extends FirestoreRecord {
  FeaturedItemCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "video_ref" field.
  DocumentReference? _videoRef;
  DocumentReference? get videoRef => _videoRef;
  bool hasVideoRef() => _videoRef != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _videoRef = snapshotData['video_ref'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('featuredItem_comments');

  static Stream<FeaturedItemCommentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => FeaturedItemCommentsRecord.fromSnapshot(s));

  static Future<FeaturedItemCommentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FeaturedItemCommentsRecord.fromSnapshot(s));

  static FeaturedItemCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeaturedItemCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeaturedItemCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeaturedItemCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeaturedItemCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeaturedItemCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeaturedItemCommentsRecordData({
  String? comment,
  DateTime? time,
  DocumentReference? videoRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'time': time,
      'video_ref': videoRef,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeaturedItemCommentsRecordDocumentEquality
    implements Equality<FeaturedItemCommentsRecord> {
  const FeaturedItemCommentsRecordDocumentEquality();

  @override
  bool equals(FeaturedItemCommentsRecord? e1, FeaturedItemCommentsRecord? e2) {
    return e1?.comment == e2?.comment &&
        e1?.time == e2?.time &&
        e1?.videoRef == e2?.videoRef &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(FeaturedItemCommentsRecord? e) =>
      const ListEquality().hash([e?.comment, e?.time, e?.videoRef, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is FeaturedItemCommentsRecord;
}
