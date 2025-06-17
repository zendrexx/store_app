import 'package:admin_web/views/side_bar_screens/buyers_screen.dart';
import 'package:admin_web/views/side_bar_screens/categories_screen.dart';
import 'package:admin_web/views/side_bar_screens/orders_screen.dart';
import 'package:admin_web/views/side_bar_screens/products_screen.dart';
import 'package:admin_web/views/side_bar_screens/upload_screen.dart';
import 'package:admin_web/views/side_bar_screens/vendors_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = VendorsScreen();

  screenSelector(routeName) {
    switch (routeName.route) {
      case VendorsScreen.routeName:
        setState(() {
          _selectedScreen = const VendorsScreen();
        });
        break;
      case BuyersScreen.routeName:
        setState(() {
          _selectedScreen = const BuyersScreen();
        });
        break;
      case OrdersScreen.routeName:
        setState(() {
          _selectedScreen = const OrdersScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedScreen = const CategoriesScreen();
        });
        break;
      case UploadScreen.routeName:
        setState(() {
          _selectedScreen = const UploadScreen();
        });
        break;
      case ProductsScreen.routeName:
        setState(() {
          _selectedScreen = const ProductsScreen();
        });
        break;
      default:
        _selectedScreen = const VendorsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Management")),
      body: _selectedScreen,
      sideBar: SideBar(
        header: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child: Center(
            child: Text(
              "Zen Store",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.7,
                color: Colors.white,
              ),
            ),
          ),
        ),
        items: const [
          AdminMenuItem(
            title: 'Vendors',
            route: VendorsScreen.routeName,
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Buyers',
            route: BuyersScreen.routeName,
            icon: CupertinoIcons.person,
          ),
          AdminMenuItem(
            title: 'Orders',
            route: OrdersScreen.routeName,
            icon: CupertinoIcons.shopping_cart,
          ),
          AdminMenuItem(
            title: 'Categories',
            route: CategoriesScreen.routeName,
            icon: Icons.category,
          ),
          AdminMenuItem(
            title: 'Upload Banner',
            route: UploadScreen.routeName,
            icon: Icons.add,
          ),
          AdminMenuItem(
            title: 'Product',
            route: ProductsScreen.routeName,
            icon: Icons.store,
          ),
        ],
        selectedRoute: VendorsScreen.routeName,
        onSelected: (item) => screenSelector(item),
      ),
    );
  }
}
