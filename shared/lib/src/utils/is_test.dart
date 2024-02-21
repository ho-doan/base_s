import 'dart:io';

import 'package:flutter/material.dart';

bool get kTest => Platform.environment.containsKey('FLUTTER_TEST');
@visibleForTesting
Directory get kDirectory => Directory('');
