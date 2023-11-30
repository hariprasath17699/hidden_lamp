import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';
import 'package:provider/provider.dart';

import '../../../Provider/providers.dart';
import '../../../utils/SharedPreferances/sharedPreferaces.dart';

class ChatWithUS extends StatefulWidget {
  const ChatWithUS({Key? key}) : super(key: key);

  @override
  State<ChatWithUS> createState() => _ChatWithUSState();
}

class _ChatWithUSState extends State<ChatWithUS> {
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getData();
      setState(() {});
    });
    super.initState();
  }

  var userData = {};
  var userFirebaseData = {};
  bool isUserDataFetching = true;
  TextEditingController messageController = TextEditingController();
  getData() async {
    isUserDataFetching = true;
    setState(() {});
    LogicState userProvider = Provider.of(context, listen: false);
    userData = await sharedPreferances().getUserDetails();
    await userProvider.fetchChatData();

    DocumentReference documentRef =
        FirebaseFirestore.instance.collection('Users').doc(userData['phone']);

    await documentRef.get().then((DocumentSnapshot documentSnapshot) {
      userFirebaseData = documentSnapshot.data() as Map<String, dynamic>;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var chatData = Provider.of<LogicState>(context).getChat;
    var isLoading = Provider.of<LogicState>(context).isChatLoading;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with US'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Opacity(
                  opacity: 0.5,
                  child: Image.network(
                    'https://st2.depositphotos.com/3580719/11124/v/950/depositphotos_111249090-stock-illustration-seamless-background-on-the-topic.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Expanded(
                child: Opacity(
                  opacity: 0.5,
                  child: Image.network(
                    'https://st2.depositphotos.com/3580719/11124/v/950/depositphotos_111249090-stock-illustration-seamless-background-on-the-topic.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
          isLoading && isUserDataFetching && userFirebaseData.length != 0
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: chatData.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, internalIndex) {
                            return chatData[internalIndex]['phoneNumber'] ==
                                    userFirebaseData['phoneNumber']
                                ? Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: chatData[internalIndex]
                                                        ['UserType'] ==
                                                    'Trainer'
                                                ? Colors.red
                                                : Colors.green,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              MATUtils().customText(
                                                  '${chatData[internalIndex]['userName']} (${chatData[internalIndex]['UserType']})',
                                                  15,
                                                  Colors.white),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              MATUtils().customText(
                                                  chatData[internalIndex]
                                                      ['message'],
                                                  13,
                                                  Colors.white),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: chatData[internalIndex]
                                                    ['UserType'] ==
                                                'Trainer'
                                            ? Colors.red
                                            : Colors.green,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MATUtils().customText(
                                              '${chatData[internalIndex]['userName']} (${chatData[internalIndex]['UserType']})',
                                              15,
                                              Colors.white),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          MATUtils().customText(
                                              chatData[internalIndex]
                                                  ['message'],
                                              13,
                                              Colors.white),
                                        ],
                                      ),
                                    ),
                                  );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: MATUtils().customTextField(
                          text: "Type here...", controller: messageController)),
                  IconButton(
                      onPressed: () async {
                        if (messageController.text != null &&
                            messageController.text != '' &&
                            userFirebaseData != null) {
                          CollectionReference chat =
                              FirebaseFirestore.instance.collection('Chat');
                          chat.doc().set({
                            'userName': userFirebaseData['name'],
                            'UserType': userFirebaseData['userType'],
                            'phoneNumber': userFirebaseData['phoneNumber'],
                            'TimeStamp': DateTime.now(),
                            'message': messageController.text,
                          }).then((value) async {
                            messageController.clear();
                            getData();
                          }).catchError((error) {
                            Navigator.of(context).pop();
                            MATUtils().showToast(context, 'Failed Try Again');
                          });
                        }
                      },
                      icon: const Icon(Icons.send_rounded))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
