import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'view_item_widget.dart' show ViewItemWidget;
import 'package:flutter/material.dart';

class ViewItemModel extends FlutterFlowModel<ViewItemWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatRecord? chatRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
