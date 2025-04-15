import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'other_user_profile_widget.dart' show OtherUserProfileWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OtherUserProfileModel extends FlutterFlowModel<OtherUserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
