// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipe_app/widgets/neo_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        MaterialButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: Text('ata'),
        ),
        Center(
          child: SizedBox(
            height: 150,
            width: 150,
            child: NeoContainer(
              child: Icon(
                Icons.apple,
                size: 80,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
