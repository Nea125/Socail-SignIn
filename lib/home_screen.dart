

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_sigin/drawer.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
       
      ),
      drawer: const  AppDrawer(),
      body:  Container( 
        alignment: Alignment.center,
        width:double.infinity,height: 
        double.infinity,color: Colors.amberAccent, child: const  Text("HOME SCREEN",style: TextStyle(fontSize: 20),)),
    );
  }
}
