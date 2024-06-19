import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormAnjemRecord extends FirestoreRecord {
  FormAnjemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "detail_order" field.
  String? _detailOrder;
  String get detailOrder => _detailOrder ?? '';
  bool hasDetailOrder() => _detailOrder != null;

  // "alamat_tujuan" field.
  String? _alamatTujuan;
  String get alamatTujuan => _alamatTujuan ?? '';
  bool hasAlamatTujuan() => _alamatTujuan != null;

  // "titik_penjemputan" field.
  String? _titikPenjemputan;
  String get titikPenjemputan => _titikPenjemputan ?? '';
  bool hasTitikPenjemputan() => _titikPenjemputan != null;

  void _initializeFields() {
    _detailOrder = snapshotData['detail_order'] as String?;
    _alamatTujuan = snapshotData['alamat_tujuan'] as String?;
    _titikPenjemputan = snapshotData['titik_penjemputan'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('form_anjem');

  static Stream<FormAnjemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormAnjemRecord.fromSnapshot(s));

  static Future<FormAnjemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormAnjemRecord.fromSnapshot(s));

  static FormAnjemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FormAnjemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormAnjemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormAnjemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormAnjemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormAnjemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormAnjemRecordData({
  String? detailOrder,
  String? alamatTujuan,
  String? titikPenjemputan,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'detail_order': detailOrder,
      'alamat_tujuan': alamatTujuan,
      'titik_penjemputan': titikPenjemputan,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormAnjemRecordDocumentEquality implements Equality<FormAnjemRecord> {
  const FormAnjemRecordDocumentEquality();

  @override
  bool equals(FormAnjemRecord? e1, FormAnjemRecord? e2) {
    return e1?.detailOrder == e2?.detailOrder &&
        e1?.alamatTujuan == e2?.alamatTujuan &&
        e1?.titikPenjemputan == e2?.titikPenjemputan;
  }

  @override
  int hash(FormAnjemRecord? e) => const ListEquality()
      .hash([e?.detailOrder, e?.alamatTujuan, e?.titikPenjemputan]);

  @override
  bool isValidKey(Object? o) => o is FormAnjemRecord;
}
