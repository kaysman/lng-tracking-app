import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliverySettings extends StatefulWidget {
  DeliverySettings({Key? key}) : super(key: key);

  @override
  State<DeliverySettings> createState() => _DeliverySettingsState();
}

class _DeliverySettingsState extends State<DeliverySettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: .3.sw,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              )
            ],
          )
        ],
      ),
    );
  }
}
