enum AppImages {
  guestAvatarStorageLink,
  buyers,
}

extension AppIconsExtension on AppImages {
  String get assetName {
    switch (this) {
      case AppImages.guestAvatarStorageLink:
        return 'https://firebasestorage.googleapis.com/v0/b/sendnow-a7ea8.appspot.com/o/guest_avatar.png?alt=media&token=491d64fc-d336-478e-a159-36be7012d2af';

      case AppImages.buyers:
        return 'assets/images/buyers.jpeg';
    }
  }
}
