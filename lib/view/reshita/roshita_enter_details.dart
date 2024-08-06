import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_roshita/constant.dart';
import 'package:my_roshita/controller/roshita_provider.dart';
import 'package:my_roshita/view/reshita/reshita_pdf_body.dart';
import 'package:my_roshita/view/widget/roshita_detail_textField.dart';
import 'package:provider/provider.dart';

class RoshitalDetails extends StatelessWidget {
  const RoshitalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController doctorName = TextEditingController();
    TextEditingController doctorSpecialty = TextEditingController();
    TextEditingController patientName = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController jobTime = TextEditingController();
    TextEditingController teleNumber = TextEditingController();
    double bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboard = bottomInsets != 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appBar(),
        body: Consumer<ProviderRoshitaDetails>(builder: (context, _, child) {
          return ListView(
            children: [
              RoshitaDetailTextField(
                controller: doctorName,
                lableText: 'اسم الدكتور',
                enableInt: false,
              ),
              RoshitaDetailTextField(
                controller: doctorSpecialty,
                lableText: "التخصص",
                enableInt: false,
              ),
              RoshitaDetailTextField(
                controller: patientName,
                lableText: 'اسم المريض',
                enableInt: false,
              ),
              RoshitaDetailTextField(
                controller: age,
                lableText: 'سن المريض',
                enableInt: true,
              ),
              RoshitaDetailTextField(
                controller: jobTime,
                lableText: 'مواقيد العمل',
                enableInt: false,
              ),
              RoshitaDetailTextField(
                controller: teleNumber,
                lableText: 'رقم الهاتف',
                enableInt: true,
              ),
              ElevatedButton(
                onPressed: () {
                  _.editDoctorName(
                      doctorName: doctorName.text,
                      doctorSpecialty: doctorSpecialty.text,
                      patientName: patientName.text,
                      age: age.text,
                      jobTime: jobTime.text,
                      teleNumber: teleNumber.text);
                },
                child: Text('text field Test'),
              ),
              ElevatedButton(
                onPressed: () async {
                  _.editDateTime();
                  File file = await RoshitaPdf.pdfFile();
                  RoshitaPdf.openFilePdf(file: file);
                },
                child: const Center(
                  child: Text('فتح الروشيتة PDF'),
                ),
              ),
              SizedBox(
                height: (isKeyboard) ? bottomInsets : 0,
              )
            ],
          );
        }),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('تفاصيل الروشيتة'),
      centerTitle: true,
    );
  }
}
