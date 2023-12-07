import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';

  //Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';
  static String kullaniciRoute = '/screen/user';
  static String firmaRoute = '/screen/company';
  static String insankaynaklariRoute = '/screen/humanresources';
  static String isguvenligiRoute = '/screen/worksafety';
  static String issagligiRoute = '/screen/workhealth';
  static String dokumanRoute = '/screen/documents';
  static String mailRoute = '/screen/mail';
  static String ajandaRoute = '/screen/events';
  static String blankRoute = '/screen/blank';

  static void configureRoutes() {
    //auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    //Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(kullaniciRoute,
        handler: DashboardHandlers.users,
        transitionType: TransitionType.fadeIn);
    router.define(firmaRoute,
        handler: DashboardHandlers.company,
        transitionType: TransitionType.fadeIn);

    router.define(insankaynaklariRoute,
        handler: DashboardHandlers.humanresources,
        transitionType: TransitionType.fadeIn);
    router.define(isguvenligiRoute,
        handler: DashboardHandlers.worksafety,
        transitionType: TransitionType.fadeIn);
    router.define(issagligiRoute,
        handler: DashboardHandlers.workhealth,
        transitionType: TransitionType.fadeIn);
    router.define(dokumanRoute,
        handler: DashboardHandlers.documents,
        transitionType: TransitionType.fadeIn);
    router.define(mailRoute,
        handler: DashboardHandlers.mail, transitionType: TransitionType.fadeIn);
    router.define(ajandaRoute,
        handler: DashboardHandlers.events,
        transitionType: TransitionType.fadeIn);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
