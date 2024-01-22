part of 'extensions.dart';

extension ThemeX on ThemeData {
  AppColors get colors {
    return extension<AppColors>()!;
  }

  AppStyles get styles {
    return extension<AppStyles>()!;
  }
}
