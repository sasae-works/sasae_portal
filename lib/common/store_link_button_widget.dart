import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget that displays download buttons for Google Play and the App Store.
class StoreLinkButtonWidget extends StatelessWidget {
  /// The URL to the project's page on the Google Play Store.
  final String googlePlayLink;

  /// The URL to the project's page on the Apple App Store.
  final String appStoreLink;

  const StoreLinkButtonWidget({
    super.key,
    required this.googlePlayLink,
    required this.appStoreLink,
  });

  @override
  Widget build(BuildContext context) {
    return _buildExternalLinks();
  }

  /// Builds a row of store link buttons centered in a Wrap.
  Widget _buildExternalLinks() {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 12,
        runSpacing: 12,
        children: [
          if (googlePlayLink.isNotEmpty)
            _StoreButton(
              assetPath: 'assets/googlePlay.png',
              url: googlePlayLink,
            ),
          if (appStoreLink.isNotEmpty)
            _StoreButton(
              assetPath: 'assets/appStore.png',
              url: appStoreLink,
            ),
        ],
      ),
    );
  }
}

/// A button that opens a store URL when tapped.
class _StoreButton extends StatelessWidget {
  const _StoreButton({required this.assetPath, required this.url});

  final String assetPath;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Image.asset(
        assetPath,
        width: 200, // カード内で収まりやすいサイズに調整
        height: 80,
        fit: BoxFit.contain,
      ),
    );
  }
}
