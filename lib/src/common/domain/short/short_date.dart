// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ShortDate {
  final Timestamp createdDate;
  final Timestamp updatedDate;
  final Timestamp? bannedDate;
  final Timestamp? deletedDate;
  final Timestamp? completedDate;

  ShortDate({
    required this.createdDate,
    required this.updatedDate,
    this.bannedDate,
    this.deletedDate,
    this.completedDate,
  });

  ShortDate copyWith({
    Timestamp? createdDate,
    Timestamp? updatedDate,
    Timestamp? bannedDate,
    Timestamp? deletedDate,
    Timestamp? completedDate,
  }) {
    return ShortDate(
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      bannedDate: bannedDate ?? this.bannedDate,
      deletedDate: deletedDate ?? this.deletedDate,
      completedDate: completedDate ?? this.completedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'bannedDate': bannedDate,
      'deletedDate': deletedDate,
      'completedDate': completedDate,
    };
  }

  factory ShortDate.fromMap(Map<String, dynamic> map) {
    return ShortDate(
      createdDate: map['createdDate'],
      updatedDate: map['updatedDate'],
      bannedDate: map['bannedDate'],
      deletedDate: map['deletedDate'],
      completedDate: map['completedDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortDate.fromJson(String source) =>
      ShortDate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShortDate(createdDate: $createdDate, updatedDate: $updatedDate, bannedDate: $bannedDate, deletedDate: $deletedDate, completedDate: $completedDate)';
  }

  @override
  bool operator ==(covariant ShortDate other) {
    if (identical(this, other)) return true;

    return other.createdDate == createdDate &&
        other.updatedDate == updatedDate &&
        other.bannedDate == bannedDate &&
        other.deletedDate == deletedDate &&
        other.completedDate == completedDate;
  }

  @override
  int get hashCode {
    return createdDate.hashCode ^
        updatedDate.hashCode ^
        bannedDate.hashCode ^
        deletedDate.hashCode ^
        completedDate.hashCode;
  }
}
