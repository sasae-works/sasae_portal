import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget that displays download buttons for Google Play and the App Store.
class StoreLinkButtonWidget extends StatelessWidget {
  final String googlePlayLink;
  final String appStoreLink;

  const StoreLinkButtonWidget({super.key,
    required this.googlePlayLink,
  required this.appStoreLink,
  });

  @override
  Widget build(BuildContext context) {
    return  _buildExternalLinks();
  }

  Widget _buildExternalLinks() {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              final url = Uri.parse(googlePlayLink);
              launchUrl(url);
            }, // ストアリンク
            child: Image.asset("assets/googlePlay.png", width: 200, height: 60,fit: BoxFit.fill,)),
        SizedBox(width: 50,),
        GestureDetector(
            onTap: () {
              final url = Uri.parse(appStoreLink);
              launchUrl(url);
            }, // ストアリンク
            child: Image.asset("assets/appStore.png", width: 200, height: 60,fit: BoxFit.fill)),
      ],
    );
  }
}
