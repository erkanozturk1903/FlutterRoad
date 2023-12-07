// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/screens/ajanda/ajanda.dart';
import 'package:admin_dashboard/ui/screens/dokuman/dokuman.dart';
import 'package:admin_dashboard/ui/screens/firma/firma.dart';
import 'package:admin_dashboard/ui/screens/insan_kaynaklari/insan_kaynaklari.dart';
import 'package:admin_dashboard/ui/screens/is_guvenligi/is_guvenligi.dart';
import 'package:admin_dashboard/ui/screens/is_sagligi/is_sagligi.dart';
import 'package:admin_dashboard/ui/screens/kullanici/kullanici.dart';
import 'package:admin_dashboard/ui/screens/mail/mail.dart';
import 'package:admin_dashboard/ui/views/dasboard_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });

  static Handler users = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return KullaniciScreen();
    else
      return LoginView();
  });
  static Handler company = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return FirmaScreen();
    else
      return LoginView();
  });
  static Handler humanresources = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return InsanKaynaklariScreen();
    else
      return LoginView();
  });
  static Handler worksafety = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return IsGuvenligiScreen();
    else
      return LoginView();
  });
  static Handler workhealth = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return IsSagligiScreen();
    else
      return LoginView();
  });
  static Handler documents = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return DokumanScreen();
    else
      return LoginView();
  });
  static Handler mail = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return MailScreen();
    else
      return LoginView();
  });
  static Handler events = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return AjandaScreen();
    else
      return LoginView();
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return AjandaScreen();
    else
      return LoginView();
  });
}
