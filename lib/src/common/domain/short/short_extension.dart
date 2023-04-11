import 'package:rawdah/src/common/domain/short/short_author.dart';

extension UserShortExtension on ShortAuthor {
  double get rating {
    if (reviews.isEmpty) return 0;

    double rate = 0;
    for (var element in reviews) {
      rate += element.rating;
    }
    rate = rate / reviews.length;
    return rate;
  }
}
