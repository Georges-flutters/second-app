import 'package:flutter/material.dart';
import 'package:flutter_application/Secon-Page.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  Map<String, String> SocialMedia = {
    "assets/facebook.png": "https://www.facebook.com/",
    "assets/youtube.png": "https://youtu.be/Zg55uwAFonw?si=Y1WQkOfSb26oQV1l",
    "assets/whatsapp.png": "https://wa.me/+20123614354",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              backgroundImage: AssetImage('assets/jojo.png'),
              radius: 110,
            ),
            Text(
              "Georges Michael",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "01203614354",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse('tel:+201203614354'));
                  },
                  icon: Icon(Icons.phone, size: 30, color: Colors.grey),
                ),
              ],
            ),
            GridView.builder(
              itemCount: 3,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        SocialMedia.keys.toList()[index],
                      ),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        
                        builder: (context) =>  SeconPage(RunSocial: SocialMedia.values.toList()[index].toString()),
                      ),
                    );
                  },
                );
              },
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
