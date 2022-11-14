import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("Home Page"),
             SizedBox(height: 20,),
             Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: TextStyle(fontSize: 25),
             ),
             SizedBox(height: 10,),
             Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: TextStyle(fontSize: 25),
             ),
             SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              AuthServices().SignOut();
            }, child: Text("Log Out"))
          ],
        )
      ),
    );
  }
}