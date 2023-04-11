enum AppIcons {
  map,
  names,
  moon,
  play,
  pause,
  chevronLeft,
  chevronRight,
  dotsHorizontal,
  list,
  folder,
  settings,
  message,
  camera,
  website,
  share,
  star,
  heart,
  mail,
  confidentional,
  terms,
  lock,
  book,
  check,
  flag,
  correct,
  mistake,
}

extension AppIconsExtension on AppIcons {
  String get assetName {
    switch (this) {
      case AppIcons.map:
        return 'assets/icons/map.svg';
      case AppIcons.names:
        return 'assets/icons/names.svg';
      case AppIcons.moon:
        return 'assets/icons/moon.svg';
      case AppIcons.play:
        return 'assets/icons/play.svg';
      case AppIcons.pause:
        return 'assets/icons/pause.svg';
      case AppIcons.chevronLeft:
        return 'assets/icons/chevron-left.svg';
      case AppIcons.chevronRight:
        return 'assets/icons/chevron-right.svg';
      case AppIcons.dotsHorizontal:
        return 'assets/icons/dots-horizontal.svg';
      case AppIcons.list:
        return 'assets/icons/list.svg';
      case AppIcons.folder:
        return 'assets/icons/folder.svg';
      case AppIcons.settings:
        return 'assets/icons/settings.svg';
      case AppIcons.message:
        return 'assets/icons/message.svg';
      case AppIcons.camera:
        return 'assets/icons/camera.svg';
      case AppIcons.share:
        return 'assets/icons/share.svg';
      case AppIcons.website:
        return 'assets/icons/website.svg';
      case AppIcons.star:
        return 'assets/icons/star.svg';
      case AppIcons.heart:
        return 'assets/icons/heart.svg';
      case AppIcons.mail:
        return 'assets/icons/mail.svg';
      case AppIcons.confidentional:
        return 'assets/icons/confidentional.svg';
      case AppIcons.terms:
        return 'assets/icons/terms.svg';
      case AppIcons.lock:
        return 'assets/icons/lock.svg';
      case AppIcons.book:
        return 'assets/icons/book.svg';
      case AppIcons.check:
        return 'assets/icons/check.svg';
      case AppIcons.flag:
        return 'assets/icons/flag.svg';
      case AppIcons.correct:
        return 'assets/icons/correct.svg';
      case AppIcons.mistake:
        return 'assets/icons/mistake.svg';
    }
  }
}
