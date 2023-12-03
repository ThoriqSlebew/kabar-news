import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String alamat;
  final String email;
  final String no_telp;
  final int username;

  UserModel({
    required this.alamat,
    required this.email,
    required this.no_telp,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      'alamat': alamat,
      'email': email,
      'no_telp': no_telp,
      'username': username,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      alamat: json['alamat'],
      email: json['email'],
      no_telp: json['no_telp'],
      username: json['username'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      alamat: snapshot.get('alamat'),
      email: snapshot.get('email'),
      no_telp: snapshot.get('no_telp'),
      username: snapshot.get('username'),
    );
  }
}