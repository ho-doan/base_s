import 'package:bloc/bloc.dart';
import 'package:domain/services/local_database/share_preference/share_preference_helper.dart';
import 'package:meta/meta.dart';
import 'package:template/core/services/dependency_injection/service_locator.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  Future<void> updateFcmToken(String fcmToken) async {
    await getIt<SharedPreferenceHelper>().setFcmTokenKey(fcmToken);
  }
}
