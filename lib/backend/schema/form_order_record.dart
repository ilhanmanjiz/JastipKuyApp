import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormOrderRecord extends FirestoreRecord {
  FormOrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "detail_pesanan" field.
  String? _detailPesanan;
  String get detailPesanan => _detailPesanan ?? '';
  bool hasDetailPesanan() => _detailPesanan != null;

  // "alamat_tujuan" field.
  String? _alamatTujuan;
  String get alamatTujuan => _alamatTujuan ?? '';
  bool hasAlamatTujuan() => _alamatTujuan != null;

  // "alamat_tempat_order" field.
  String? _alamatTempatOrder;
  String get alamatTempatOrder => _alamatTempatOrder ?? '';
  bool hasAlamatTempatOrder() => _alamatTempatOrder != null;

  void _initializeFields() {
    _detailPesanan = snapshotData['detail_pesanan'] as String?;
    _alamatTujuan = snapshotData['alamat_tujuan'] as String?;
    _alamatTempatOrder = snapshotData['alamat_tempat_order'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('form_order');

  static Stream<FormOrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FormOrderRecord.fromSnapshot(s));

  static Future<FormOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FormOrderRecord.fromSnapshot(s));

  static FormOrderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FormOrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FormOrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FormOrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FormOrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FormOrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFormOrderRecordData({
  String? detailPesanan,
  String? alamatTujuan,
  String? alamatTempatOrder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'detail_pesanan': detailPesanan,
      'alamat_tujuan': alamatTujuan,
      'alamat_tempat_order': alamatTempatOrder,
    }.withoutNulls,
  );

  return firestoreData;
}

class FormOrderRecordDocumentEquality implements Equality<FormOrderRecord> {
  const FormOrderRecordDocumentEquality();

  @override
  bool equals(FormOrderRecord? e1, FormOrderRecord? e2) {
    return e1?.detailPesanan == e2?.detailPesanan &&
        e1?.alamatTujuan == e2?.alamatTujuan &&
        e1?.alamatTempatOrder == e2?.alamatTempatOrder;
  }

  @override
  int hash(FormOrderRecord? e) => const ListEquality()
      .hash([e?.detailPesanan, e?.alamatTujuan, e?.alamatTempatOrder]);

  @override
  bool isValidKey(Object? o) => o is FormOrderRecord;
}
