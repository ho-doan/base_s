import 'package:common/system/themes/themes.dart';
import 'package:flutter/material.dart';

extension ThemeX on ThemeData {
  AppColors get colors {
    return extension<AppColors>()!;
  }

  AppStyles get styles {
    return extension<AppStyles>()!;
  }
}
