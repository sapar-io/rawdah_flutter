// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShortStatistics {
  final int views;
  final List<String> contacted;
  final List<String> connected;
  final List<String> liked;

  ShortStatistics({
    this.views = 0,
    required this.contacted,
    required this.connected,
    required this.liked,
  });

  ShortStatistics copyWith({
    int? views,
    List<String>? contacted,
    List<String>? connected,
    List<String>? liked,
  }) {
    return ShortStatistics(
      views: views ?? this.views,
      contacted: contacted ?? this.contacted,
      connected: connected ?? this.connected,
      liked: liked ?? this.liked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'views': views,
      'contacted': contacted,
      'connected': connected,
      'liked': liked,
    };
  }

  factory ShortStatistics.fromMap(Map<String, dynamic> map) {
    return ShortStatistics(
      views: map['views'] as int,
      contacted:
          (map['contacted'] as List<dynamic>).map((e) => e as String).toList(),
      connected:
          (map['connected'] as List<dynamic>).map((e) => e as String).toList(),
      liked: (map['liked'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortStatistics.fromJson(String source) =>
      ShortStatistics.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShortStatistics(views: $views, contacted: $contacted, connected: $connected, liked: $liked)';
  }

  @override
  bool operator ==(covariant ShortStatistics other) {
    if (identical(this, other)) return true;

    return other.views == views &&
        other.contacted == contacted &&
        other.connected == connected &&
        other.liked == liked;
  }

  @override
  int get hashCode {
    return views.hashCode ^
        contacted.hashCode ^
        connected.hashCode ^
        liked.hashCode;
  }
}
