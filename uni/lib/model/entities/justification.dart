import 'package:uni/view/Widgets/certification_card.dart';

class Justification {
  final String course;
  final String class_;
  final String state;
  final String date;

  Justification({
    String this.course,
    String this.class_,
    String this.state,
    String this.date
  });

  Map<String, dynamic> toMap() {
    return {
      'course': course,
      'class': class_,
      'state': state,
      'date': date
    };
  }
}
