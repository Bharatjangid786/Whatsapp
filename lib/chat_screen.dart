import 'package:flutter/material.dart';
import 'package:whatsapp_clone/main.dart';

class ChatMessages extends StatefulWidget {
  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  final List<Message> messages = [
    Message(sender: 'Friend', text: 'Hi there!'),
    Message(sender: 'Me', text: 'Hey! How are you?'),
    Message(sender: 'Friend', text: 'I\'m good, thanks! What about you?'),
    Message(sender: 'Me', text: 'I\'m doing well too. Just busy with work.'),
    Message(
        sender: 'Friend',
        text: 'Understood. Let me know if you need any help.'),
    Message(sender: 'Me', text: 'Sure thing. Thanks!'),
  ];

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
        ),
        backgroundColor: const Color(0xFF1F2C34),
        title: const Text('Chat Screen', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.videocam,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () {
              openCamera(context);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.call,
              color: Colors.white,
            ),
            onPressed: () {
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 37, 37, 37),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message.sender == 'Me'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: message.sender == 'Me'
                            ? const Color(0xFF00A884)
                            : const Color.fromARGB(255, 103, 102, 102),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        message.text,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 37, 37, 37),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F2C34),
                      borderRadius: BorderRadius.circular(20),
                    
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: _textController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle:
                            const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none, 
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions),
                          color: Colors.white, 
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.attach_file),
                              onPressed: () {
                              },
                              color: Colors.white, 
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                openCamera(context);
                              },
                              color: Colors.white, 
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFF00A884),
                  ),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      setState(() {
                        messages.add(
                            Message(sender: 'Me', text: _textController.text));
                        _textController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}
