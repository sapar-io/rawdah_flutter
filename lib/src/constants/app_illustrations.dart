enum AppIllustrations {
  search,
}

extension AppIllustrationsExtension on AppIllustrations {
  String get assetName {
    switch (this) {
      case AppIllustrations.search:
        return 'assets/illustrations/search.png';
    }
  }
}
