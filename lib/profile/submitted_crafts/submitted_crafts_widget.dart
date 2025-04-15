import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'submitted_crafts_model.dart';
export 'submitted_crafts_model.dart';

class SubmittedCraftsWidget extends StatefulWidget {
  const SubmittedCraftsWidget({super.key});

  static String routeName = 'SubmittedCrafts';
  static String routePath = '/submittedCrafts';

  @override
  State<SubmittedCraftsWidget> createState() => _SubmittedCraftsWidgetState();
}

class _SubmittedCraftsWidgetState extends State<SubmittedCraftsWidget> {
  late SubmittedCraftsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubmittedCraftsModel());
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
          title: Text(
            'Crafts submitted',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<CraftSubmissionRecord>>(
                    stream: queryCraftSubmissionRecord(
                      queryBuilder: (craftSubmissionRecord) =>
                          craftSubmissionRecord.where(
                        'submit_by',
                        isEqualTo: currentUserReference,
                      ),
                    ),
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

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewCraftSubmissionRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewCraftSubmissionRecord =
                              listViewCraftSubmissionRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 12.0, 8.0),
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
                                    Text(
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
