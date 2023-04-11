// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rawdah/src/common/domain/short/short_author.dart';
import 'package:rawdah/src/common/domain/short/short_date.dart';
import 'package:rawdah/src/common/domain/short/short_review.dart';
import 'package:rawdah/src/common/domain/user/user_status.dart';

class FireUser {
  String uid;
  String name;
  String? avatarURL;
  String? phoneNumber;
  String? mailAddress;
  final List<ShortReview> reviews;
  final UserStatus status;
  final ShortDate date;

  FireUser({
    required this.uid,
    required this.name,
    required this.avatarURL,
    required this.phoneNumber,
    required this.mailAddress,
    required this.reviews,
    required this.status,
    required this.date,
  });

  FireUser copyWith({
    String? uid,
    String? name,
    String? avatarUrl,
    String? phoneNumber,
    String? mailAddress,
    List<ShortReview>? reviews,
    UserStatus? status,
    ShortDate? date,
  }) {
    return FireUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      avatarURL: avatarUrl ?? avatarURL,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      mailAddress: mailAddress ?? this.mailAddress,
      reviews: reviews ?? this.reviews,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'avatarURL': avatarURL,
      'phoneNumber': phoneNumber,
      'mailAddress': mailAddress,
      'reviews': reviews.map((x) => x.toMap()).toList(),
      'status': status.toMap(),
      'date': date.toMap(),
    };
  }

  factory FireUser.fromMap(Map<String, dynamic> map) {
    final reviews = map['reviews'] as List;

    return FireUser(
      uid: map['uid'] as String,
      name: map['name'] as String,
      avatarURL: map['avatarURL'] as String?,
      phoneNumber: map['phoneNumber'] as String?,
      mailAddress: map['mailAddress'] as String?,
      reviews: reviews.map((e) => ShortReview.fromMap(e)).toList(),
      status: UserStatus.fromMap(map['status'] as Map<String, dynamic>),
      date: ShortDate.fromMap(map['date'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FireUser.fromJson(String source) =>
      FireUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FireUser(uid: $uid, name: $name, avatarURL: $avatarURL, phoneNumber: $phoneNumber, mailAddress: $mailAddress, reviews: $reviews, status: $status, date: $date)';
  }

  @override
  bool operator ==(covariant FireUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.avatarURL == avatarURL &&
        other.phoneNumber == phoneNumber &&
        other.mailAddress == mailAddress &&
        listEquals(other.reviews, reviews) &&
        other.status == status &&
        other.date == date;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        avatarURL.hashCode ^
        phoneNumber.hashCode ^
        mailAddress.hashCode ^
        reviews.hashCode ^
        status.hashCode ^
        date.hashCode;
  }
}

extension FireUserExtension on FireUser {
  ShortAuthor get author {
    return ShortAuthor(
      uid: uid,
      name: name,
      avatarURL: avatarURL,
      reviews: reviews,
    );
  }
}
