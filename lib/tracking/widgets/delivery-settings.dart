import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v2_tracking_page/shared/colors.dart';
import 'package:v2_tracking_page/shared/components/button.dart';
import 'package:v2_tracking_page/shared/icons.dart';
import 'package:v2_tracking_page/tracking/widgets/info.label.dart';
import 'package:v2_tracking_page/tracking/widgets/row_2_children.dart';

class DeliverySettings extends StatefulWidget {
  DeliverySettings({Key? key}) : super(key: key);

  @override
  State<DeliverySettings> createState() => _DeliverySettingsState();
}

class _DeliverySettingsState extends State<DeliverySettings> {
  final adressLine1Controller = TextEditingController();
  final adressLine2Controller = TextEditingController();
  final postalCodeontroller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  DeliverySection? selectedSectionOfDeliveryNotes;
  DeliverySection? selectedSectionOfDeliveryAdress;
  DeliverySection? selectedSectionOfRequestSpecificDeliveryTime;
  DeliverySection? selectedSectionOfRequestSpecificDeliveryDate;
  String? selectedTimeLineRange;
  DateTime? selectedDate;
  List<String> timeLineRanges = [
    '10:00 AM - 02:00 PM',
    '12:00 AM - 04:00 PM',
    '14:00 AM - 06:00 PM',
  ];
  void close(DeliverySection? section) {
    setState(() {
      if (section == DeliverySection.ADRESS) {
        selectedSectionOfDeliveryAdress = null;
      } else if (section == DeliverySection.DELIVERY_NOTES) {
        selectedSectionOfDeliveryNotes = null;
      } else if (section == DeliverySection.REQUEST_SPECIFIC_DELIVERY_TIMING) {
        selectedSectionOfRequestSpecificDeliveryTime = null;
      } else if (section == DeliverySection.REQUEST_SPECIFIC_DELIVERY_DATE) {
        selectedSectionOfRequestSpecificDeliveryDate = null;
      }
    });
  }

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
                    'Delivery Settings',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              buildDeliveryNotesSection(
                title: 'Delivery notes',
                subtTitle: 'I live in this adress..',
                btnText: 'Edit',
                onPressed: () {
                  setState(() {
                    selectedSectionOfDeliveryNotes =
                        DeliverySection.DELIVERY_NOTES;
                  });
                },
                iconPath: AppIcons.dashboard,
              ),
              SizedBox(
                height: 20.h,
              ),
              buildAdressSection(
                title: 'Adress',
                subtTitle: 'I live in this adress..',
                btnText: 'Edit',
                onPressed: () {
                  setState(() {
                    selectedSectionOfDeliveryAdress = DeliverySection.ADRESS;
                  });
                },
                iconPath: AppIcons.driver,
              ),
              SizedBox(
                height: 20.h,
              ),
              buildRequestSpecificDeliveryTime(
                title: 'Request specific delivery timing',
                btnText: 'Request',
                exTitle: 'Additional cost: 2\$',
                onPressed: () {
                  setState(() {
                    selectedSectionOfRequestSpecificDeliveryTime =
                        DeliverySection.REQUEST_SPECIFIC_DELIVERY_TIMING;
                  });
                },
                iconPath: AppIcons.table,
              ),
              SizedBox(
                height: 20.h,
              ),
              buildRequestSpecificDeliveryDate(
                title: 'Request specific delivery date',
                btnText: 'Request',
                exTitle: 'Additional cost: 2\$',
                onPressed: () {
                  setState(() {
                    selectedSectionOfRequestSpecificDeliveryDate =
                        DeliverySection.REQUEST_SPECIFIC_DELIVERY_DATE;
                  });
                },
                iconPath: AppIcons.calendar,
              ),
              SizedBox(
                height: 24.h,
              ),
              Button(
                text: 'Save',
                primary: kPrimaryColor,
                onPressed: () {},
                textColor: kWhite,
              ),
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

