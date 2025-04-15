import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for currpassword widget.
  FocusNode? currpasswordFocusNode;
  TextEditingController? currpasswordTextController;
  late bool currpasswordVisibility;
  String? Function(BuildContext, String?)? currpasswordTextControllerValidator;
  String? _currpasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for newpassword widget.
  FocusNode? newpasswordFocusNode;
  TextEditingController? newpasswordTextController;
  late bool newpasswordVisibility;
  String? Function(BuildContext, String?)? newpasswordTextControllerValidator;
  String? _newpasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for newpassword2 widget.
  FocusNode? newpassword2FocusNode;
  TextEditingController? newpassword2TextController;
  late bool newpassword2Visibility;
  String? Function(BuildContext, String?)? newpassword2TextControllerValidator;
  String? _newpassword2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? changePasswordResult;

  @override
  void initState(BuildContext context) {
    currpasswordVisibility = false;
    currpasswordTextControllerValidator = _currpasswordTextControllerValidator;
    newpasswordVisibility = false;
    newpasswordTextControllerValidator = _newpasswordTextControllerValidator;
    newpassword2Visibility = false;
    newpassword2TextControllerValidator = _newpassword2TextControllerValidator;
  }

  @override
  void dispose() {
    currpasswordFocusNode?.dispose();
    currpasswordTextController?.dispose();

    newpasswordFocusNode?.dispose();
    newpasswordTextController?.dispose();

    newpassword2FocusNode?.dispose();
    newpassword2TextController?.dispose();
  }
}
