import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeklyChallengesRecord extends FirestoreRecord {
  WeeklyChallengesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "challange_name" field.
  String? _challangeName;
  String get challangeName => _challangeName ?? '';
  bool hasChallangeName() => _challangeName != null;

  // "challenge_description" field.
  String? _challengeDescription;
  String get challengeDescription => _challengeDescription ?? '';
  bool hasChallengeDescription() => _challengeDescription != null;

  // "challenge_photo" field.
  String? _challengePhoto;
  String get challengePhoto => _challengePhoto ?? '';
  bool hasChallengePhoto() => _challengePhoto != null;

  // "howto_participate" field.
  String? _howtoParticipate;
  String get howtoParticipate => _howtoParticipate ?? '';
  bool hasHowtoParticipate() => _howtoParticipate != null;

  // "week_number" field.
  int? _weekNumber;
  int get weekNumber => _weekNumber ?? 0;
  bool hasWeekNumber() => _weekNumber != null;

  void _initializeFields() {
    _challangeName = snapshotData['challange_name'] as String?;
    _challengeDescription = snapshotData['challenge_description'] as String?;
    _challengePhoto = snapshotData['challenge_photo'] as String?;
    _howtoParticipate = snapshotData['howto_participate'] as String?;
    _weekNumber = castToType<int>(snapshotData['week_number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('weekly_challenges');

  static Stream<WeeklyChallengesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeeklyChallengesRecord.fromSnapshot(s));

  static Future<WeeklyChallengesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WeeklyChallengesRecord.fromSnapshot(s));

  static WeeklyChallengesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WeeklyChallengesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeeklyChallengesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeeklyChallengesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeeklyChallengesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeeklyChallengesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeeklyChallengesRecordData({
  String? challangeName,
  String? challengeDescription,
  String? challengePhoto,
  String? howtoParticipate,
  int? weekNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'challange_name': challangeName,
      'challenge_description': challengeDescription,
      'challenge_photo': challengePhoto,
      'howto_participate': howtoParticipate,
      'week_number': weekNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeeklyChallengesRecordDocumentEquality
    implements Equality<WeeklyChallengesRecord> {
  const WeeklyChallengesRecordDocumentEquality();

  @override
  bool equals(WeeklyChallengesRecord? e1, WeeklyChallengesRecord? e2) {
    return e1?.challangeName == e2?.challangeName &&
        e1?.challengeDescription == e2?.challengeDescription &&
        e1?.challengePhoto == e2?.challengePhoto &&
        e1?.howtoParticipate == e2?.howtoParticipate &&
        e1?.weekNumber == e2?.weekNumber;
  }

  @override
  int hash(WeeklyChallengesRecord? e) => const ListEquality().hash([
        e?.challangeName,
        e?.challengeDescription,
        e?.challengePhoto,
        e?.howtoParticipate,
        e?.weekNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is WeeklyChallengesRecord;
}
