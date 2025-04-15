import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "poster" field.
  DocumentReference? _poster;
  DocumentReference? get poster => _poster;
  bool hasPoster() => _poster != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "commentref" field.
  DocumentReference? _commentref;
  DocumentReference? get commentref => _commentref;
  bool hasCommentref() => _commentref != null;

  // "post_is_edited" field.
  bool? _postIsEdited;
  bool get postIsEdited => _postIsEdited ?? false;
  bool hasPostIsEdited() => _postIsEdited != null;

  void _initializeFields() {
    _topic = snapshotData['topic'] as String?;
    _poster = snapshotData['poster'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _commentref = snapshotData['commentref'] as DocumentReference?;
    _postIsEdited = snapshotData['post_is_edited'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? topic,
  DocumentReference? poster,
  String? image,
  DateTime? date,
  DocumentReference? commentref,
  bool? postIsEdited,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'topic': topic,
      'poster': poster,
      'image': image,
      'date': date,
      'commentref': commentref,
      'post_is_edited': postIsEdited,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.topic == e2?.topic &&
        e1?.poster == e2?.poster &&
        e1?.image == e2?.image &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.commentref == e2?.commentref &&
        e1?.postIsEdited == e2?.postIsEdited;
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.topic,
        e?.poster,
        e?.image,
        e?.date,
        e?.likes,
        e?.commentref,
        e?.postIsEdited
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
