import 'package:call_logs/styles/colors.dart';
import 'package:call_logs/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:call_logs/recent_calls/call_item.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      body: FutureBuilder<http.Response>(
     future: http.get(Uri.parse('https://raw.githubusercontent.com/Gammadov/data/main/calls/call_logs.json')),
        builder: (context, snapshot) {
          // List <Widget>  cards = [];
          // for (int i = 0 ; i< decoded.length; i++){
          //   final single_map = decoded[i];
          //   cards.add(CallCard
          //       (date: single_map['date'],                                   // 1 логический способ вывести список в правильном формате на экран
          //       additional: single_map['additional'],
          //       person_and_calls:single_map ['person']
          //
          //   ));
          // }
          // return ListView(children: cards);



//     if (snapshot.hasData) {
//     final decoded = jsonDecode(snapshot.data!.body);
//     return ListView.builder(
//     itemCount: decoded.length,
//     itemBuilder: (context, index) {
//     final singleMap = decoded[index];                                            // 2 способ(с помощью специального виджета ListView.builder)
//     return CallCard
//     (date: singleMap['date'],
//     additional: singleMap['additional'],
//     person_and_calls:singleMap ['person'],
//
//     );
//     }
//     );
//     } else {
//     return Center(child: const CircularProgressIndicator());
//      }
//      }
//       )
//       );
//
// }
//   }

          if (snapshot.hasData) {
            final decoded = jsonDecode(snapshot.data!.body);
            return ListView.separated(
                itemCount: decoded.length,
                itemBuilder: (context, index) {
                  final singleMap = decoded[index]; // 2 способ(с помощью специального виджета ListView.builder)                            // 3 способ с помощью ListView.separated
                  return CallCard
                    (date: singleMap['date'],
                    additional: singleMap['additional'],
                    person_and_calls: singleMap ['person'],

                  );
                },
                separatorBuilder: (context, index) =>
                const Padding(padding: EdgeInsets.only(left: 42),
                  child: Divider(
                      thickness: 0.5, height: 0.5, color: AppColor.tertiary),
                )
            );
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        }
  )
  );

}
}
