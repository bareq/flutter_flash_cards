import 'package:get_it/get_it.dart';

abstract class DIModule {
  final getIt = GetIt.instance;

  void setupModule();
}
