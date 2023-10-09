import 'package:flutter/material.dart';
import 'package:hidden_lamp/utils/MATUtils/MATUtils.dart';

class ChatWithUS extends StatefulWidget {
  const ChatWithUS({Key? key}) : super(key: key);

  @override
  State<ChatWithUS> createState() => _ChatWithUSState();
}

class _ChatWithUSState extends State<ChatWithUS> {
  @override
  Widget build(BuildContext context) {
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
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MATUtils().customText('Me', 15, Colors.white),
                            const SizedBox(
                              height: 4,
                            ),
                            MATUtils().customText(
                                'Good mornging sir', 13, Colors.white),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MATUtils().customText('Trainer', 15, Colors.white),
                          const SizedBox(
                            height: 4,
                          ),
                          MATUtils().customText(
                              'Hey Lucifer, Good morning', 13, Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MATUtils().customText('Rajesh', 15, Colors.white),
                          const SizedBox(
                            height: 4,
                          ),
                          MATUtils().customText(
                              'Sir, I have a doubt to ask', 13, Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MATUtils().customText('Trainer', 15, Colors.white),
                          const SizedBox(
                            height: 4,
                          ),
                          MATUtils().customText(
                              'Yes Rajesh, Please ask', 13, Colors.white),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MATUtils().customText('Me', 15, Colors.white),
                            const SizedBox(
                              height: 4,
                            ),
                            MATUtils().customText(
                                'Sir, how can I Reset My password?',
                                13,
                                Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                        child:
                            MATUtils().customTextField(text: "Type here...")),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.send_rounded))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
