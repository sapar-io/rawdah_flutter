// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShortReview {
  final String fromUID;
  final double rating;
  final String comment;
  
  ShortReview({
    required this.fromUID,
    required this.rating,
    required this.comment,
  });

  ShortReview copyWith({
    String? fromUID,
    double? rating,
    String? comment,
  }) {
    return ShortReview(
      fromUID: fromUID ?? this.fromUID,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fromUID': fromUID,
      'rating': rating,
      'comment': comment,
    };
  }

  factory ShortReview.fromMap(Map<String, dynamic> map) {
    return ShortReview(
      fromUID: map['fromUID'] as String,
      rating: map['rating'] as double,
      comment: map['comment'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShortReview.fromJson(String source) => ShortReview.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShortReview(fromUID: $fromUID, rating: $rating, comment: $comment)';

  @override
  bool operator ==(covariant ShortReview other) {
    if (identical(this, other)) return true;
  
    return 
      other.fromUID == fromUID &&
      other.rating == rating &&
      other.comment == comment;
  }

  @override
  int get hashCode => fromUID.hashCode ^ rating.hashCode ^ comment.hashCode;
}
