import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CraftSubmissionRecord extends FirestoreRecord {
  CraftSubmissionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "submit_by" field.
  DocumentReference? _submitBy;
  DocumentReference? get submitBy => _submitBy;
  bool hasSubmitBy() => _submitBy != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "thumbnail_uploaded" field.
  String? _thumbnailUploaded;
  String get thumbnailUploaded => _thumbnailUploaded ?? '';
  bool hasThumbnailUploaded() => _thumbnailUploaded != null;

  // "liked_by" field.
  List<DocumentReference>? _likedBy;
  List<DocumentReference> get likedBy => _likedBy ?? const [];
  bool hasLikedBy() => _likedBy != null;

  // "saved_by" field.
  List<DocumentReference>? _savedBy;
  List<DocumentReference> get savedBy => _savedBy ?? const [];
  bool hasSavedBy() => _savedBy != null;

  void _initializeFields() {
    _submitBy = snapshotData['submit_by'] as DocumentReference?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _video = snapshotData['video'] as String?;
    _description = snapshotData['description'] as String?;
    _category = getDataList(snapshotData['category']);
    _title = snapshotData['title'] as String?;
    _status = snapshotData['status'] as String?;
    _thumbnailUploaded = snapshotData['thumbnail_uploaded'] as String?;
    _likedBy = getDataList(snapshotData['liked_by']);
    _savedBy = getDataList(snapshotData['saved_by']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CraftSubmission');

  static Stream<CraftSubmissionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CraftSubmissionRecord.fromSnapshot(s));

  static Future<CraftSubmissionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CraftSubmissionRecord.fromSnapshot(s));

  static CraftSubmissionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CraftSubmissionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CraftSubmissionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CraftSubmissionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CraftSubmissionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CraftSubmissionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCraftSubmissionRecordData({
  DocumentReference? submitBy,
  String? thumbnail,
  String? video,
  String? description,
  String? title,
  String? status,
  String? thumbnailUploaded,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'submit_by': submitBy,
      'thumbnail': thumbnail,
      'video': video,
      'description': description,
      'title': title,
      'status': status,
      'thumbnail_uploaded': thumbnailUploaded,
    }.withoutNulls,
  );

  return firestoreData;
}

class CraftSubmissionRecordDocumentEquality
    implements Equality<CraftSubmissionRecord> {
  const CraftSubmissionRecordDocumentEquality();

  @override
  bool equals(CraftSubmissionRecord? e1, CraftSubmissionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.submitBy == e2?.submitBy &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.video == e2?.video &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.title == e2?.title &&
        e1?.status == e2?.status &&
        e1?.thumbnailUploaded == e2?.thumbnailUploaded &&
        listEquality.equals(e1?.likedBy, e2?.likedBy) &&
        listEquality.equals(e1?.savedBy, e2?.savedBy);
  }

  @override
  int hash(CraftSubmissionRecord? e) => const ListEquality().hash([
        e?.submitBy,
        e?.thumbnail,
        e?.video,
        e?.description,
        e?.category,
        e?.title,
        e?.status,
        e?.thumbnailUploaded,
        e?.likedBy,
        e?.savedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is CraftSubmissionRecord;
}
