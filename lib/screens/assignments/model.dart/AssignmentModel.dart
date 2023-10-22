class Assignment {
  final String docId;
  final String assignmentName;
  final String discription;
  final String deadline;
  final String createdData;
  final String time;
  final String assignmentUrl;
  final List school;
  final List applicableClasses;

  Assignment({
    required this.docId,
    required this.assignmentName,
    required this.discription,
    required this.deadline,
    required this.createdData,
    required this.time,
    required this.assignmentUrl,
    required this.school,
    required this.applicableClasses,
  });
}

class AssignmentModel {
  Map<String, dynamic> toMap(data) {
    return {
      'docId': data.docId,
      'assignmentName': data.assignmentName,
      'discription': data.discription,
      'deadline': data.deadline,
      'createdData': data.createdData,
      'time': data.time,
      'AssignmentUrl': data.assignmentUrl,
      'school': data.school,
      'applicableClasses': data.applicableClasses,
    };
  }
}
