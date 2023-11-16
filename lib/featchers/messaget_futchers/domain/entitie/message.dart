import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Messages extends Equatable {
  final String? messageId;
  final String message;
  final String? emailSender;
  final String? emailRecuper;
  final String? descusionId;
  final Timestamp? dateTime;
  final bool? vu;
  final int nbrvu;

  const Messages({
    required this.message,
    required this.nbrvu,
    this.messageId,
    this.emailSender,
    this.emailRecuper,
    this.descusionId,
    this.dateTime,
    this.vu,
  });

  @override
  List<Object?> get props =>
      [message, emailSender, emailRecuper, descusionId, dateTime];
}
