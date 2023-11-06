import 'package:equatable/equatable.dart';

class Messages extends Equatable {
  final String? message;
  final String? emailSender;
  final String? emailRecuper;
  final String? descusionId;
  final DateTime? dateTime;

  const Messages(
      {this.message,
      this.emailSender,
      this.emailRecuper,
      this.descusionId,
      this.dateTime});

  @override
  List<Object?> get props =>
      [message, emailSender, emailRecuper, descusionId, dateTime];
}
