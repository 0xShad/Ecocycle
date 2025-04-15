import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  bool hasFirstname() => _firstname != null;

  // "lastname" field.
  String? _lastname;
  String get lastname => _lastname ?? '';
  bool hasLastname() => _lastname != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  bool hasProfilePic() => _profilePic != null;

  // "background_pic" field.
  String? _backgroundPic;
  String get backgroundPic => _backgroundPic ?? '';
  bool hasBackgroundPic() => _backgroundPic != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "blocked_users" field.
  List<DocumentReference>? _blockedUsers;
  List<DocumentReference> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  // "following_users" field.
  List<DocumentReference>? _followingUsers;
  List<DocumentReference> get followingUsers => _followingUsers ?? const [];
  bool hasFollowingUsers() => _followingUsers != null;

  // "users_following_me" field.
  List<DocumentReference>? _usersFollowingMe;
  List<DocumentReference> get usersFollowingMe => _usersFollowingMe ?? const [];
  bool hasUsersFollowingMe() => _usersFollowingMe != null;

  // "user_is_admin" field.
  bool? _userIsAdmin;
  bool get userIsAdmin => _userIsAdmin ?? false;
  bool hasUserIsAdmin() => _userIsAdmin != null;

  // "chatref" field.
  List<DocumentReference>? _chatref;
  List<DocumentReference> get chatref => _chatref ?? const [];
  bool hasChatref() => _chatref != null;

  // "personal_msgs" field.
  List<DocumentReference>? _personalMsgs;
  List<DocumentReference> get personalMsgs => _personalMsgs ?? const [];
  bool hasPersonalMsgs() => _personalMsgs != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstname = snapshotData['firstname'] as String?;
    _lastname = snapshotData['lastname'] as String?;
    _bio = snapshotData['bio'] as String?;
    _profilePic = snapshotData['profile_pic'] as String?;
    _backgroundPic = snapshotData['background_pic'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _username = snapshotData['username'] as String?;
    _blockedUsers = getDataList(snapshotData['blocked_users']);
    _followingUsers = getDataList(snapshotData['following_users']);
    _usersFollowingMe = getDataList(snapshotData['users_following_me']);
    _userIsAdmin = snapshotData['user_is_admin'] as bool?;
    _chatref = getDataList(snapshotData['chatref']);
    _personalMsgs = getDataList(snapshotData['personal_msgs']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstname,
  String? lastname,
  String? bio,
  String? profilePic,
  String? backgroundPic,
  String? photoUrl,
  String? username,
  bool? userIsAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'firstname': firstname,
      'lastname': lastname,
      'bio': bio,
      'profile_pic': profilePic,
      'background_pic': backgroundPic,
      'photo_url': photoUrl,
      'username': username,
      'user_is_admin': userIsAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.firstname == e2?.firstname &&
        e1?.lastname == e2?.lastname &&
        e1?.bio == e2?.bio &&
        e1?.profilePic == e2?.profilePic &&
        e1?.backgroundPic == e2?.backgroundPic &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.username == e2?.username &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers) &&
        listEquality.equals(e1?.followingUsers, e2?.followingUsers) &&
        listEquality.equals(e1?.usersFollowingMe, e2?.usersFollowingMe) &&
        e1?.userIsAdmin == e2?.userIsAdmin &&
        listEquality.equals(e1?.chatref, e2?.chatref) &&
        listEquality.equals(e1?.personalMsgs, e2?.personalMsgs);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.firstname,
        e?.lastname,
        e?.bio,
        e?.profilePic,
        e?.backgroundPic,
        e?.photoUrl,
        e?.username,
        e?.blockedUsers,
        e?.followingUsers,
        e?.usersFollowingMe,
        e?.userIsAdmin,
        e?.chatref,
        e?.personalMsgs
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
