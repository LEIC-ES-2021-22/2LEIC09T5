import 'package:tuple/tuple.dart';

class CertificateType {
  static final courseDiploma = CertificateType._(
    'Carta de Curso - Grau de Licenciado',
    canBeInEnglish: false,
    timeLimitPhysical: const [Tuple2('180 dias úteis', '371')],
  );
  static final schoolAchievement = CertificateType._(
      'Certidão de Aproveitamento Escolar',
      needsYear: true,
      purposePhysical: const [
        Tuple2('ADSE', '21'),
        Tuple2('IRS', '3'),
        Tuple2('Abono de família', '4'),
        Tuple2('Concessão de residência a estudantes estrangeiros', '61'),
        Tuple2('Pensões', '8'),
        Tuple2('Bolsas de estudo dos Serviços de Ação Social', '81'),
        Tuple2('Passes de transporte', '9'),
        Tuple2('Assistência médica e medicamentosa', '41'),
      ],
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '415'),
        Tuple2('5 dias úteis (50% mais caro)', '567'),
        Tuple2('2 dias úteis (100% mais caro)', '544'),
      ]);
  static final attendanceOfAcademicYearAndEnrolmentInTheFollowingYear =
      CertificateType._(
    'Certidão de Frequência de um Ano Letivo e Inscrição no seguinte',
    timeLimitPhysical: const [
      Tuple2('10 dias úteis', '400'),
      Tuple2('5 dias úteis (50% mais caro)', '563'),
      Tuple2('2 dias úteis (100% mais caro)', '562'),
    ],
  );
  static final licenciadoDegree = CertificateType._(
    'Certidão de Grau de Licenciado',
    canBeDigital: true,
    timeLimitPhysical: const [
      Tuple2('30 dias úteis', '394'),
      Tuple2('5 dias úteis (50% mais caro)', '521'),
      Tuple2('2 dias úteis (100% mais caro)', '522'),
    ],
    timeLimitDigital: const [Tuple2('30 dias úteis', '1141')],
  );
  static final enrolmentInCurricularYear = CertificateType._(
      'Certidão de Inscrição em Ano Curricular',
      needsYear: true,
      purposePhysical: const [
        Tuple2('ADSE', '21'),
        Tuple2('IRS', '3'),
        Tuple2('Abono de família', '4'),
        Tuple2('Concessão de residência a estudantes estrangeiros', '61'),
        Tuple2('Pensões', '8'),
        Tuple2('Bolsas de estudo dos Serviços de Ação Social', '81'),
        Tuple2('Passes de transporte', '9'),
        Tuple2('Assistência médica e medicamentosa', '41'),
      ],
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '403'),
        Tuple2('5 dias úteis (50% mais caro)', '542'),
        Tuple2('2 dias úteis (100% mais caro)', '564'),
      ]);
  static final enrolmentInAcademicYear = CertificateType._(
      'Certidão de Inscrição em Ano Letivo',
      needsYear: true,
      purposePhysical: const [
        Tuple2('ADSE', '21'),
        Tuple2('IRS', '3'),
        Tuple2('Abono de família', '4'),
        Tuple2('Concessão de residência a estudantes estrangeiros', '61'),
        Tuple2('Pensões', '8'),
        Tuple2('Bolsas de estudo dos Serviços de Ação Social', '81'),
        Tuple2('Passes de transporte', '9'),
        Tuple2('Assistência médica e medicamentosa', '41'),
      ],
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '403'),
        Tuple2('5 dias úteis (50% mais caro)', '542'),
        Tuple2('2 dias úteis (100% mais caro)', '564'),
      ]);
  static final registrationInCourseUnits = CertificateType._(
      'Certidão de Inscrição em Unidades Curriculares',
      needsYear: true,
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '397'),
        Tuple2('5 dias úteis (50% mais caro)', '561'),
        Tuple2('2 dias úteis (100% mais caro)', '541'),
      ]);
  static final enrolment =
      CertificateType._('Certidão de Matrícula', timeLimitPhysical: const [
    Tuple2('10 dias úteis', '403'),
    Tuple2('5 dias úteis (50% mais caro)', '542'),
    Tuple2('2 dias úteis (100% mais caro)', '564'),
  ]);
  static final noRestrictionOnRegistration = CertificateType._(
      'Certidão de Não Prescrição',
      canBeInEnglish: false,
      needsYear: true,
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '505'),
        Tuple2('5 dias úteis (50% mais caro)', '1001'),
        Tuple2('2 dias úteis (100% mais caro)', '1021'),
      ]);
  static final programmesAndCourseWorkloads = CertificateType._(
      'Certidão de Programas e Cargas Horárias',
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '461'),
        Tuple2('5 dias úteis (50% mais caro)', '462'),
        Tuple2('2 dias úteis (100% mais caro)', '481'),
      ]);
  static final courseUnitsCompleted = CertificateType._(
      'Certidão de Realização de Unidades Curriculares',
      timeLimitPhysical: const [
        Tuple2('10 dias úteis', '397'),
        Tuple2('5 dias úteis (50% mais caro)', '561'),
        Tuple2('2 dias úteis (100% mais caro)', '541'),
      ]);
  static final sub23Pass = CertificateType._(
    'Passe sub23@superior.tp',
    canBeInEnglish: false,
    canBeDigital: true,
    needsYear: true,
    timeLimitPhysical: const [Tuple2('10 dias úteis', '1201')],
    timeLimitDigital: const [Tuple2('10 dias úteis', '1201')],
  );

  static final values = [
    courseDiploma,
    schoolAchievement,
    attendanceOfAcademicYearAndEnrolmentInTheFollowingYear,
    licenciadoDegree,
    enrolmentInCurricularYear,
    enrolmentInAcademicYear,
    registrationInCourseUnits,
    enrolment,
    noRestrictionOnRegistration,
    programmesAndCourseWorkloads,
    courseUnitsCompleted,
    sub23Pass
  ];

  final String label;
  final bool canBeDigital;
  final bool canBeInEnglish;
  final bool needsYear;
  final List<Tuple2<String, String>> purposePhysical;
  final List<Tuple2<String, String>> purposeDigital;
  final List<Tuple2<String, String>> timeLimitPhysical;
  final List<Tuple2<String, String>> timeLimitDigital;
  final List<Tuple2<String, String>> shippingType = const [
    Tuple2('Correio normal', 'N'),
    Tuple2('Correio registado com aviso de receção', 'RC'),
    Tuple2('Correio registado sem aviso de receção', 'RS'),
    Tuple2('Levantamento presencial nos serviços', 'SR'),
  ];

  const CertificateType._(
    this.label, {
    this.canBeDigital = false,
    this.canBeInEnglish = true,
    this.needsYear = false,
    this.timeLimitPhysical = null,
    this.timeLimitDigital = null,
    this.purposePhysical = null,
    this.purposeDigital = null,
  });
}

enum CertificateState {
  requested,
  pending,
  delivered,
  canceled,
}

class Certificate {
  int id;
  String type;
  CertificateState state;
  String downloadUrl;
  DateTime requestDate;

  Certificate(
    this.id,
    this.type,
    this.state,
    this.downloadUrl,
    this.requestDate,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'state': state.index,
      'downloadUrl': downloadUrl,
      'requestDate': requestDate.toIso8601String(),
    };
  }
}
