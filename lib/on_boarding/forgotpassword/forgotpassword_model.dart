import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgotpassword_widget.dart' show ForgotpasswordWidget;
import 'package:flutter/material.dart';

class ForgotpasswordModel extends FlutterFlowModel<ForgotpasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
