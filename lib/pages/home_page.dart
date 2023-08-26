import 'package:chatapp/components/bottom_navigation.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/message.dart';
import '../components/my_container.dart';
import '../components/slidable.dart';
import 'chat_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List posts = [
    'post 1',
    'post 2'
  ];

  // final List<Message> peoples = [
  //   Message(
  //     mymessage: 'Hey, are you okay', 
  //     sender: 'miles',
  //     time: '14:32',
  //     isRead: true
  //     ), Message(
  //     mymessage: 'Hey, are you okay', 
  //     sender: 'miles',
  //     time: '14:32',
  //     isRead: true
  //     )
  // ];

  void signOut (){
    final authService = Provider.of<AuthService>(context,listen:false);
    authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Chats'),
        backgroundColor: Colors.black,
        leading: const Text('Edit'),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout_outlined))
        ],
      ),
      backgroundColor: Colors.black,
      // body: ListView.builder(
      //   itemCount:peoples.length ,
      //   itemBuilder: (context, index){
      //     return MySlidable(myMessage: peoples[index],);
      //  }),
      body:_buildUserList(),
     bottomNavigationBar:const BottomNavBar() ,
    );
     
  }

  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot> (
      stream:FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Text('Error occured');
        }

        if(snapshot.connectionState == ConnectionState.waiting){
          return const Text('Loading....');
        }

        return ListView(
          children: snapshot.data!.docs
          .map<Widget>((doc) => _buildUserListItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document){
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if(_auth.currentUser!.email != data['email']){
      return ListTile(
        title: Text(data['email'],
        style: TextStyle(color: Colors.white),) ,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder:(context) => ChatPage(
              receiverUserEmail: data['email'],
              receiverUserId: data['uid'],

            )
            ),);
        },
      );
    }else{
      return Container();
    }
  }
}