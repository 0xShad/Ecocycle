import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : OnBoardingMainWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : OnBoardingMainWidget(),
        ),
        FFRoute(
          name: SignInPageWidget.routeName,
          path: SignInPageWidget.routePath,
          builder: (context, params) => SignInPageWidget(),
        ),
        FFRoute(
          name: SignUpPageWidget.routeName,
          path: SignUpPageWidget.routePath,
          builder: (context, params) => SignUpPageWidget(),
        ),
        FFRoute(
          name: OnBoardingMainWidget.routeName,
          path: OnBoardingMainWidget.routePath,
          builder: (context, params) => OnBoardingMainWidget(),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ProfilePage')
              : ProfilePageWidget(),
        ),
        FFRoute(
          name: ForumPageWidget.routeName,
          path: ForumPageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ForumPage')
              : ForumPageWidget(),
        ),
        FFRoute(
          name: WatchTutPageWidget.routeName,
          path: WatchTutPageWidget.routePath,
          builder: (context, params) => WatchTutPageWidget(
            receiveItem: params.getParam(
              'receiveItem',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['videos'],
            ),
          ),
        ),
        FFRoute(
          name: MarketplaceWidget.routeName,
          path: MarketplaceWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Marketplace')
              : MarketplaceWidget(),
        ),
        FFRoute(
          name: WeeklyChallengeInfoWidget.routeName,
          path: WeeklyChallengeInfoWidget.routePath,
          builder: (context, params) => WeeklyChallengeInfoWidget(),
        ),
        FFRoute(
          name: WeeklyWinnerWidget.routeName,
          path: WeeklyWinnerWidget.routePath,
          builder: (context, params) => WeeklyWinnerWidget(),
        ),
        FFRoute(
          name: MarketProductDetailsWidget.routeName,
          path: MarketProductDetailsWidget.routePath,
          builder: (context, params) => MarketProductDetailsWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'HomePage')
              : HomePageWidget(),
        ),
        FFRoute(
          name: SeeAllPageWidget.routeName,
          path: SeeAllPageWidget.routePath,
          builder: (context, params) => SeeAllPageWidget(),
        ),
        FFRoute(
          name: CommentPostWidget.routeName,
          path: CommentPostWidget.routePath,
          builder: (context, params) => CommentPostWidget(
            docref: params.getParam(
              'docref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['posts'],
            ),
            userref: params.getParam(
              'userref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: UserLIkePageWidget.routeName,
          path: UserLIkePageWidget.routePath,
          asyncParams: {
            'likesref': getDoc(['posts'], PostsRecord.fromSnapshot),
          },
          builder: (context, params) => UserLIkePageWidget(
            likesref: params.getParam(
              'likesref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: ChangePasswordWidget.routeName,
          path: ChangePasswordWidget.routePath,
          builder: (context, params) => ChangePasswordWidget(),
        ),
        FFRoute(
          name: OtherUserProfileWidget.routeName,
          path: OtherUserProfileWidget.routePath,
          builder: (context, params) => OtherUserProfileWidget(
            profileParam: params.getParam(
              'profileParam',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: EditWorksWidget.routeName,
          path: EditWorksWidget.routePath,
          builder: (context, params) => EditWorksWidget(),
        ),
        FFRoute(
          name: UserSearchWidget.routeName,
          path: UserSearchWidget.routePath,
          builder: (context, params) => UserSearchWidget(),
        ),
        FFRoute(
          name: BlockUserPageWidget.routeName,
          path: BlockUserPageWidget.routePath,
          builder: (context, params) => BlockUserPageWidget(),
        ),
        FFRoute(
          name: FollowingAndFollowersWidget.routeName,
          path: FollowingAndFollowersWidget.routePath,
          builder: (context, params) => FollowingAndFollowersWidget(),
        ),
        FFRoute(
          name: SubmitCraftWidget.routeName,
          path: SubmitCraftWidget.routePath,
          builder: (context, params) => SubmitCraftWidget(),
        ),
        FFRoute(
          name: SavedVideosPageWidget.routeName,
          path: SavedVideosPageWidget.routePath,
          builder: (context, params) => SavedVideosPageWidget(),
        ),
        FFRoute(
          name: SubmittedCraftsWidget.routeName,
          path: SubmittedCraftsWidget.routePath,
          builder: (context, params) => SubmittedCraftsWidget(),
        ),
        FFRoute(
          name: WatchFeaturedTutorialWidget.routeName,
          path: WatchFeaturedTutorialWidget.routePath,
          builder: (context, params) => WatchFeaturedTutorialWidget(
            featureditem: params.getParam(
              'featureditem',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['CraftSubmission'],
            ),
          ),
        ),
        FFRoute(
          name: AdminPanelWidget.routeName,
          path: AdminPanelWidget.routePath,
          builder: (context, params) => AdminPanelWidget(),
        ),
        FFRoute(
          name: VerifyCraftSubWidget.routeName,
          path: VerifyCraftSubWidget.routePath,
          builder: (context, params) => VerifyCraftSubWidget(),
        ),
        FFRoute(
          name: VerifyCraftSubItemWidget.routeName,
          path: VerifyCraftSubItemWidget.routePath,
          builder: (context, params) => VerifyCraftSubItemWidget(
            verifysubmit: params.getParam(
              'verifysubmit',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['CraftSubmission'],
            ),
          ),
        ),
        FFRoute(
          name: UploadTutorialWidget.routeName,
          path: UploadTutorialWidget.routePath,
          builder: (context, params) => UploadTutorialWidget(),
        ),
        FFRoute(
          name: DeleteUPTutorialWidget.routeName,
          path: DeleteUPTutorialWidget.routePath,
          builder: (context, params) => DeleteUPTutorialWidget(),
        ),
        FFRoute(
          name: DeleteFeaturedItemWidget.routeName,
          path: DeleteFeaturedItemWidget.routePath,
          builder: (context, params) => DeleteFeaturedItemWidget(),
        ),
        FFRoute(
          name: ChallengeEntriesWidget.routeName,
          path: ChallengeEntriesWidget.routePath,
          builder: (context, params) => ChallengeEntriesWidget(
            challenge: params.getParam(
              'challenge',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['weekly_challenges'],
            ),
          ),
        ),
        FFRoute(
          name: AppointWinnerWidget.routeName,
          path: AppointWinnerWidget.routePath,
          builder: (context, params) => AppointWinnerWidget(),
        ),
        FFRoute(
          name: ListItemWidget.routeName,
          path: ListItemWidget.routePath,
          builder: (context, params) => ListItemWidget(),
        ),
        FFRoute(
          name: UserListedItemWidget.routeName,
          path: UserListedItemWidget.routePath,
          builder: (context, params) => UserListedItemWidget(),
        ),
        FFRoute(
          name: ListedItemListWidget.routeName,
          path: ListedItemListWidget.routePath,
          builder: (context, params) => ListedItemListWidget(),
        ),
        FFRoute(
          name: VerifyListedItemWidget.routeName,
          path: VerifyListedItemWidget.routePath,
          builder: (context, params) => VerifyListedItemWidget(
            verifyitem: params.getParam(
              'verifyitem',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['marketplace_listitem'],
            ),
          ),
        ),
        FFRoute(
          name: ViewItemWidget.routeName,
          path: ViewItemWidget.routePath,
          builder: (context, params) => ViewItemWidget(
            viewItem: params.getParam(
              'viewItem',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['marketplace_listitem'],
            ),
          ),
        ),
        FFRoute(
          name: MessageMainWidget.routeName,
          path: MessageMainWidget.routePath,
          builder: (context, params) => MessageMainWidget(),
        ),
        FFRoute(
          name: MessageUserWidget.routeName,
          path: MessageUserWidget.routePath,
          asyncParams: {
            'chatDocs': getDoc(['chat'], ChatRecord.fromSnapshot),
          },
          builder: (context, params) => MessageUserWidget(
            chatDocs: params.getParam(
              'chatDocs',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditListItemWidget.routeName,
          path: EditListItemWidget.routePath,
          builder: (context, params) => EditListItemWidget(
            itemRef: params.getParam(
              'itemRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['marketplace_listitem'],
            ),
          ),
        ),
        FFRoute(
          name: ForgotpasswordWidget.routeName,
          path: ForgotpasswordWidget.routePath,
          builder: (context, params) => ForgotpasswordWidget(),
        ),
        FFRoute(
          name: ForgotpasswordAuthWidget.routeName,
          path: ForgotpasswordAuthWidget.routePath,
          builder: (context, params) => ForgotpasswordAuthWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onBoardingMain';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primary,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Untitled_design-removebg-preview.png',
                      width: 200.0,
                      height: 300.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
