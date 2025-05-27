import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_sixvalley_ecommerce/features/wallet/controllers/wallet_controller.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';

import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/animated_custom_dialog_widget.dart';
import 'package:flutter_sixvalley_ecommerce/features/checkout/widgets/order_place_dialog_widget.dart';
import 'package:provider/provider.dart';

class AddFundToWalletScreen extends StatefulWidget {
  final String url;
  const AddFundToWalletScreen({super.key, required this.url});

  @override
  State<AddFundToWalletScreen> createState() => _AddFundToWalletScreenState();
}

class _AddFundToWalletScreenState extends State<AddFundToWalletScreen> {
  late WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          _handlePageRedirect(url);
        },
        onPageFinished: (String url) {
          setState(() {
            _isLoading = false;
          });
          _handlePageRedirect(url);
        },
        onWebResourceError: (WebResourceError error) {
          setState(() {
            _isLoading = false;
          });
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
  }

  void _handlePageRedirect(String url) {
    bool isSuccess = url.contains('success') && url.contains(AppConstants.baseUrl);
    bool isFailed = url.contains('fail') && url.contains(AppConstants.baseUrl);
    bool isCancel = url.contains('cancel') && url.contains(AppConstants.baseUrl);

    if (isSuccess || isFailed || isCancel) {
      Navigator.of(context).pop(true);

      if (isSuccess) {
        Provider.of<WalletController>(context, listen: false).getTransactionList(1, isUpdate: false);
        showAnimatedDialog(
          context,
          OrderPlaceDialogWidget(
            icon: Icons.done,
            title: getTranslated('fund_added_into_wallet', context),
            description: getTranslated('your_fund_successfully_added_to_your_wallet', context),
          ),
          dismissible: false,
          willFlip: true,
        );
      } else if (isFailed) {
        showAnimatedDialog(
          context,
          OrderPlaceDialogWidget(
            icon: Icons.clear,
            title: getTranslated('payment_failed', context),
            description: getTranslated('your_payment_failed', context),
            isFailed: true,
          ),
          dismissible: false,
          willFlip: true,
        );
      } else if (isCancel) {
        showAnimatedDialog(
          context,
          OrderPlaceDialogWidget(
            icon: Icons.clear,
            title: getTranslated('payment_cancelled', context),
            description: getTranslated('your_payment_cancelled', context),
            isFailed: true,
          ),
          dismissible: false,
          willFlip: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          _exitApp(context);
        }
      },
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
      Navigator.of(context).pop();

      showAnimatedDialog(
        context,
        OrderPlaceDialogWidget(
          icon: Icons.clear,
          title: getTranslated('payment_cancelled', context),
          description: getTranslated('your_payment_cancelled', context),
          isFailed: true,
        ),
        dismissible: false,
        willFlip: true,
      );
    });
  }
}
