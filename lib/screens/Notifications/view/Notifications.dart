import 'package:flutter/material.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';
import 'package:provider/provider.dart';

import '../../../Provider/providers.dart';
import '../../../utils/SharedPreferances/sharedPreferaces.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List colors = [
    const Color.fromARGB(255, 236, 75, 57),
    const Color.fromARGB(255, 215, 182, 17),
    const Color.fromARGB(255, 58, 143, 213),
    const Color.fromARGB(255, 16, 178, 94),
    const Color.fromARGB(255, 211, 56, 239),
    const Color.fromARGB(255, 41, 147, 234),
    const Color.fromARGB(255, 4, 37, 16),
  ];
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getData();
      setState(() {});
    });
    super.initState();
  }

  var userData = {};
  getData() async {
    LogicState userProvider = Provider.of(context, listen: false);
    userData = await sharedPreferances().getUserDetails();
    await userProvider.fetchNotificationData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var notificatiosnData = Provider.of<LogicState>(context).getNotifications;
    var isLoading = Provider.of<LogicState>(context).isNotificationsLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < notificatiosnData.length; i++)
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: colors[i],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 50,
                          height: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MATUtils().customText('Trainer', 15, Colors.white),
                            const SizedBox(
                              height: 4,
                            ),
                            MATUtils().customText(
                                notificatiosnData[i]['content'],
                                13,
                                Colors.white),
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
