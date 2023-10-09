export 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/services/server.dart';
import 'model/exam.dart';

import 'views/main.dart' as main_view;
import 'views/loading.dart' as loading_view;
import 'views/error.dart' as error_view;

extension Extension on BuildContext {
  Bloc get bloc => read<Bloc>();
}

class Bloc extends base.Bloc {
  Bloc(BuildContext context)
      : super(loading_view.ViewState(), context: context);

  late Exam examResult;
  @override
  void init() {
    fetchDataFromServer();
  }

  void fetchDataFromServer() async {
    emit(loading_view.ViewState());
    examResult = Exam.mapToObject(await context.server.data);

    switch (examResult.statusCode) {
      case 200:
        emit(main_view.ViewState(
            count: examResult.count,
            imgMessage: examResult.imgMessage,
            imgUrl: examResult.imgUrl));
        break;
      default:
        emit(error_view.ViewState(examResult.errorMessage));
    }
  }

  void counter(int val) async {
    emit(loading_view.ViewState());
    examResult.count = await context.server.addToCount(val);
    emit(main_view.ViewState(
        count: examResult.count,
        imgMessage: examResult.imgMessage,
        imgUrl: examResult.imgUrl));
  }
}
