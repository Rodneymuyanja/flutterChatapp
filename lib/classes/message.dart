import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderId;
  final String receiverId;
  final String senderEmail;
  final Timestamp time;
  final String mymessage;
  final bool isRead;

  Message(
    {
    required  this.senderId, 
    required this.receiverId,
    required this.senderEmail,
    required this.mymessage,
    required this.time,
    required this.isRead
  });

  Map<String, dynamic> toMap(){
    return {
      'senderId':senderId,
      'receiverId':receiverId,
      'senderEmail':senderEmail,
      'time':time,
      'mymessage':mymessage,
      'isRead':isRead,
    };
  }

}