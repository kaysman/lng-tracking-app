import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';
import 'package:v2_tracking_page/shared/colors.dart';
import 'package:v2_tracking_page/shared/components/button.dart';
import 'package:v2_tracking_page/shared/helpers.dart';
import 'package:v2_tracking_page/shared/icons.dart';
import 'package:v2_tracking_page/shared/spacings.dart';
import 'package:v2_tracking_page/shared/theming.dart';
import 'package:v2_tracking_page/tracking/track.bloc.dart';
import 'package:v2_tracking_page/tracking/widgets/delivery-settings.dart';

class Stop {
  String title;
  List<Step> steps;

  Stop(this.title, this.steps);
}

class Step {
  String time;
  String title;
  String subtitle;

  Step(this.time, this.title, this.subtitle);
}

class TrackingScreen extends StatefulWidget {
  static const String routeName = 'tracking';
  const TrackingScreen({
    Key? key,
  }) : super(key: key);

  // final String orderId ='';
  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _trackingNumberController = TextEditingController();
  bool isShowItemDetails = false;
  // late TrackOrderBloc trackOrderBloc;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
    // trackOrderBloc = BlocProvider.of<TrackOrderBloc>(context);

    // trackOrderBloc.fetchTrackOrder('cba20399-7b26-41c0-aabf-ed76e286bac9');
  }

  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _trackingNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: header(context),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 32.0),
          child: bodyContent(),
        ),
      ),
    );
  }

  header(BuildContext context) {
    return AppBar(
      backgroundColor: kWhite,
      elevation: 2,
      scrolledUnderElevation: 2.8,
      title: Row(
        children: [
          SizedBox(width: 80),
          Image.asset(
            AppIcons.logo,
            width: 35.sp,
            height: 45.sp,
          ),
          Spacings.TINY_HORIZONTAL,
          Text(
            "Load and Go",
            style: GoogleFonts.inter(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
      actions: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.phone,
                size: 24.sp,
              ),
              Spacings.TINY_HORIZONTAL,
              Text.rich(
                TextSpan(
                  text: "Talk with our team at ",
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: "+56 458 3256",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: kPrimaryColor),
                      mouseCursor: MaterialStateMouseCursor.clickable,
                      onEnter: (v) {},
                    ),
                  ],
                ),
              ),
              SizedBox(width: 80),
            ],
          ),
        ),
      ],
    );
  }

  bodyContent() {
    return Form(
      key: _formKey,
      child: BlocConsumer<TrackOrderBloc, TrackOrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              if (state.status != GetTrackOrderStatus.error) ...[
                Text(
                  "Shipment Tracking",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kText1Color,
                      ),
                ),
                Spacings.TINY_VERTICAL,
                Text(
                  "Track your order",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
              if (state.status == GetTrackOrderStatus.error) ...[
                Icon(Icons.error_outline, size: 50, color: kFailedColor),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Sorry we couldn\'t find the order you\'re looking for',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: kText1Color, fontWeight: FontWeight.bold),
                )
              ],
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
              if (state.trackOrder != null &&
                  state.status != GetTrackOrderStatus.error &&
                  state.status == GetTrackOrderStatus.idle) ...[
                Spacings.LITTLE_BIG_VERTICAL,
                Container(
                  width: .6.sw,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xffE0E0E0).withOpacity(.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildOrderPickHeader(context, state),
                      Spacings.NORMAL_VERTICAL,
                      buildTrackingNumber(context, state),
                      Spacings.NORMAL_VERTICAL,
                      buildEstimatedDate(context),
                      Spacings.NORMAL_VERTICAL,
                      destinationFromToSection(),
                      Spacings.NORMAL_VERTICAL,
                      allDestinationsSection()
                    ],
                  ),
                )
              ],
            ],
          );
        },
      ),
    );
  }

  allDestinationsSection() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Where your shipment has been',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 32),
          Timeline.tileBuilder(
            padding: EdgeInsets.zero,
            theme: TimelineThemeData(
              direction: Axis.vertical,
              nodePosition: 0,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            builder: TimelineTileBuilder.connected(
              itemCount: 10,
              connectionDirection: ConnectionDirection.before,
              indicatorBuilder: (context, index) {
                return DotIndicator(
                  size: 20,
                  color: kWhite,
                  shadows: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 1,
                      color: const Color(0xff000000).withOpacity(0.1),
                    ),
                  ],
                  child: DotIndicator(
                    color: kPrimaryColor,
                    size: 10,
                  ),
                );
              },
              connectorBuilder: (_, index, type) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: SolidLineConnector(
                        indent: 0,
                        endIndent: 0,
                        direction: Axis.vertical,
                        color: kPrimaryColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Divider(
                              color: kBlack,
                              thickness: 2,
                              height: 1,
                              endIndent: 0,
                              indent: 0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: Divider(
                              color: kBlack,
                              thickness: 2,
                              height: 1,
                              endIndent: 0,
                              indent: 0,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
              // oppositeContentsBuilder: (context, index) {
              //   return Container(
              //     height: 20,
              //     width: 20,
              //     color: Colors.yellow,
              //   );
              // },
              contentsBuilder: (context, index) {
                return Container(
                  height: 80,
                  padding: EdgeInsets.only(
                    left: 18.w,
                    // bottom: 24.w,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sunday, 14 Jan 2022',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  destinationFromToSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DotIndicator(
                            size: 20,
                            color: kWhite,
                            shadows: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 1,
                                color: const Color(0xff000000).withOpacity(0.1),
                              ),
                            ],
                            child: DotIndicator(
                              color: kBlack,
                              size: 10,
                            ),
                          ),
                          Image.asset(
                            AppIcons.arrow_down,
                            color: kPrimaryColor,
                            height: 90,
                            width: 10,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Spacings.SMALL_HORIZONTAL,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From: Boots Shoe Co.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text('22 Boon Street'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DotIndicator(
                        size: 20,
                        color: kWhite,
                        shadows: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 1,
                            color: const Color(0xff000000).withOpacity(0.1),
                          ),
                        ],
                        child: DotIndicator(
                          color: kPrimaryColor,
                          size: 10,
                        ),
                      ),
                      Spacings.SMALL_HORIZONTAL,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To: Towishful Haker Chowdhury',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '22 Boon Street',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
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
                  onPressed: () {
                    showAppDialog(
                      context,
                      EditDeliveryNotes(),
                    );
                  },
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
          InkWell(
            onTap: () {
              setState(() {
                isShowItemDetails = !isShowItemDetails;
              });
            },
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedCrossFade(
                    sizeCurve: Curves.easeOutQuint,
                    firstChild: Container(
                      child: Column(
                        children: [
                          Text('Item details'),
                          SizedBox(height: 10),
                          Icon(
                            isShowItemDetails
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          )
                        ],
                      ),
                    ),
                    secondChild: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isShowItemDetails) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Item details:'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text('Apple Iphone 13 Pro Max 256GB'),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text('1 unit'),
                              ],
                            ),
                          ),
                        ]
                      ],
                    ),
                    crossFadeState: isShowItemDetails
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: Duration(milliseconds: 1000),
                  )
                ],
              ),
            ),
          ),
        ],
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

  buildTrackingNumber(BuildContext context, TrackOrderState state) {
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
            state.trackOrder?.id ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  buildOrderPickHeader(BuildContext context, TrackOrderState state) {
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
                      state.trackOrder?.status ?? '',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: kPrimaryColor,
                          ),
                    ),
                    subtitle:
                        Text("Last updated: ${state.trackOrder?.deliveredAt}")),
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
          onPressed: () {
            showAppDialog(context, DeliverySettings());
          },
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
          BlocBuilder<TrackOrderBloc, TrackOrderState>(
            builder: (context, state) {
              return Button(
                text: "Track order",
                primary: kPrimaryColor,
                isLoading: state.status == GetTrackOrderStatus.loading,
                textColor: kWhite,
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 22,
                ),
                onPressed: () async {
                  await context
                      .read<TrackOrderBloc>()
                      .fetchTrackOrder(_trackingNumberController.text.trim());
                },
              );
            },
          )
        ],
      ),
    );
  }

  // Future<void> onLoginTapped() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //   } else {
  //     throw ("error");
  //   }
  // }
}

class EditDeliveryNotes extends StatelessWidget {
  const EditDeliveryNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          width: .3.sw,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Delivery notes',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: kWhite, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kGrey5Color,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Add delivery notes...',
                            hintStyle: Theme.of(context).textTheme.caption,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Button(
                          borderColor: kGrey1Color,
                          elevation: 0,
                          hasBorder: true,
                          onPressed: () {},
                          text: 'Delete',
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Button(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          text: 'Update',
                          textColor: kWhite,
                          primary: kPrimaryColor,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 14,
          left: 14,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.close,
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
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
