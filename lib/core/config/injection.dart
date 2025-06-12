import 'package:get_it/get_it.dart';

class Injections {
  static final GetIt _getIt = GetIt.instance;

  static Future<void> init() async {
    // slide
    // _getIt.registerFactory<SlideData>(() => SlideData());
    // _getIt.registerFactory<SlideCubit>(() => SlideCubit(repo: _getIt()));
  }

  static T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
