import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:my_roshita/controller/roshita_provider.dart';
import 'package:my_roshita/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:open_filex/open_filex.dart';
import 'package:provider/provider.dart';

class RoshitaPdf {
  static late Font arFont;
  static fontinit() async {
    arFont = Font.ttf(
        await rootBundle.load('assets/roshita_pdf/fonts/Amiri-Regular.ttf'));
  }

  static Future<File> pdfFile() async {
    print('start create pdf');
    String path = (await getApplicationDocumentsDirectory()).path;
    File file = File(path + 'roshita.pdf');
    print(file.path);

    Document pdf = Document();
    try {
      pdf.addPage(_createPage());
    } catch (e) {
      print(e);
    }
    Uint8List bytes = await pdf.save();
    file.writeAsBytes(bytes);

    return file;
  }

  static openFilePdf({required File file}) async {
    try {
      await OpenFilex.open(
        file.path,
      );
    } catch (e) {
      print('catch error : $e');
    }
    print('end create pdf');
    //OpenFile.open(file.path);
  }

  static openCachedPdfViewer({required File file}) {
    PDF().cachedFromUrl(file.path);
  }

  static _createPage() {
    return Page(
      theme: ThemeData.withFont(base: arFont),
      pageFormat: PdfPageFormat.a4, // h : 25 , w : infinity
      textDirection: TextDirection.rtl,
      build: (context) {
        return Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            headerDoctorDetails(), // h: 4
            SizedBox(height: PdfPageFormat.cm * 0.2),
            patientDetails(), // h: 1.4
            SizedBox(height: PdfPageFormat.cm * 0.2),
            bodyMedicineDetails(), // h : 16
            //SizedBox(height: PdfPageFormat.cm * 0.2),
            footerJobDetails(), // h : 3
          ],
        );
      },
    );
  }

  static Stack footerJobDetails() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: PdfPageFormat.cm * 3.8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: PdfColors.green,
            borderRadius: BorderRadius.circular(PdfPageFormat.cm * 1),
          ),
        ),
        Container(
          height: PdfPageFormat.cm * 3.4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: PdfColors.white,
            borderRadius: BorderRadius.circular(PdfPageFormat.cm * 1),
          ),
        ),
        Container(
          height: PdfPageFormat.cm * 3.1,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: PdfColors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(PdfPageFormat.cm * 1),
              topRight: Radius.circular(PdfPageFormat.cm * 1),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Text(
                  '${Provider.of<ProviderRoshitaDetails>(navigationKey.currentContext!, listen: false).jobTime}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: PdfPageFormat.cm * 0.5,
                  ),
                ),
              ),
              Text(
                '${Provider.of<ProviderRoshitaDetails>(navigationKey.currentContext!, listen: false).teleNumber}',
                style: const TextStyle(fontSize: PdfPageFormat.cm * 0.5),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Container bodyMedicineDetails() {
//     final ByteData image = await rootBundle.load('assets/image/your_image.jpg');

// Uint8List imageData = (image).buffer.asUint8List();
    return Container(
      height: PdfPageFormat.cm * 16,
      width: double.infinity,
      // color: PdfColors.green,
      // child: PdfLogo(),
    );
  }

  static Container patientDetails() {
    return Container(
      padding: const EdgeInsets.only(
          left: PdfPageFormat.cm * 0.2, right: PdfPageFormat.cm * 0.2),
      height: PdfPageFormat.cm * 1.3,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(PdfPageFormat.cm * 0.2),
        border:
            Border.all(color: PdfColors.grey600, width: PdfPageFormat.cm * 0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الاسم: ${Provider.of<ProviderRoshitaDetails>(navigationKey.currentContext!, listen: false).patientName}',
            style: const TextStyle(
                color: PdfColors.black, fontSize: PdfPageFormat.cm * 0.5),
          ),
          Text(
            'السن: ${Provider.of<ProviderRoshitaDetails>(navigationKey.currentContext!, listen: false).age}',
            style: const TextStyle(
                color: PdfColors.black, fontSize: PdfPageFormat.cm * 0.5),
          ),
          Text(
            'التاريخ: ${Provider.of<ProviderRoshitaDetails>(navigationKey.currentContext!, listen: false).dateTime}',
            style: const TextStyle(
                color: PdfColors.black, fontSize: PdfPageFormat.cm * 0.5),
          ),
        ],
      ),
    );
  }

  static Stack headerDoctorDetails() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: PdfPageFormat.cm * 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: PdfColors.green,
            borderRadius: BorderRadius.circular(PdfPageFormat.cm * 1),
          ),
        ),
        Container(
          height: PdfPageFormat.cm * 4,
          width: PdfPageFormat.cm * 16.5,
          decoration: BoxDecoration(
            color: PdfColors.white,
            borderRadius: BorderRadius.circular(PdfPageFormat.cm * 1),
          ),
        ),
        Container(
          height: PdfPageFormat.cm * 4,
          width: PdfPageFormat.cm * 16,
          decoration: BoxDecoration(
            color: PdfColors.blue,
            borderRadius: BorderRadius.circular(PdfPageFormat.cm * 1),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: PdfLogo(),
          ),
        ),
        Container(
          height: PdfPageFormat.cm * 4,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(PdfPageFormat.cm * 0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'د/ ${Provider.of<ProviderRoshitaDetails>(navigationKey.currentContext!, listen: false).doctorName}',
                  style: const TextStyle(
                    color: PdfColors.white,
                    fontSize: PdfPageFormat.cm * 0.6,
                  ),
                ),
                Text(
                  'التخصص / ${Provider.of<ProviderRoshitaDetails>(navigationKey.currentContext!, listen: false).doctorSpecialty}',
                  style: const TextStyle(
                    color: PdfColors.white,
                    fontSize: PdfPageFormat.cm * 0.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
