import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('Change: $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('Create: $bloc');
  }

  @override
  void onClose(BlocBase bloc) {
    log('Close: $bloc');
  }
}
