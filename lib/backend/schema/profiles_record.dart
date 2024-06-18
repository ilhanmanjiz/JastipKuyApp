import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfilesRecord extends FirestoreRecord {
  ProfilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "profile_picture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  bool hasProfilePicture() => _profilePicture != null;

  // "nama" field.
  String? _nama;
  String get nama => _nama ?? '';
  bool hasNama() => _nama != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "alamat" field.
  String? _alamat;
  String get alamat => _alamat ?? '';
  bool hasAlamat() => _alamat != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _profilePicture = snapshotData['profile_picture'] as String?;
    _nama = snapshotData['nama'] as String?;
    _bio = snapshotData['bio'] as String?;
    _alamat = snapshotData['alamat'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('profiles')
          : FirebaseFirestore.instance.collectionGroup('profiles');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('profiles').doc(id);

  static Stream<ProfilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfilesRecord.fromSnapshot(s));

  static Future<ProfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfilesRecord.fromSnapshot(s));

  static ProfilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfilesRecordData({
  String? profilePicture,
  String? nama,
  String? bio,
  String? alamat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'profile_picture': profilePicture,
      'nama': nama,
      'bio': bio,
      'alamat': alamat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfilesRecordDocumentEquality implements Equality<ProfilesRecord> {
  const ProfilesRecordDocumentEquality();

  @override
  bool equals(ProfilesRecord? e1, ProfilesRecord? e2) {
    return e1?.profilePicture == e2?.profilePicture &&
        e1?.nama == e2?.nama &&
        e1?.bio == e2?.bio &&
        e1?.alamat == e2?.alamat;
  }

  @override
  int hash(ProfilesRecord? e) => const ListEquality()
      .hash([e?.profilePicture, e?.nama, e?.bio, e?.alamat]);

  @override
  bool isValidKey(Object? o) => o is ProfilesRecord;
}
