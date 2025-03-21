import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final dynamic data;
  final bool statusCode;
  final String message;

  const ErrorMessageModel(
      {required this.data, required this.statusCode, required this.message});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          data: json["data"],
          statusCode: json["status"],
          message: json["message"]);

  @override
  List<Object?> get props => [data, statusCode, message];
}
