class Exam {
  final int statusCode;
  final String errorMessage;
  final String imgUrl;
  final String imgMessage;

  int count;

  Exam(
      {this.imgUrl = '',
      this.imgMessage = '',
      required this.statusCode,
      this.count = 0,
      this.errorMessage = ''});

  factory Exam.mapToObject(Map<String, dynamic> params) {
    return Exam(
        statusCode: params['status_code'],
        errorMessage: params['error_message'] ?? '',
        imgUrl: params['image'] ?? '',
        imgMessage: params['message'] ?? '',
        count: params['count'] ?? 0);
  }
}
