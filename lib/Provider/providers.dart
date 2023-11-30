// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class LogicState extends ChangeNotifier {
  LogicState();
  var _reels;
  var _courses;
  var _userData;
  var _projects;
  var _assignments;
  var _projectsOfTheWeek;
  var _productsData;
  var _notifications;
  var _chat;

  bool _fetchingData = true;
  bool _fetchingAssignmentsData = true;
  bool _fetchingproductsData = true;
  bool _fetchingnotificationsData = true;
  bool _fetchingChatData = true;

  get getReelsData => _reels;
  get getCoursesData => _courses;
  get isLoading => _fetchingData;
  get isChatLoading => _fetchingChatData;
  get isNotificationsLoading => _fetchingnotificationsData;
  get isAssignmentsLoading => _fetchingAssignmentsData;
  get isProductsLoading => _fetchingproductsData;
  get getuserData => _userData;
  get getprojectsData => _projects;
  get getAssignmentsData => _assignments;
  get getprojectsOfTheWeekData => _projectsOfTheWeek;
  get getProductsData => _productsData;
  get getNotifications => _notifications;
  get getChat => _chat;
  Future<void> fetchData(String phoneNumber) async {
    print('heyyy');
    print(_reels);
    print(_projects);
    print(_projectsOfTheWeek);
    if (_reels == null ||
        _courses == null ||
        _courses.length == 0 ||
        _projects == null ||
        _projectsOfTheWeek == null) {
      print('heyyy22323322');
      _fetchingData = true;
      notifyListeners();
      _reels = await fetchReels();
      _courses = await fetchCourses(phoneNumber);
      _projects = await fetchProjects();
      _projectsOfTheWeek = await fetchProjectOfTheWeeks();

      _fetchingData = false;
      notifyListeners();
    }
  }

  Future<void> fetchAssignmentsData(String phoneNumber) async {
    if (_assignments == null) {
      _fetchingAssignmentsData = true;
      notifyListeners();
      _assignments = await fetchAssignments(phoneNumber);
      _fetchingAssignmentsData = false;
      notifyListeners();
    }
  }

  Future<void> fetchNotificationData() async {
    if (_notifications == null) {
      _fetchingnotificationsData = true;
      notifyListeners();
      _notifications = await fetchNotifications();
      _fetchingnotificationsData = false;
      notifyListeners();
    }
  }

  Future<void> fetchChatData() async {
    _fetchingChatData = true;
    notifyListeners();
    _chat = await fetchChat();
    _fetchingChatData = false;
    notifyListeners();
  }

  Future<void> fetchUserData(String phoneNumber) async {
    if (_userData == null) {
      _fetchingAssignmentsData = true;
      notifyListeners();
      _userData = await fetchUserDetails(phoneNumber);
      _fetchingAssignmentsData = false;
      notifyListeners();
    }
  }

  Future<void> fetchProductsData() async {
    if (_productsData == null) {
      _fetchingproductsData = true;
      notifyListeners();
      _productsData = await fetchProducts();
      _fetchingproductsData = false;
      notifyListeners();
    }
  }

  Future<dynamic> fetchReels() async {
    CollectionReference reelsCollectionRef =
        FirebaseFirestore.instance.collection('Stories');
    QuerySnapshot querySnapshot = await reelsCollectionRef.get();

    var reels = querySnapshot.docs.map((doc) => doc.data()).toList();

    return reels;
  }

  Future<dynamic> fetchNotifications() async {
    CollectionReference notificationsCollectionRef =
        FirebaseFirestore.instance.collection('Notifications');
    QuerySnapshot querySnapshot = await notificationsCollectionRef.get();

    var notifications = querySnapshot.docs.map((doc) => doc.data()).toList();

    return notifications;
  }

  Future<dynamic> fetchChat() async {
    Query<Map<String, dynamic>> chatCollectionRef = FirebaseFirestore.instance
        .collection('Chat')
        .orderBy('TimeStamp', descending: false);
    QuerySnapshot querySnapshot = await chatCollectionRef.get();

    var chat = querySnapshot.docs.map((doc) => doc.data()).toList();
    print("------>$chat");

    return chat;
  }

  Future<dynamic> fetchProducts() async {
    CollectionReference productsCollectionRef =
        FirebaseFirestore.instance.collection('Products');
    QuerySnapshot querySnapshot = await productsCollectionRef.get();

    var products = querySnapshot.docs.map((doc) => doc.data()).toList();

    return products;
  }

  Future<dynamic> fetchCourses(String phoneNumber) async {
    Map<String, dynamic> userDetails = {};
    CollectionReference coursesCollectionRef =
        FirebaseFirestore.instance.collection('Courses');
    QuerySnapshot querySnapshot = await coursesCollectionRef.get();
    List courses = querySnapshot.docs.map((doc) => doc.data()).toList();
    List finalCourses = [];
    print('----->$courses');

    DocumentReference documentRef =
        FirebaseFirestore.instance.collection('Users').doc(phoneNumber);

    await documentRef.get().then(
      (DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          userDetails = documentSnapshot.data() as Map<String, dynamic>;
          for (var i = 0; i < courses.length; i++) {
            if (courses[i]['schools'].contains(userDetails['school']) &&
                courses[i]['applicableClasses']
                    .contains(userDetails['className'])) {
              finalCourses.add((courses[i]));
            }
          }
        } else {
          print('Courses Not Avalible');
        }
      },
    );

    print('===>$finalCourses');

    return finalCourses;
  }

  Future<dynamic> fetchAssignments(String phoneNumber) async {
    Map<String, dynamic> userDetails = {};
    CollectionReference assignmentsCollectionRef =
        FirebaseFirestore.instance.collection('Assignments');
    QuerySnapshot querySnapshot = await assignmentsCollectionRef.get();
    List assignments = querySnapshot.docs.map((doc) => doc.data()).toList();
    List finalAssignments = [];
    DocumentReference documentRef =
        FirebaseFirestore.instance.collection('Users').doc(phoneNumber);
    await documentRef.get().then(
      (DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          userDetails = documentSnapshot.data() as Map<String, dynamic>;
          for (var i = 0; i < assignments.length; i++) {
            if (assignments[i]['school'].contains(userDetails['school']) &&
                assignments[i]['applicableClasses']
                    .contains(userDetails['className'])) {
              finalAssignments.add((assignments[i]));
            }
          }
        } else {
          print('Assignments Not Avalible');
        }
      },
    );

    return finalAssignments;
  }

  Future<dynamic> fetchUserDetails(String phone) async {
    DocumentReference documentRef =
        FirebaseFirestore.instance.collection('Users').doc(phone);
    Map<String, dynamic> data = {};
    documentRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        data = documentSnapshot.data() as Map<String, dynamic>;
        print("Document data: $data");
        notifyListeners();
      } else {
        print('Document does not exist');
      }
    });
    return data;
  }

  Future<dynamic> fetchProjects() async {
    CollectionReference projectsCollectionRef =
        FirebaseFirestore.instance.collection('Projects');
    QuerySnapshot querySnapshot = await projectsCollectionRef.get();

    var projects = querySnapshot.docs.map((doc) => doc.data()).toList();

    return projects;
  }

  Future<dynamic> fetchProjectOfTheWeeks() async {
    CollectionReference weekProjectsCollectionRef =
        FirebaseFirestore.instance.collection('ProjectOfTheWeeks');
    QuerySnapshot querySnapshot = await weekProjectsCollectionRef.get();
    var projectOfTheWeek = querySnapshot.docs.map((doc) => doc.data()).toList();
    return projectOfTheWeek;
  }

  Future<void> clearAllData() async {
    _fetchingData = true;
    _reels = null;
    _courses = null;
    _userData = null;
    _projects = null;
    _assignments = null;
    _projectsOfTheWeek = null;
    _productsData = null;
    _notifications = null;
    _chat = null;
    notifyListeners();
  }
}
