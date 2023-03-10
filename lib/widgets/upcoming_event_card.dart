import 'package:event_planner/models/event_model.dart';
import 'package:event_planner/widgets/ui_helper.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/datetime_utils.dart';
import '../utils/text_style.dart';

class UpComingEventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  const UpComingEventCard({Key? key, required this.event, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: <Widget>[
          Expanded(child: buildImage()),
          UIHelper.verticalSpace(24),
          buildEventInfo(context, width),
        ],
      ),
    );
  }

  Widget buildImage() {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: imgBG,
          width: double.infinity,
          child: Hero(
            tag: event.image,
            child: Image.network(
              event.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEventInfo(BuildContext context, final width) {
    return Container(
      width: width,
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: primaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(DateTimeUtils.getMonth(event.eventDate), style: monthStyle),
                Text(DateTimeUtils.getDayOfMonth(event.eventDate), style: titleStyle),
              ],
            ),
          ),
          Spacer(),
         //UIHelper.horizontalSpace(16),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(event.name, style: titleStyle),
                UIHelper.verticalSpace(4),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on, size: 16, color: Theme.of(context).primaryColor),
                    UIHelper.horizontalSpace(4),
                    //Spacer(),
                    Text(event.location, style: subtitleStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
