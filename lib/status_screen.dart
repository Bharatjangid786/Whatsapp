import 'package:flutter/material.dart';

class StatusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121B22),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), 
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: Colors.grey,
                ),
                title: const Text("My Status",
                    style: TextStyle(color: Colors.white)),
                subtitle: const Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey, 
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Viewed ', 
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                },
              )),
          Divider(
            thickness: .2,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return StatusItem(
                  contactName: 'Contact Name $index',
                  statusTime: 'Time $index',
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A884),
        onPressed: () {
        },
        child: const Icon(Icons.photo_camera),
      ),
    );
  }
}

class StatusItem extends StatelessWidget {
  final String contactName;
  final String statusTime;

  StatusItem({
    required this.contactName,
    required this.statusTime,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
        backgroundColor: Colors.grey,
      ),
      title: Text(contactName, style: const TextStyle(color: Colors.white)),
      subtitle: Row(
        children: [
          const Icon(
            Icons.remove_red_eye,
            color: Colors.grey, 
            size: 16,
          ),
          const SizedBox(width: 4),
          Text(
            'Viewed $statusTime', 
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
      onTap: () {
      },
    );
  }
}
