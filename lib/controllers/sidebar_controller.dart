
import 'package:coffeshop/pages/dashboard/dashboard_page.dart';
import 'package:coffeshop/pages/marketplace/marketplace.dart';
import 'package:coffeshop/pages/stock/stock_page.dart';
import 'package:coffeshop/pages/transaksi/transaksi_page.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  RxInt index = 0.obs;

  var page = [
    DashboardPage(),
    StockPage(),
    TransaksiPage(),
    MarketplacePage()


  ];
}
