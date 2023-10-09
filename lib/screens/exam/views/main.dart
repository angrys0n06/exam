import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import '../bloc.dart';

class ViewState extends base.ViewState {
  final String imgUrl;
  final String imgMessage;
  final int count;
  ViewState({
    super.key,
    required this.imgUrl,
    required this.imgMessage,
    required this.count,
  });
  @override
  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            imgUrl,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                height: MediaQuery.of(context).size.width * .40,
                fit: BoxFit.fitHeight,
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Text(imgMessage),
          const SizedBox(
            height: 20,
          ),
          Text('${context.strings.examCounterLabel} $count'),
          ElevatedButton(
            onPressed: () {
              // context.server.
              context.bloc.counter(1);
            },
            child: Text(context.strings.examCounterBtnLabel),
          ),
        ],
      ),
    );
  }
}
