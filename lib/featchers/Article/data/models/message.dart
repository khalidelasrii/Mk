class Message {
  final String? uid;
  final String message;
  final DateTime? date;
  final String? senderEmail;
  final String recupererEmail;

  Message(
      {this.uid,
      this.date,
      this.senderEmail,
      required this.message,
      required this.recupererEmail});

  Map<String, dynamic> toMap() {
    return ({
      "uid": uid,
      "message": message,
      "date": date,
      "senderEmail": senderEmail,
      "recupererEmail": recupererEmail,
    });
  }
}
