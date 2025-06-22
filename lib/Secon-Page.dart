import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: must_be_immutable
class SeconPage extends StatelessWidget {
  final String RunSocial;
   const SeconPage({super.key, required this.RunSocial,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            launchUrl(Uri.parse(RunSocial));
          },
          child: Text("start social media icon "),
          
        ),
      ),
    );
  }
}
