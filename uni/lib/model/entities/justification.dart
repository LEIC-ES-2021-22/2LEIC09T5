class Justification {
  final String course;
  final String state;
  final String date;

  Justification({
    String this.course,
    String this.state,
    String this.date
  });

  Map<String, dynamic> toMap() {
    return {
      'course': course,
      'state': state,
      'date': date
    };
  }
}
