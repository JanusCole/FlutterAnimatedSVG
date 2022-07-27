import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

_loadSVGFromAssets(InAppWebViewController _controller) async {
  String svg = await rootBundle.loadString('assets/images/svg_animation.svg');
  _controller.loadData(data: svg);
}
class AnimatedImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedImage();
}

class _AnimatedImage extends State<AnimatedImage> {
  late InAppWebViewController _inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              transparentBackground: true,
            )
        ),
        onWebViewCreated: (InAppWebViewController webViewController) {
          _inAppWebViewController = webViewController;
          _loadSVGFromAssets(_inAppWebViewController);
        }
    );
  }

}