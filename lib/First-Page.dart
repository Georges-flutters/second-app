import 'package:flutter/material.dart';
import 'package:flutter_application/provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // ignore: non_constant_identifier_names
  String? platForm;
  String? url;
  Map<String, String> SocialMedia = {
    "assets/facebook.png": "https://www.facebook.com/",
    "assets/youtube.png": "https://youtu.be/Zg55uwAFonw?si=Y1WQkOfSb26oQV1l",
    "assets/whatsapp.png": "https://wa.me/+20123614354",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: Icon(Icons.home, size: 50),
        actions: [
          platForm == null
              ? IconButton(
                iconSize: 35,
                onPressed: () {
                  launchUrl(Uri.parse('tel:+201203614354'));
                },
                icon: Icon(Icons.phone),
              )
              : InkWell(
                child: Selector<Providers,String>(
                  selector: (p0, p1) => p1.url!,
                  builder: (BuildContext context, String value, Widget? child) =>
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(platForm!),
                      radius: 27,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                onTap: () => launchUrl(Uri.parse(url!)),
              ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Selector<Providers,String>(
        selector: (p0, p1) => p1.platform!,
        builder: (context, value, child) => 
         SizedBox(
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
                      value = "jojo";
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder:
                      //         (context) => SeconPage(
                      //           RunSocial:
                      //               SocialMedia.values.toList()[index].toString(),
                      //         ),
                      //   ),
                      // );
                      // showModalBottomSheet(
                      //   context: context,
                      //   isScrollControlled: true,
                      //   builder:
                      //       (context) => SizedBox(
                      //         height:
                      //             MediaQuery.of(context).size.height *
                      //             0.10, // 75%
                      //         child: ElevatedButton(
                      //           style: ButtonStyle(
                      //             backgroundColor: WidgetStateProperty.all(
                      //               Colors.deepOrange,
                      //             ),
                      //           ),
                      //           onPressed: () {
                      //             launchUrl(
                      //               Uri.parse(SocialMedia.values.toList()[index]),
                      //             );
                      //           },
                      //           child: Text(
                      //             "start social media icon ",
                      //             style: TextStyle(color: Colors.black),
                      //           ),
                      //         ),
                      //       ),
                      // );
                      value == "jojo"
                          ? launchUrl(
                            Uri.parse(SocialMedia.values.toList()[index]),
                          )
                          : launchUrl(Uri.parse("tel:+201203614354"));
                      platForm =
                          SocialMedia.keys.toList()[index].toString();
                      url = SocialMedia.values.toList()[index].toString();
                    },
                  );
                },
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
