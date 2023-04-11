// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserStatus {
  final bool isVerified;
  final bool isAgent;
  final bool isBanned;
  final bool isDeleted;

  UserStatus({
    required this.isVerified,
    required this.isAgent,
    required this.isBanned,
    required this.isDeleted,
  });

  UserStatus copyWith({
    bool? isVerified,
    bool? isAgent,
    bool? isBanned,
    bool? isDeleted,
  }) {
    return UserStatus(
      isVerified: isVerified ?? this.isVerified,
      isAgent: isAgent ?? this.isAgent,
      isBanned: isBanned ?? this.isBanned,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isVerified': isVerified,
      'isAgent': isAgent,
      'isBanned': isBanned,
      'isDeleted': isDeleted,
    };
  }

  factory UserStatus.fromMap(Map<String, dynamic> map) {
    return UserStatus(
      isVerified: map['isVerified'] as bool,
      isAgent: map['isAgent'] as bool,
      isBanned: map['isBanned'] as bool,
      isDeleted: map['isDeleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserStatus.fromJson(String source) =>
      UserStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserStatus(isVerified: $isVerified, isAgent: $isAgent, isBanned: $isBanned, isDeleted: $isDeleted)';

  @override
  bool operator ==(covariant UserStatus other) {
    if (identical(this, other)) return true;

    return other.isVerified == isVerified &&
        other.isAgent == isAgent &&
        other.isBanned == isBanned &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode =>
      isVerified.hashCode ^
      isAgent.hashCode ^
      isBanned.hashCode ^
      isDeleted.hashCode;
}
