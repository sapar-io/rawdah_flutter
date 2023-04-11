// import 'package:sendnow_app/src/constants/app_illustrations.dart';

enum EmptyScreenType {
  needLogin,
  emptyList,

  authError,
  authBanned,
  authDeleted,
}

extension EmptyScreenTypeExtension on EmptyScreenType {
  String? get illustration {
    switch (this) {
      case EmptyScreenType.emptyList:
        // return AppIllustrations.search.assetName;
        return null;
      default:
        return null;
    }
  }

  String get title {
    switch (this) {
      case EmptyScreenType.needLogin:
        return "Войдите в систему";
      case EmptyScreenType.emptyList:
        return "Упс, тут пусто";

      case EmptyScreenType.authError:
        return "Auth Error";
      case EmptyScreenType.authBanned:
        return "Ваш аккаунт был забанин";
      case EmptyScreenType.authDeleted:
        return "Ваш аккаунт был удален";
    }
  }

  String get description {
    switch (this) {
      case EmptyScreenType.needLogin:
        return "Для полного доступа к функционалу";
      case EmptyScreenType.emptyList:
        return "Никаких данных";

      case EmptyScreenType.authError:
        return "Auth Error";
      case EmptyScreenType.authBanned:
        return "По всем вопросом обращайтесь по номеру +7(708)310-3636";
      case EmptyScreenType.authDeleted:
        return "Зайдите через другой номер телефона";
    }
  }

  EmptyScreenButton get buttons {
    switch (this) {
      case EmptyScreenType.needLogin:
        return EmptyScreenButton.login;
      case EmptyScreenType.authDeleted:
        return EmptyScreenButton.logout;
      default:
        return EmptyScreenButton.none;
    }
  }
}

enum EmptyScreenButton {
  login,
  logout,
  none,
}
