import 'package:flutter/widgets.dart';
import 'package:shopping_cart/screens/cart/cart_screen.dart';
import 'package:shopping_cart/screens/complete_profile/complete_profile_screen.dart';
import 'package:shopping_cart/screens/details/details_screen.dart';
import 'package:shopping_cart/screens/forgot_password/forgot_password_screen.dart';
import 'package:shopping_cart/screens/home/home_screen.dart';
import 'package:shopping_cart/screens/login_success/login_success_screen.dart';
import 'package:shopping_cart/screens/otp/otp_screen.dart';
import 'package:shopping_cart/screens/profile/profile_screen.dart';
import 'package:shopping_cart/screens/sign_in/sign_in_screen.dart';
import 'package:shopping_cart/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/constants/constants.dart';
import 'package:shopping_cart/widgets/product_list.dart';
import 'shopping_cart_page.dart';
import 'package:shopping_cart/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:shopping_cart/add_to_stock.dart';

import 'package:shopping_cart/model/shopping.dart';
import 'package:shopping_cart/widgets/show_money.dart';
import 'package:shopping_cart/widgets/product_list.dart';
import 'package:shopping_cart/stocklevel.dart';
import 'package:shopping_cart/home/home_page.dart';

/////////////
import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  AddToStock.routeName: (context) => AddToStock(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
 // HomePage.routeName: (context) => HomePage(),

  //'/cart': (BuildContext context) => ShoppingCartPage()
};


