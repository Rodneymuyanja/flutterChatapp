import 'package:chatapp/components/chat_bubble.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget { 
  final String receiverUserEmail;
  final String receiverUserId;
  const ChatPage({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUserId
    });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  bool isItMe = false;
  final TextEditingController _messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage ()async{
    if(_messageController.text.isNotEmpty){
      await chatService.sendMessage(widget.receiverUserId,
       _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.receiverUserEmail,
        style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()
          ),

          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList(){
    return StreamBuilder(
      stream: chatService.getMessages(widget.receiverUserId,
       _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Text('Error${snapshot.error}');
        }

        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text('loading.....');
        }

        return ListView(
          children: snapshot.data!.docs
          .map((document) => _buildMessageItem(document))
          .toList(),
        );
      },
    );
  }


  Widget _buildMessageItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data() 
    as Map<String, dynamic>;
    
    var alignment = (data['senderId'] ==
     _firebaseAuth.currentUser!.uid)
    ?Alignment.centerRight
    :Alignment.centerLeft;

    // if (data['senderId'] ==  _firebaseAuth.currentUser!.uid){
    //   setState(() {
    //     isItMe = true;
    //   });
    // }

    return Container(
      alignment: alignment,
      child: Padding(
        
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:(data['senderId'] ==
            _firebaseAuth.currentUser!.uid)
            ?CrossAxisAlignment.end
            :CrossAxisAlignment.start ,
          children: [
            //Text(data['senderEmail'], style: const TextStyle(color: Colors.black),),
            ChatBubble(message: data['mymessage'])
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput(){
    return Row(
      children: [
        Expanded(
          child: MyTextfield(controller: _messageController, hintText: 'message', obscureText: false)
        ),

        IconButton(onPressed: sendMessage, icon: const Icon(Icons.send, size:40))
      ],
    );
  }

}