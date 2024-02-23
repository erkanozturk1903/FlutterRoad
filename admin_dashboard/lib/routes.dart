import 'package:admin_dashboard/helpers/services/auth_service.dart';
import 'package:admin_dashboard/views/apps/ecommerce/add_product.dart';
import 'package:admin_dashboard/views/apps/ecommerce/customers.dart';
import 'package:admin_dashboard/views/apps/ecommerce/products.dart';
import 'package:admin_dashboard/views/apps/jobs/job_vacancee_page.dart';
import 'package:admin_dashboard/views/apps/music/music_screen.dart';
import 'package:admin_dashboard/views/apps/nft/dashboard_page.dart';
import 'package:admin_dashboard/views/auth/forgot_password.dart';
import 'package:admin_dashboard/views/auth/locked.dart';
import 'package:admin_dashboard/views/auth/login.dart';
import 'package:admin_dashboard/views/auth/register.dart';
import 'package:admin_dashboard/views/auth/reset_password.dart';
import 'package:admin_dashboard/views/dashboard.dart';
import 'package:admin_dashboard/views/faqs_page.dart';
import 'package:admin_dashboard/views/forms/basic.dart';
import 'package:admin_dashboard/views/forms/form_mask.dart';
import 'package:admin_dashboard/views/forms/validation.dart';
import 'package:admin_dashboard/views/forms/wizard.dart';
import 'package:admin_dashboard/views/other/basic_table.dart';
import 'package:admin_dashboard/views/other/fl_chart_screen.dart';
import 'package:admin_dashboard/views/other/google_map.dart';
import 'package:admin_dashboard/views/other/syncfusion_charts.dart';
import 'package:admin_dashboard/views/starter.dart';
import 'package:admin_dashboard/views/pages/coming_soon_page.dart';
import 'package:admin_dashboard/views/pages/error_404_cover.dart';
import 'package:admin_dashboard/views/pages/error_offline_page.dart';
import 'package:admin_dashboard/views/apps/jobs/job_candidates_page.dart';
import 'package:admin_dashboard/views/landing_page.dart';
import 'package:admin_dashboard/views/ui/buttons.dart';
import 'package:admin_dashboard/views/ui/cards.dart';
import 'package:admin_dashboard/views/ui/carousels.dart';
import 'package:admin_dashboard/views/ui/dialogs.dart';
import 'package:admin_dashboard/views/apps/jobs/discover_page.dart';
import 'package:admin_dashboard/views/ui/drag_drop.dart';
import 'package:admin_dashboard/views/apps/files/file_manager_page.dart';
import 'package:admin_dashboard/views/apps/files/file_upload_page.dart';
import 'package:admin_dashboard/views/apps/ecommerce/invoice_page.dart';
import 'package:admin_dashboard/views/other/leaflet_page.dart';
import 'package:admin_dashboard/views/forms/html_editor_page.dart';
import 'package:admin_dashboard/views/pages/maintenance%20_page.dart';

import 'package:admin_dashboard/views/ui/notifications.dart';
import 'package:admin_dashboard/views/apps/ecommerce/product_detail.dart';
import 'package:admin_dashboard/views/pages/profile_page.dart';
import 'package:admin_dashboard/views/apps/ecommerce/reviews_page.dart';
import 'package:admin_dashboard/views/pages/success_page.dart';
import 'package:admin_dashboard/views/ui/tabs.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/views/other/pricing_page.dart';
import 'package:get/get.dart';

import 'package:admin_dashboard/views/pages/error_404_basic_page.dart';
import 'package:admin_dashboard/views/pages/error_404_alt_page.dart';
import 'package:admin_dashboard/views/pages/error_500_page.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthService.isLoggedIn ? null : RouteSettings(name: '/auth/login');
  }
}

getPageRoute() {
  var routes = [
    GetPage(
        name: '/',
        page: () => DashboardPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/dashboard',
        page: () => DashboardPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/starter',
        page: () => StarterPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(name: '/faqs', page: () => FAQsPage()),
    GetPage(name: '/auth/login', page: () => LoginPage()),
    GetPage(
        name: '/auth/forgot_password',
        page: () => ForgotPasswordPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/auth/reset_password',
        page: () => ResetPasswordPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/auth/register',
        page: () => RegisterPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/pricing',
        page: () => PricingPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/auth/locked',
        page: () => LockedPage(),
        middlewares: [AuthMiddleware()]),

    ///========== Apps =================///
    GetPage(
        name: '/apps/ecommerce/products',
        page: () => EcommerceProductsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/add_product',
        page: () => AddProductPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/customers',
        page: () => CustomersPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/product-detail',
        page: () => ProductDetailPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/product-reviews',
        page: () => ReviewsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/ecommerce/invoice',
        page: () => InvoicePage(),
        middlewares: [AuthMiddleware()]),

    ///TODO
    // GetPage(
    //     name: '/chats',
    //     page: () => ChatsPage(),
    //     middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/files',
        page: () => FileManagerPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/files/upload',
        page: () => FileUploadPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/apps/jobs/discover',
        page: () => JobDiscoverPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/jobs/candidates',
        page: () => JobCandidatePage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/apps/jobs/vacancies',
        page: () => JobVacanciesPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/nft/dashboard',
        page: () => NFTDashboardPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/apps/music',
        page: () => MusicScreen(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/landing',
        page: () => LandingPage(),
        middlewares: [AuthMiddleware()]),

    ///========== UI =================///

    GetPage(
        name: '/ui/buttons',
        page: () => ButtonsPage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/ui/cards',
        page: () => CardsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/tabs',
        page: () => TabsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/dialogs',
        page: () => DialogsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/carousels',
        page: () => CarouselsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/drag_drop',
        page: () => DragDropPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/ui/notifications',
        page: () => NotificationsPage(),
        middlewares: [AuthMiddleware()]),

    ///========== Forms =================///

    GetPage(
        name: '/forms/basic',
        page: () => BasicFormsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/forms/validation',
        page: () => ValidationFormsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/forms/html_editor',
        page: () => HtmlEditorPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/forms/wizard',
        page: () => WizardPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/forms/masks',
        page: () => FormMaskPage(),
        middlewares: [AuthMiddleware()]),

    ///========== Others =================///

    GetPage(
        name: '/other/basic_tables',
        page: () => BasicTablesPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/other/syncfusion_charts',
        page: () => SyncfusionChartsPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/other/fl_chart',
        page: () => FlChartScreen(),
        middlewares: [AuthMiddleware()]),

    ///========== Maps =================///

    GetPage(
        name: '/maps/google_maps',
        page: () => GoogleMapPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/maps/leaflet',
        page: () => LeafletPage(),
        middlewares: [AuthMiddleware()]),

    ///========== Pages =================///
    ///
    GetPage(
        name: '/pages/profile',
        page: () => ProfilePage(),
        middlewares: [AuthMiddleware()]),

    GetPage(
        name: '/pages/success',
        page: () => SuccessPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/pages/coming-soon',
        page: () => ComingSoon(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/pages/error-404',
        page: () => Error404BasicPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/pages/error-404-alt',
        page: () => Error404AltPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/pages/error-404-cover',
        page: () => Error404CoverPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/pages/error-500',
        page: () => Error500Page(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/pages/offline',
        page: () => ErrorOfflinePage(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: '/pages/maintenance',
        page: () => MaintenancePage(),
        middlewares: [AuthMiddleware()]),
  ];

  return routes
      .map((e) => GetPage(
          name: e.name,
          page: e.page,
          middlewares: e.middlewares,
          transition: Transition.noTransition))
      .toList();
}
