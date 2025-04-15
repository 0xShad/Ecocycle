import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_works_widget.dart' show EditWorksWidget;
import 'package:flutter/material.dart';

class EditWorksModel extends FlutterFlowModel<EditWorksWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