  buildDeliveryNotesSection(
      {String? title,
      String? btnText,
      String? subtTitle,
      Function? onPressed,
      String? iconPath}) {
    return () {
      switch (selectedSectionOfDeliveryNotes) {
        case DeliverySection.DELIVERY_NOTES:
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: kGrey4Color, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Delivery notes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(8)),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              border: InputBorder.none),
                          maxLines: 8,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          close(selectedSectionOfDeliveryNotes);
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(color: kGrey1Color),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Button(
                      text: 'Update',
                      textColor: kWhite,
                      primary: kPrimaryColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        default:
          return DeliverySettingTile(
            btnText: btnText!,
            title: title!,
            onPressed: onPressed,
            subtTitle: subtTitle,
            iconPath: iconPath,
          );
      }
    }();
  }

  buildAdressSection(
      {String? title,
      String? btnText,
      String? subtTitle,
      Function? onPressed,
      String? iconPath}) {
    return () {
      switch (selectedSectionOfDeliveryAdress) {
        case DeliverySection.ADRESS:
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                color: kGrey4Color, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Adress',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Changing the adress will change extra 2.00\$',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      RowOfTwoChildren(
                        child1: InfoWithLabel(
                          editMode: true,
                          label: Text(
                            'Adress line 1',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          controller: adressLine1Controller,
                        ),
                        child2: InfoWithLabel(
                          controller: adressLine2Controller,
                          editMode: true,
                          label: Text(
                            'Adress line 2',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      RowOfTwoChildren(
                        child1: InfoWithLabel(
                          editMode: true,
                          label: Text(
                            'Postal Code',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          controller: adressLine1Controller,
                        ),
                        child2: InfoWithLabel(
                          controller: adressLine2Controller,
                          editMode: true,
                          label: Text(
                            'City',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      RowOfTwoChildren(
                        child1: InfoWithLabel(
                          editMode: true,
                          label: RichText(
                            text: TextSpan(
                              text: "State",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                              children: [
                                TextSpan(
                                  text: ' (optional)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                )
                              ],
                            ),
                          ),
                          controller: adressLine1Controller,
                        ),
                        child2: InfoWithLabel(
                          controller: adressLine2Controller,
                          editMode: true,
                          label: Text(
                            'Country',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          close(selectedSectionOfDeliveryAdress);
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(color: kGrey1Color),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Button(
                      text: 'Update',
                      textColor: kWhite,
                      primary: kPrimaryColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        default:
          return DeliverySettingTile(
            btnText: btnText!,
            title: title!,
            onPressed: onPressed,
            subtTitle: subtTitle,
            iconPath: iconPath,
          );
      }
    }();
  }

  buildRequestSpecificDeliveryTime({
    String? title,
    String? btnText,
    String? exTitle,
    Function? onPressed,
    String? iconPath,
  }) {
    return () {
      switch (selectedSectionOfRequestSpecificDeliveryTime) {
        case DeliverySection.REQUEST_SPECIFIC_DELIVERY_TIMING:
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                color: kGrey4Color, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Request specific delivery timing  ',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    children: [
                      TextSpan(
                        text: 'Additional cost:2\$',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Select delivery timing',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: List.generate(timeLineRanges.length, (i) {
                      var range = timeLineRanges[i];
                      return OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedTimeLineRange = range;
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: kPrimaryColor),
                          backgroundColor: selectedTimeLineRange == range
                              ? kPrimaryColor
                              : null,
                        ),
                        child: Text(
                          range,
                          style: TextStyle(
                            color: selectedTimeLineRange == range
                                ? kWhite
                                : kPrimaryColor,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          close(selectedSectionOfRequestSpecificDeliveryTime);
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(color: kGrey1Color),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Button(
                      text: 'Update',
                      textColor: kWhite,
                      primary: kPrimaryColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        default:
          return DeliverySettingTile(
            btnText: btnText!,
            title: title!,
            onPressed: onPressed,
            iconPath: iconPath,
            exTitle: exTitle,
          );
      }
    }();
  }

  buildRequestSpecificDeliveryDate({
    String? title,
    String? btnText,
    String? exTitle,
    Function? onPressed,
    String? iconPath,
  }) {
    return () {
      switch (selectedSectionOfRequestSpecificDeliveryDate) {
        case DeliverySection.REQUEST_SPECIFIC_DELIVERY_DATE:
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                color: kGrey4Color, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Request specific delivery date  ',
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    children: [
                      TextSpan(
                        text: 'Additional cost:2\$',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Select delivery date',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                SizedBox(
                  height: 12,
                ),
                RowOfTwoChildren(
                  child1: InfoWithLabel(
                    label: Text(
                      'Pickup date',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    editMode: true,
                    infoType: InfoType.date,
                    dateValue: selectedDate,
                    onDateChanged: (v) {
                      setState(() {
                        selectedDate = v;
                      });
                    },
                  ),
                  child2: SizedBox.shrink(),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          close(selectedSectionOfRequestSpecificDeliveryDate);
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(color: kGrey1Color),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Button(
                      text: 'Update',
                      textColor: kWhite,
                      primary: kPrimaryColor,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
        default:
          return DeliverySettingTile(
            btnText: btnText!,
            title: title!,
            onPressed: onPressed,
            iconPath: iconPath,
            exTitle: exTitle,
          );
      }
    }();
  }
}

// * diapozone

class DeliverySettingTile extends StatelessWidget {
  final String title;
  final String? exTitle;
  final String btnText;
  final String? subtTitle;
  final Function? onPressed;
  final String? iconPath;

  const DeliverySettingTile({
    Key? key,
    required this.title,
    this.exTitle,
    required this.btnText,
    this.subtTitle,
    this.onPressed,
    this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 10),
      padding: subtTitle == null ? EdgeInsets.symmetric(vertical: 8) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kGrey4Color,
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor.withOpacity(.15),
          ),
          child: AppIcons.svgAsset(iconPath ?? '', color: kPrimaryColor),
        ),
        title: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            if (exTitle != null && exTitle!.isNotEmpty) ...[
              SizedBox(
                width: 5,
              ),
              Text(exTitle!, style: TextStyle(fontSize: 10, color: kGrey1Color))
            ]
          ],
        ),
        subtitle: subtTitle == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  subtTitle ?? '',
                  style: TextStyle(fontSize: 12),
                ),
              ),
        trailing: Button(
          text: btnText,
          primary: kPrimaryColor,
          textColor: kWhite,
          textStyle: TextStyle(fontSize: 12),
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          onPressed: () => onPressed!.call(),
        ),
      ),
    );
  }
}

enum DeliverySection {
  DELIVERY_NOTES,
  ADRESS,
  REQUEST_SPECIFIC_DELIVERY_TIMING,
  REQUEST_SPECIFIC_DELIVERY_DATE,
}
