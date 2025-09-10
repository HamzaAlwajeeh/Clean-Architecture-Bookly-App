import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('Change: $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('Create: $bloc');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('Close: $bloc');
  }
}
