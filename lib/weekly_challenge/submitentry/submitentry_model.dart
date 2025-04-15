import '/flutter_flow/flutter_flow_util.dart';
import 'submitentry_widget.dart' show SubmitentryWidget;
import 'package:flutter/material.dart';

class SubmitentryModel extends FlutterFlowModel<SubmitentryWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
