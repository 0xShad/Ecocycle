import '/flutter_flow/flutter_flow_util.dart';
import 'following_and_followers_widget.dart' show FollowingAndFollowersWidget;
import 'package:flutter/material.dart';

class FollowingAndFollowersModel
    extends FlutterFlowModel<FollowingAndFollowersWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
