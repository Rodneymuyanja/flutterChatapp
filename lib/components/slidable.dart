import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:badges/badges.dart' as badges;

import '../classes/message.dart';


class MySlidable extends StatefulWidget {

  final Message myMessage;

  const MySlidable({super.key, required this.myMessage});

  @override
  State<MySlidable> createState() => _MySlidableState();
}

class _MySlidableState extends State<MySlidable> {

  bool loveMessage = false;
  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 75,
         child: Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(), 
            children: [
              SlidableAction(onPressed: (context){

              },
              icon: Icons.mark_chat_read_sharp,
              backgroundColor: Colors.green,
              ),
               SlidableAction(onPressed: (context){

              },
              icon: Icons.phone,
              backgroundColor: Colors.blue,
              )
            ]
            ),

            endActionPane: ActionPane(
            motion: const StretchMotion(), 
            children: [
              SlidableAction(onPressed: (context){

              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
              ),
               SlidableAction(onPressed: (context){

              },
              icon: Icons.archive_outlined,
              backgroundColor: Colors.yellow,
              )
            ]
            ),
          child: Container(
            color: Colors.black,
            child:  Column(
              children: [
                ListTile(
                    title: Text(widget.myMessage.senderId.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                    subtitle: Flexible(
                      child: Text(messagefactory(widget.myMessage.mymessage),
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ), 
                    ),
                    leading:icon(),
                    
                    trailing: trail(widget.myMessage.time, widget.myMessage.isRead, widget.myMessage.mymessage),
                    splashColor: Colors.blue,
                    onTap: (){},
                  ),
                 Divider(
                  height: 1,color: Colors.grey[800],
                  indent: 89,
                )
              ],
            ),
            ),
          ),
        );
  
  
  }

  Widget trail (Timestamp time, bool read, String message){
    snitch(message);
    return SizedBox(
      width:60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          read ? 
          
          
          Text(time.toString(),
          style:  TextStyle(color:loveMessage? Colors.red:Colors.blue),
          ):
           Text(time.toString(),
          style:  TextStyle(color: Colors.grey[700]),
          ),
          //const SizedBox(width:),
          read ? 
          normalOrLove(): 
          const SizedBox(width:2)
        ],
      ),
    );
  }

  String messagefactory(String message){
    String result = message;
    if(message.length >= 45 ){
      result = '${message.substring(0, 45)}...';
      return result;
    }else{
      return result;
    }
  }

  void snitch(String message){
    bool lovelyMessage = false;
    List<String> nice = [
      'love',
      'miss'
    ];

    for (var str in nice) {
      if(message.contains(str)){
        lovelyMessage = true;
      }
    }

    setState(() {
      loveMessage = lovelyMessage;
    });
  }

  Widget normalOrLove(){
    if(loveMessage){
      return const Icon(Icons.favorite,
          size: 20,
          color:Colors.red
          );
    }else{
     return const badges.Badge(
      badgeContent: Text('16',
      style: TextStyle(color: Colors.white),
      ),
      badgeStyle: badges.BadgeStyle(
        badgeColor: Colors.blue,
      ),
      badgeAnimation: badges.BadgeAnimation.rotation(
        colorChangeAnimationCurve:Curves.bounceInOut,
        loopAnimation: false,
        animationDuration: Duration(seconds:1)
      ),
     );
    }
  }

  Widget icon(){
    return RawMaterialButton(
      onPressed: (){},
      fillColor: Colors.white,
      shape: const CircleBorder(),
      padding:const EdgeInsets.all(9),
      elevation: 0,
      constraints: const BoxConstraints(
        maxWidth: 70
      ),
      // child: const Icon(
      //   Icons.person,
      //   size: 40,
      // ),
     child :ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
            'lib/images/miles.webp',
            height: 400.0,
            width: 450.0,
        ),
      )
    );
  }
}