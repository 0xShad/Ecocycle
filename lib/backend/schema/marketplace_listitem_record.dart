import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarketplaceListitemRecord extends FirestoreRecord {
  MarketplaceListitemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "list_by" field.
  DocumentReference? _listBy;
  DocumentReference? get listBy => _listBy;
  bool hasListBy() => _listBy != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "item_name" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "item_condition" field.
  List<String>? _itemCondition;
  List<String> get itemCondition => _itemCondition ?? const [];
  bool hasItemCondition() => _itemCondition != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _listBy = snapshotData['list_by'] as DocumentReference?;
    _images = getDataList(snapshotData['images']);
    _description = snapshotData['description'] as String?;
    _itemName = snapshotData['item_name'] as String?;
    _category = getDataList(snapshotData['category']);
    _status = snapshotData['status'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _itemCondition = getDataList(snapshotData['item_condition']);
    _price = castToType<int>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('marketplace_listitem');

  static Stream<MarketplaceListitemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarketplaceListitemRecord.fromSnapshot(s));

  static Future<MarketplaceListitemRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MarketplaceListitemRecord.fromSnapshot(s));

  static MarketplaceListitemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MarketplaceListitemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarketplaceListitemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarketplaceListitemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarketplaceListitemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarketplaceListitemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarketplaceListitemRecordData({
  DocumentReference? listBy,
  String? description,
  String? itemName,
  String? status,
  DateTime? date,
  int? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'list_by': listBy,
      'description': description,
      'item_name': itemName,
      'status': status,
      'date': date,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarketplaceListitemRecordDocumentEquality
    implements Equality<MarketplaceListitemRecord> {
  const MarketplaceListitemRecordDocumentEquality();

  @override
  bool equals(MarketplaceListitemRecord? e1, MarketplaceListitemRecord? e2) {
    const listEquality = ListEquality();
    return e1?.listBy == e2?.listBy &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.description == e2?.description &&
        e1?.itemName == e2?.itemName &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.status == e2?.status &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.itemCondition, e2?.itemCondition) &&
        e1?.price == e2?.price;
  }

  @override
  int hash(MarketplaceListitemRecord? e) => const ListEquality().hash([
        e?.listBy,
        e?.images,
        e?.description,
        e?.itemName,
        e?.category,
        e?.status,
        e?.date,
        e?.itemCondition,
        e?.price
      ]);

  @override
  bool isValidKey(Object? o) => o is MarketplaceListitemRecord;
}
