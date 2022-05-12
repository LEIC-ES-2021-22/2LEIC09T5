import 'package:flutter/material.dart';
import 'package:uni/view/Pages/unnamed_page_view.dart';
import 'package:uni/view/Widgets/certificates_page_title.dart';

class RequestCertificatesPageView extends StatefulWidget {
  const RequestCertificatesPageView({Key key}) : super(key: key);

  @override
  RequestCertificatesPageViewState createState() =>
      RequestCertificatesPageViewState();
}

enum CertificateType {
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
}

String getCertificateLabel(CertificateType type) {
  switch(type) {
    case CertificateType.courseDiploma:
      return 'Carta de Curso - Grau de Licenciado';
    case CertificateType.schoolAchievement:
      return 'Certidão de Aproveitamento Escolar';
    case CertificateType.attendanceOfAcademicYearAndEnrolmentInTheFollowingYear:
      return 'Certidão de Frequência de um Ano Letivo e Inscrição no seguinte';
    case CertificateType.licenciadoDegree:
      return 'Certidão de Grau de Licenciado';
    case CertificateType.enrolmentInCurricularYear:
      return 'Certidão de Inscrição em Ano Curricular';
    case CertificateType.enrolmentInAcademicYear:
      return 'Certidão de Inscrição em Ano Letivo';
    case CertificateType.registrationInCourseUnits:
      return 'Certidão de Inscrição em Unidades Curriculares';
    case CertificateType.enrolment:
      return 'Certidão de Matrícula';
    case CertificateType.noRestrictionOnRegistration:
      return 'Certidão de Não Prescrição';
    case CertificateType.programmesAndCourseWorkloads:
      return 'Certidão de Programas e Cargas Horárias';
    case CertificateType.courseUnitsCompleted:
      return 'Certidão de Realização de Unidades Curriculares';
    case CertificateType.sub23Pass:
      return 'Passe sub23@superior.tp';
  }
}

class RequestCertificatesPageViewState extends UnnamedPageView {

  CertificateType certificateType = null;

  @override
  Widget getBody(BuildContext context) {
    return Column(
      children: [
        CertificatesPageTitle(),
        Form(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField(
                hint: Text('Escolher um certificado'),
                items: CertificateType.values.map((type) =>
                  DropdownMenuItem(
                    child: Text(getCertificateLabel(type)),
                    value: type,
                  )
                ).toList(),
                onChanged: (i) => certificateType = i,
                value: certificateType,
                isExpanded: true,
              ),
            ],
          ),
        ))
      ],
    );
  }
}
