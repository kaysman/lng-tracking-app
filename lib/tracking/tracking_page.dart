import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';
import 'package:v2_tracking_page/layout.dart';
import 'package:v2_tracking_page/shared/colors.dart';
import 'package:v2_tracking_page/shared/components/button.dart';
import 'package:v2_tracking_page/shared/components/indicators.dart';
import 'package:v2_tracking_page/shared/icons.dart';
import 'package:v2_tracking_page/shared/spacings.dart';
import 'package:v2_tracking_page/shared/theming.dart';

class TrackingScreen extends StatefulWidget {
  static const String routeName = 'tracking';
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _trackingNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _trackingNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: LoginLayout(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Shipment Tracking",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Spacings.TINY_VERTICAL,
            Text("Track your order",
                style: Theme.of(context).textTheme.bodyText1),
            Spacings.LITTLE_BIG_VERTICAL,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 45,
                    color: const Color(0xff000000).withOpacity(0.1),
                  ),
                ],
              ),
              child: buildTrackNumberSection(),
            ),
            Spacings.LITTLE_BIG_VERTICAL,
            contactUs(),
            Spacings.LITTLE_BIG_VERTICAL,
            Container(
              width: .6.sw,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Color(0xffE0E0E0).withOpacity(.15),
                borderRadius: BorderRadius.circular(10),
              ),
              // TODO: SingleChild?
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildOrderPickHeader(context),
                  Spacings.NORMAL_VERTICAL,
                  buildTrackingNumber(context),
                  Spacings.NORMAL_VERTICAL,
                  buildEstimatedDate(context),
                  Spacings.NORMAL_VERTICAL,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SmallCircules(
                                          size: 20,
                                          color: kWhite,
                                          shadows: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              spreadRadius: 1,
                                              color: const Color(0xff000000)
                                                  .withOpacity(0.1),
                                            ),
                                          ],
                                          child: SmallCircules(
                                            color: kBlack,
                                            size: 10,
                                          ),
                                        ),
                                        Image.asset(
                                          AppIcons.arrow_down,
                                          color: kPrimaryColor,
                                          height: 90,
                                          width: 15,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    Spacings.SMALL_HORIZONTAL,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'From: Boots Shoe Co.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text('22 Boon Street'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallCircules(
                                      size: 20,
                                      color: kWhite,
                                      shadows: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          color: const Color(0xff000000)
                                              .withOpacity(0.1),
                                        ),
                                      ],
                                      child: SmallCircules(
                                        color: kPrimaryColor,
                                        size: 10,
                                      ),
                                    ),
                                    Spacings.SMALL_HORIZONTAL,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'To: Towishful Haker Chowdhury',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            '22 Boon Street',
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            'Delivery note: Please give message if u dont get package..',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  color: kPrimaryColor,
                                ),
                                label: Text(
                                  'Edit note',
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacings.NORMAL_VERTICAL,
                        Container(
                          child: Column(
                            children: [
                              Text('Item details'),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacings.NORMAL_VERTICAL,
                  Container(
                    padding: const EdgeInsets.all(30),
                    color: Colors.white,
                    child: Timeline.tileBuilder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      builder: TimelineTileBuilder.connected(
                        connectionDirection: ConnectionDirection.before,
                        indicatorBuilder: (context, index) {
                          return SmallCircules(
                            size: 20,
                            color: kWhite,
                            shadows: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 1,
                                color: const Color(0xff000000).withOpacity(0.1),
                              ),
                            ],
                            child: SmallCircules(
                              color: kPrimaryColor,
                              size: 10,
                            ),
                          );
                        },
                        connectorBuilder: (_, index, ___) {
                          return SolidLineConnector(
                            indent: 0,
                            endIndent: 0,
                            space: 10,
                            direction: Axis.vertical,
                            color: kPrimaryColor,
                          );
                        },
                        contentsBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(left: 18.w, bottom: 24.w),
                            child: Row(
                              children: [
                                Text(
                                  'Sunday, 14 Jan 2022',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: 10,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildEstimatedDate(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estimated date of arrival',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacings.TINY_VERTICAL,
          Text(
            'Sunday, 14 Jan 2022',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  buildTrackingNumber(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tracking Number',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacings.TINY_VERTICAL,
          Text(
            'LNG12026723',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  buildOrderPickHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppIcons.logo),
              Spacings.TINY_HORIZONTAL,
              Container(
                width: 300,
                child: ListTile(
                  title: Text(
                    'Order Picked Up',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: kPrimaryColor,
                        ),
                  ),
                  subtitle: Text('Last updated:12:30 PM, 13 Jan 2022'),
                ),
              ),
            ],
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: kPrimaryColor),
              padding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 15)),
          child: Text(
            'Delivery settngs',
            style: TextStyle(color: kPrimaryColor),
          ),
          onPressed: () {},
        )
      ],
    );
  }

  contactUs() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Have an issue? ",
          style: GoogleFonts.inter(
            fontSize: 14,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            "Contact us",
            style: GoogleFonts.inter(
              fontSize: 14,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }

  goToHome() => Navigator.of(context)
      .pushNamedAndRemoveUntil(TrackingScreen.routeName, (_) => false);

  goTo(String route) =>
      Navigator.of(context).pushNamedAndRemoveUntil(route, (_) => false);

  buildTrackNumberSection() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 0.35.sw,
            child: TextFormField(
              focusNode: _focusNode,
              controller: _trackingNumberController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: 'Type your tracking number',
                prefixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(10, 8, 8, 8),
                  child: AppIcons.svgAsset(
                    AppIcons.settings,
                    color: _focusNode.hasFocus ? kPrimaryColor : null,
                  ),
                ),
                enabledBorder: kInputBorder,
                focusedBorder: kFocusedInputBorder,
                hintStyle:
                    Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(
                          fontSize: 12,
                        ),
                errorStyle: const TextStyle(
                  height: 0,
                  fontSize: 0,
                ),
              ),
            ),
          ),
          SizedBox(width: 24),
          Button(
            text: "Track order",
            primary: kPrimaryColor,
            textColor: kWhite,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 22,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Future<void> onLoginTapped() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      throw ("error");
    }
  }
}

class SmallCircules extends StatelessWidget {
  const SmallCircules({
    Key? key,
    required this.size,
    required this.color,
    this.shadows,
    this.child,
  }) : super(key: key);
  final double size;
  final Color color;
  final List<BoxShadow>? shadows;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: shadows,
          ),
        ),
        if (child != null) Positioned(child: child!),
      ],
    );
  }
}
