// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class storyController {
  insertStory() {
    CollectionReference stories =
        FirebaseFirestore.instance.collection('Stories');
    stories
        .doc('HSJNJJJ')
        .set({
          'title': 'sample',
          'storyUrl':
              'https://firebasestorage.googleapis.com/v0/b/hiddenlamp.appspot.com/o/images%2F1659079383753?alt=media&token=a1a417a0-ef6d-4329-8587-ebc93a242fd6',
          'stories': [
            {'storyType': 'onlyText', 'textContent': 'Hey bro'},
            {
              'storyType': 'textWithImage',
              'textContent': 'Hey bro',
              'imageUrl':
                  'https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg'
            }
          ]
        })
        .then((value) => {print('success')})
        .catchError((error) => {print('failed')});
  }
}
