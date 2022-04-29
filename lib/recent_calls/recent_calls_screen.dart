import 'package:call_logs/styles/colors.dart';
import 'package:call_logs/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:call_logs/recent_calls/call_item.dart';
import 'package:flutter/services.dart';

class RecentCalls extends StatefulWidget {
  const RecentCalls({Key? key}) : super(key: key);

  @override
  State<RecentCalls> createState() => _RecentCallsState();
}

class _RecentCallsState extends State<RecentCalls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Журнал звонков',  style: AppTextStyle.bold17(),),
      backgroundColor:AppColor.appBar,

        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor:AppColor.appBar,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),

      ),
      body: ListView.separated(
        itemBuilder: (_, int index) => const CallCard(),
        separatorBuilder: (_, int index) => const Padding(
          padding: EdgeInsets.only(left: 42),
          child: Divider(thickness: 0.5, height: 0.5, color: AppColor.tertiary),
        ),
        itemCount: 300,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}


