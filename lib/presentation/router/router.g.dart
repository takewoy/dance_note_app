// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homePageRoute,
    ];

GoRoute get $homePageRoute => GoRouteData.$route(
      path: '/',
      factory: $HomePageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'search',
          factory: $SearchPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'setting',
          factory: $SettingPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'edit-form/:id',
          factory: $EditFormRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'not-found',
          factory: $NotFoundPageRouteExtension._fromState,
        ),
      ],
    );

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SearchPageRouteExtension on SearchPageRoute {
  static SearchPageRoute _fromState(GoRouterState state) =>
      const SearchPageRoute();

  String get location => GoRouteData.$location(
        '/search',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SettingPageRouteExtension on SettingPageRoute {
  static SettingPageRoute _fromState(GoRouterState state) =>
      const SettingPageRoute();

  String get location => GoRouteData.$location(
        '/setting',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EditFormRouteExtension on EditFormRoute {
  static EditFormRoute _fromState(GoRouterState state) => EditFormRoute(
        id: state.params['id']!,
      );

  String get location => GoRouteData.$location(
        '/edit-form/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $NotFoundPageRouteExtension on NotFoundPageRoute {
  static NotFoundPageRoute _fromState(GoRouterState state) =>
      const NotFoundPageRoute();

  String get location => GoRouteData.$location(
        '/not-found',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
