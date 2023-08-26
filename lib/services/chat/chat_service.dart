import 'package:chatapp/classes/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sendMessage (String receiverId, String message) async{
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderId: currentUserId,
      receiverId: receiverId, 
      senderEmail: currentUserEmail,
      mymessage: message,
      time: timestamp, 
      isRead: false
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatroomId = ids.join('_');

    await _firebaseFirestore
    .collection('chat_rooms')
    .doc(chatroomId)
    .collection('messages')
    .add(newMessage.toMap());
  } 

  Stream<QuerySnapshot> getMessages(String userId, String OtherUserId){
    List<String> ids = [userId, OtherUserId];
    ids.sort();
    String chatroomId = ids.join('_');

    return _firebaseFirestore
      .collection('chat_rooms')
      .doc(chatroomId)
      .collection('messages')
      .orderBy('time', descending: false)
      .snapshots();
  }
}