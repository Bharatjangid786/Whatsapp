import 'package:flutter/material.dart';

class CallHistoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121B22),
      body: ListView.builder(
        itemCount: 20, 
        itemBuilder: (context, index) {
          return CallHistoryItem(
            contactName: 'Contact Name $index',
            callType: index % 2 == 0
                ? 'Incoming'
                : 'Outgoing',
            callTime: 'Time $index',
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A884),
        onPressed: () {
        },
        child: const Icon(Icons.add_call),
      ),
    );
  }
}

class CallHistoryItem extends StatelessWidget {
  final String contactName;
  final String callType;
  final String callTime;

  CallHistoryItem({
    required this.contactName,
    required this.callType,
    required this.callTime,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
        backgroundColor: Colors.grey,
      ),
      title: Text(contactName, style: const TextStyle(color: Colors.white)),
      subtitle: Text('$callType call - $callTime',
          style: const TextStyle(color: Color.fromARGB(255, 125, 125, 125))),
      trailing: const Icon(
        Icons.call,
        color: Color(0xFF25D366),
      ),
      onTap: () {
      },
    );
  }
}
