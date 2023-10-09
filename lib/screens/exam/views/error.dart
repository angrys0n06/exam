import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import '../bloc.dart';

class ViewState extends base.ViewState {
  final String errorMessage;
  ViewState(this.errorMessage);
  @override
  Widget content(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
            size: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              errorMessage,
              style: context.texts.headlineMedium,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.bloc.fetchDataFromServer();
              },
              child: Text(context.strings.examRetryBtnLabel))
        ],
      ),
    );
  }
}
