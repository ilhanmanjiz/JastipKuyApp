import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LayananAduanRecord extends FirestoreRecord {
  LayananAduanRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "aduan" field.
  String? _aduan;
  String get aduan => _aduan ?? '';
  bool hasAduan() => _aduan != null;

  // "nama" field.
  String? _nama;
  String get nama => _nama ?? '';
  bool hasNama() => _nama != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _aduan = snapshotData['aduan'] as String?;
    _nama = snapshotData['nama'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('layanan_aduan');

  static Stream<LayananAduanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LayananAduanRecord.fromSnapshot(s));

  static Future<LayananAduanRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LayananAduanRecord.fromSnapshot(s));

  static LayananAduanRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LayananAduanRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LayananAduanRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LayananAduanRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LayananAduanRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LayananAduanRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLayananAduanRecordData({
  String? aduan,
  String? nama,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'aduan': aduan,
      'nama': nama,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class LayananAduanRecordDocumentEquality
    implements Equality<LayananAduanRecord> {
  const LayananAduanRecordDocumentEquality();

  @override
  bool equals(LayananAduanRecord? e1, LayananAduanRecord? e2) {
    return e1?.aduan == e2?.aduan &&
        e1?.nama == e2?.nama &&
        e1?.email == e2?.email;
  }

  @override
  int hash(LayananAduanRecord? e) =>
      const ListEquality().hash([e?.aduan, e?.nama, e?.email]);

  @override
  bool isValidKey(Object? o) => o is LayananAduanRecord;
}
