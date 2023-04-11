// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:rawdah/src/common/domain/short/short_review.dart';


class ShortAuthor {
  final String uid;
  final String name;
  final String? avatarURL;
  final List<ShortReview> reviews;

  ShortAuthor({
    required this.uid,
    required this.name,
    required this.avatarURL,
    required this.reviews,
  });

  ShortAuthor copyWith({
    String? uid,
    String? name,
    String? avatarURL,
    List<ShortReview>? reviews,
  }) {
    return ShortAuthor(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      avatarURL: avatarURL ?? this.avatarURL,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'avatarURL': avatarURL,
      'reviews': reviews.map((x) => x.toMap()).toList(),
    };
  }

  factory ShortAuthor.fromMap(Map<String, dynamic> map) {
    final reviews = map['reviews'] as List;
    return ShortAuthor(
      uid: map['uid'] as String,
      name: map['name'] as String,
      avatarURL: map['avatarURL'] as String?,
      reviews: reviews.map((e) => ShortReview.fromMap(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortAuthor.fromJson(String source) =>
      ShortAuthor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShortAuthor(uid: $uid, name: $name, avatarURL: $avatarURL, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant ShortAuthor other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.avatarURL == avatarURL &&
        listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ avatarURL.hashCode ^ reviews.hashCode;
  }
}
