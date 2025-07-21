import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_202052/common/logic/logic.dart';
import 'package:game_202052/features/features.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/widgets.dart';
import '../../../core/core.dart';

class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  int _index = 0;

  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final iapConnection = InAppPurchase.instance;
  late List<PurchClassTotalCas> products;

  Future<void> _onPurchaseUpdate(
    List<PurchaseDetails> purchaseDetailsList,
  ) async {
    for (var purchaseDetails in purchaseDetailsList) {
      await _handlePurchase(purchaseDetails);
    }
  }

  Future<void> _handlePurchase(PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.pendingCompletePurchase) {
      await iapConnection.completePurchase(purchaseDetails);
      buy();
      setState(() {});
    }
  }

  void _updateStreamOnDone() {
    _subscription.cancel();
  }

  Future<void> loadPurchases() async {
    const Set<String> coins = {
      'com.example.game202052_first_purchase',
      'com.example.game202052_second_purchase',
      'com.example.game202052_third_purchase',
      'com.example.game202052_fourth_purchase',
    };
    final response = await iapConnection.queryProductDetails(coins);
    for (var element in response.notFoundIDs) {
      debugPrint('Purchase $element not found');
    }
    products =
        response.productDetails.map((e) => PurchClassTotalCas(e)).toList();
  }

  Future<void> buyLuckyAppsPurch(PurchClassTotalCas product) async {
    try {
      final iapConnectionFortune = InAppPurchase.instance;
      final newIAPpurchaseParam = PurchaseParam(
        productDetails: product.productDetails,
      );
      await iapConnectionFortune.buyConsumable(
        purchaseParam: newIAPpurchaseParam,
      );
    } catch (e) {
      debugPrint("ERROR: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    final purchaseUpdated = iapConnection.purchaseStream;
    _subscription = purchaseUpdated.listen(
      _onPurchaseUpdate,
      onDone: _updateStreamOnDone,
    );
    loadPurchases();
  }

  @override
  Widget build(BuildContext context) {
    final coin = coinsList[_index];
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFF1419), Color(0xFF360001)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: LeftSideHomeButton(),
                ),
              ),
              SizedBox(height: 21.h),
              Text("Coins", style: MyTextStyles.ma32_700),
              SizedBox(height: 27.h),
              Image.asset(
                'assets/png/state6.png',
                width: 183.r,
                height: 193.r,
                fit: BoxFit.fill,
              ),
              CoinsCounter(
                number: coin.quantity,
                increaseSum: _increaseSum,
                decreaseSum: _decreaseSum,
              ),
              SizedBox(height: 40.h),
              PriceButton(
                price: coin.price,
                onTap: () {
                  buyLuckyAppsPurch(products[_index]);
                },
              ),
              SizedBox(height: 15.h),
              Text(
                "Select the number of coins you want to purchase.\nDepending on the number of coins selected, the\npayment amount changes",
                textAlign: TextAlign.center,
                style: MyTextStyles.ma12_400.copyWith(
                  letterSpacing: -0.4,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buy() {
    context.read<ConfigurationProvider>().addBank(coinsList[_index].quantity);
  }

  void _increaseSum() {
    if (coinsList.length - 1 == _index) return;
    _index++;
    setState(() {});
  }

  void _decreaseSum() {
    if (_index == 0) return;
    _index--;
    setState(() {});
  }
}
