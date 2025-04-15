import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChallengeEntriesRecord extends FirestoreRecord {
  ChallengeEntriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_entry" field.
  String? _userEntry;
  String get userEntry => _userEntry ?? '';
  bool hasUserEntry() => _userEntry != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userEntry = snapshotData['user_entry'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _likes = getDataList(snapshotData['likes']);
    _status = snapshotData['status'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('challenge_entries')
          : FirebaseFirestore.instance.collectionGroup('challenge_entries');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('challenge_entries').doc(id);

  static Stream<ChallengeEntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChallengeEntriesRecord.fromSnapshot(s));

  static Future<ChallengeEntriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChallengeEntriesRecord.fromSnapshot(s));

  static ChallengeEntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChallengeEntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChallengeEntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChallengeEntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChallengeEntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChallengeEntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChallengeEntriesRecordData({
  String? userEntry,
  DateTime? date,
  DocumentReference? user,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_entry': userEntry,
      'date': date,
      'user': user,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChallengeEntriesRecordDocumentEquality
    implements Equality<ChallengeEntriesRecord> {
  const ChallengeEntriesRecordDocumentEquality();

  @override
  bool equals(ChallengeEntriesRecord? e1, ChallengeEntriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userEntry == e2?.userEntry &&
        e1?.date == e2?.date &&
        e1?.user == e2?.user &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.status == e2?.status;
  }

  @override
  int hash(ChallengeEntriesRecord? e) => const ListEquality()
      .hash([e?.userEntry, e?.date, e?.user, e?.likes, e?.status]);

  @override
  bool isValidKey(Object? o) => o is ChallengeEntriesRecord;
}
