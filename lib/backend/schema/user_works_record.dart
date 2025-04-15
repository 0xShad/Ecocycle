import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserWorksRecord extends FirestoreRecord {
  UserWorksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "works" field.
  List<String>? _works;
  List<String> get works => _works ?? const [];
  bool hasWorks() => _works != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _works = getDataList(snapshotData['works']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_works')
          : FirebaseFirestore.instance.collectionGroup('user_works');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_works').doc(id);

  static Stream<UserWorksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserWorksRecord.fromSnapshot(s));

  static Future<UserWorksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserWorksRecord.fromSnapshot(s));

  static UserWorksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserWorksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserWorksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserWorksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserWorksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserWorksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserWorksRecordData({
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserWorksRecordDocumentEquality implements Equality<UserWorksRecord> {
  const UserWorksRecordDocumentEquality();

  @override
  bool equals(UserWorksRecord? e1, UserWorksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user && listEquality.equals(e1?.works, e2?.works);
  }

  @override
  int hash(UserWorksRecord? e) =>
      const ListEquality().hash([e?.user, e?.works]);

  @override
  bool isValidKey(Object? o) => o is UserWorksRecord;
}
