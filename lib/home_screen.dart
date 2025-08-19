import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_sigin/drawer.dart';
import 'package:social_sigin/river_pod/noti_pod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notiService = ref.read(notificationProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
      ),
      drawer: const AppDrawer(),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Home Screen",
            style: TextStyle(fontSize: 40),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("create Order Here");
          await notiService.sendPushNotification(
              orderId: "123456",
              ticketType: "NORMAL+VIP",
              ticket:
                  "https://media.istockphoto.com/id/1500283713/vector/cinema-ticket-on-white-background-movie-ticket-on-white-background.jpg?s=612x612&w=0&k=20&c=4J15lHFXyjEs6xBoagcZqq5GYHKk5sMwCJRP8pNM3Zg=");
        },
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: const Text("Push"),
        ),
      ),
    );
  }
}
