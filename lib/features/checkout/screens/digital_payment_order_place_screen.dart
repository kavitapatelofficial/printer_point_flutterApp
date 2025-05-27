import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/main.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/animated_custom_dialog_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/checkout/widgets/order_place_dialog_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/dashboard/screens/dashboard_screen.dart';

class DigitalPaymentScreen extends StatefulWidget {
  final String url;
  final bool fromWallet;
  
  const DigitalPaymentScreen({super.key, required this.url, this.fromWallet = false});

  @override
  DigitalPaymentScreenState createState() => DigitalPaymentScreenState();
}

class DigitalPaymentScreenState extends State<DigitalPaymentScreen> {
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() => _isLoading = true);
          },
          onPageFinished: (String url) {
            setState(() => _isLoading = false);
            _handlePageRedirect(url);
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("WebView Error: ${error.description}");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  void _handlePageRedirect(String url) {
    bool isSuccess = url.contains('success') && url.contains(AppConstants.baseUrl);
    bool isFailed = url.contains('fail') && url.contains(AppConstants.baseUrl);
    bool isCancel = url.contains('cancel') && url.contains(AppConstants.baseUrl);

    if (isSuccess || isFailed || isCancel) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const DashBoardScreen()), 
        (route) => false,
      );

      showAnimatedDialog(
        context,
        OrderPlaceDialogWidget(
          icon: isSuccess ? Icons.done : Icons.clear,
          title: getTranslated(
            isSuccess ? 'order_placed' : isFailed ? 'payment_failed' : 'payment_cancelled', 
            context
          ),
          description: getTranslated(
            isSuccess ? 'your_order_placed' : isFailed ? 'your_payment_failed' : 'your_payment_cancelled', 
            context
          ),
          isFailed: !isSuccess,
        ),
        dismissible: false,
        willFlip: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => _exitApp(context),
      child: Scaffold(
        appBar: AppBar(title: const Text(''), backgroundColor: Theme.of(context).cardColor),
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _exitApp(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      Navigator.of(Get.context!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const DashBoardScreen()), 
        (route) => false,
      );

      showAnimatedDialog(
        Get.context!,
        OrderPlaceDialogWidget(
          icon: Icons.clear,
          title: getTranslated('payment_cancelled', Get.context!),
          description: getTranslated('your_payment_cancelled', Get.context!),
          isFailed: true,
        ),
        dismissible: false,
        willFlip: true,
      );
    });
  }
}
