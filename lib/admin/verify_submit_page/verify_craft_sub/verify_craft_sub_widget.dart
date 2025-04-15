import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'verify_craft_sub_model.dart';
export 'verify_craft_sub_model.dart';

class VerifyCraftSubWidget extends StatefulWidget {
  const VerifyCraftSubWidget({super.key});

  static String routeName = 'VerifyCraftSub';
  static String routePath = '/verifyCraftSub';

  @override
  State<VerifyCraftSubWidget> createState() => _VerifyCraftSubWidgetState();
}

class _VerifyCraftSubWidgetState extends State<VerifyCraftSubWidget> {
  late VerifyCraftSubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyCraftSubModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: FlutterFlowTheme.of(context).secondary,
              size: 20.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<CraftSubmissionRecord>>(
                    stream: queryCraftSubmissionRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<CraftSubmissionRecord>
                          listViewCraftSubmissionRecordList = snapshot.data!;

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCraftSubmissionRecordList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 5.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewCraftSubmissionRecord =
                              listViewCraftSubmissionRecordList[listViewIndex];
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 12.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    VerifyCraftSubItemWidget.routeName,
                                    queryParameters: {
                                      'verifysubmit': serializeParam(
                                        listViewCraftSubmissionRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            () {
                                              if (listViewCraftSubmissionRecord
                                                          .thumbnailUploaded ==
                                                      '') {
                                                return listViewCraftSubmissionRecord
                                                    .thumbnail;
                                              } else if (listViewCraftSubmissionRecord
                                                          .thumbnailUploaded !=
                                                      '') {
                                                return listViewCraftSubmissionRecord
                                                    .thumbnailUploaded;
                                              } else {
                                                return '';
                                              }
                                            }(),
                                            width: 70.0,
                                            height: 70.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          width: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            listViewCraftSubmissionRecord.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Figtree',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    Container(
                                      width: 81.0,
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        valueOrDefault<String>(
                                          listViewCraftSubmissionRecord.status,
                                          'Pending',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: () {
                                                if (listViewCraftSubmissionRecord
                                                        .status ==
                                                    'Pending') {
                                                  return Color(0xFFFF8100);
                                                } else if (listViewCraftSubmissionRecord
                                                        .status ==
                                                    'Approved') {
                                                  return Color(0xFF00FF35);
                                                } else if (listViewCraftSubmissionRecord
                                                        .status ==
                                                    'Disapproved') {
                                                  return Color(0xFFFF0000);
                                                } else {
                                                  return Color(0x00000000);
                                                }
                                              }(),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
