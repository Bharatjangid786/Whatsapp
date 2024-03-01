import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:whatsapp_clone/call_history.dart';
import 'package:whatsapp_clone/chat_details.dart';
import 'package:whatsapp_clone/status_screen.dart';

void main() {
  runApp(WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF1F2C34),
      ),
      home: WhatsAppHomePage(),
    );
  }
}

class WhatsAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1F2C34),
          title: const Text(
            'WhatsApp',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.photo_camera,
                color: Colors.white,
              ),
              onPressed: () {
                openCamera(context);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            dividerColor: Color(0xFF121B22),
            labelColor: Color(0xFF00A884),
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              // SizedBox(
              //   width: 50,
              //   child: Tab(
              //     icon: Icon(Icons.groups),
              //   ),
              // ),
              SizedBox(
                width: 150,
                child: Tab(
                  text: 'CHATS',
                ),
              ),
              SizedBox(
                width: 150,
                child: Tab(
                  text: 'STATUS',
                ),
              ),
              SizedBox(
                width: 150,
                child: Tab(
                  text: 'CALLS',
                ),
              ),
            ],
          ),
        ),
        body: Container(
          color: const Color(0xFF121B22),
          child: TabBarView(
            children: [
              // Container(
              //   child: const Center(
              //     child: Text(
              //       "Community",
              //       style: TextStyle(fontSize: 30, color: Colors.white),
              //     ),
              //   ),
              // ),
              ChatScreen(),
              StatusList(),
              CallHistoryList()
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> openCamera(BuildContext context) async {
  final cameras = await availableCameras();
  final camera = cameras.first;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CameraScreen(camera: camera),
    ),
  );
}

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(_controller),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.camera),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
