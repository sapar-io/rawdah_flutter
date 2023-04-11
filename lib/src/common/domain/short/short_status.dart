// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShortStatus {
  final bool isCompleted;
  final bool isBanned;
  final bool isDeleted;

  ShortStatus({
    this.isCompleted = false,
    this.isBanned = false,
    this.isDeleted = false,
  });

  ShortStatus copyWith({
    bool? isCompleted,
    bool? isBanned,
    bool? isDeleted,
  }) {
    return ShortStatus(
      isCompleted: isCompleted ?? this.isCompleted,
      isBanned: isBanned ?? this.isBanned,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isCompleted': isCompleted,
      'isBanned': isBanned,
      'isDeleted': isDeleted,
    };
  }

  factory ShortStatus.fromMap(Map<String, dynamic> map) {
    return ShortStatus(
      isCompleted: map['isCompleted'] as bool,
      isBanned: map['isBanned'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortStatus.fromJson(String source) =>
      ShortStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TripStatus(isCompleted: $isCompleted, isBanned: $isBanned, isDeleted: $isDeleted)';

  @override
  bool operator ==(covariant ShortStatus other) {
    if (identical(this, other)) return true;

    return other.isCompleted == isCompleted &&
        other.isBanned == isBanned &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode =>
      isCompleted.hashCode ^ isBanned.hashCode ^ isDeleted.hashCode;
}
