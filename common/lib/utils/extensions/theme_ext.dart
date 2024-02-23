part of 'extensions.dart';

extension ThemeX on ThemeData {
  AppColors get colors {
    return extension<AppColors>()!;
  }

  AppStyles get styles {
    return extension<AppStyles>()!;
  }
}

extension BuildContextTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
}
