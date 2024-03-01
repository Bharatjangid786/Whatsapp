import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chat_screen.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121B22),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
              backgroundColor: Color.fromARGB(255, 160, 159, 159),
            ),
            title: Text('Contact Name $index',
                style: TextStyle(color: Colors.white)),
            subtitle: Text('Last message $index',
                style:
                    TextStyle(color: const Color.fromARGB(255, 125, 125, 125))),
            trailing: Text('Time $index',
                style:
                    TextStyle(color: const Color.fromARGB(255, 125, 125, 125))),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatMessages(),
                ),
              );

            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A884),
        onPressed: () {
       
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
