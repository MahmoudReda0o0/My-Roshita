import 'package:flutter/material.dart';
import 'package:my_roshita/constant.dart';
import 'package:my_roshita/view/reshita/roshita_enter_details.dart';
import 'package:my_roshita/view/reshita/test_pdf.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.green,
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          cardProfile(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoshitalDetails(),
                ),
              );
            },
            child: Container(
              height: 50,
              width: 300,
              child: const Center(
                child: Text(
                  'تفاصيل الروشيتة',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Container(
              height: 50,
              width: 300,
              child: const Center(
                child: Text(
                  'كشف مريض ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Card cardProfile() {
    return Card(
      margin: EdgeInsets.all(10),
      color: ColorApp.green,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.blueGrey,
                child: const Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/m2.jpg'),
                ),
              ),
              const Column(
                children: [
                  Text(
                    'الاسم : محمود رضا هاشم',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'التخصص : اخصائي عظام ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'اضغط لتعديل البيانات الشخصية',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
