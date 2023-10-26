class Message {
  final String? uid;
  final String message;
  final DateTime? date;
  final String? email;

  Message({this.uid, this.date,this.email, required this.message});

  Map<String, dynamic> toMap() {
    return ({"uid": uid, "message": message, "date": date, "email": email});
  }
}
