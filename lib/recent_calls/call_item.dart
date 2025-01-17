import 'package:call_logs/styles/colors.dart';
import 'package:call_logs/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CallCard extends StatefulWidget {
  final String person_and_calls;
  final String additional;
  final String date;
  const CallCard({Key? key,
    this.person_and_calls = '+0 (000) 000-00-00',
    this.additional='Доп. информация',
    this.date='Дата'}) : super(key: key);

  @override
  State<CallCard> createState() => _CallCardState();
}

class _CallCardState extends State<CallCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 14, top: 15, right: 14, bottom: 31 ),
            child: Icon(
              Icons.phone_forwarded,
              color: AppColor.tertiary,
              size: 14,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(widget.person_and_calls,
                    style: AppTextStyle.bold17()),
                Text(widget.additional, style: AppTextStyle.regular15()),
              ],
            ),
          ),
           Text(widget.date, style: AppTextStyle.regular15()),
          IconButton(
              padding: const EdgeInsets.only(left: 8, right: 21),
              onPressed: () => Navigator.pushNamed(context, '/info'),
              icon: const Icon(
                Icons.info_outlined,
                color: AppColor.link,
                size: 22,
              )),
        ],
      ),
    );
  }
}
