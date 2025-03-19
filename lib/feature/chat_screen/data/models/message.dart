class Massage{
  final String massage;
    final String id;

  // final String sender;
  // final String receiver;
  // final String time;
  // final bool isRead;

  Massage(
     this.massage,
     this.id,
    // required this.receiver,
    // required this.time,
    // required this.isRead,
  );
 
  factory Massage.fromJson( jsonData ) {
    return Massage( jsonData["massages"],jsonData["id"]
      // sender: json['sender'],
      // receiver: json['receiver'],
      // time: json['time'],
      // isRead: json['isRead'],
    );
  }


}