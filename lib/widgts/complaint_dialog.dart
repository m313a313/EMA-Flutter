import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComplaintDialog extends StatefulWidget {
  const ComplaintDialog({super.key});

  @override
  State<ComplaintDialog> createState() => _ComplaintDialogState();
}

class _ComplaintDialogState extends State<ComplaintDialog> {
  List<String> reportTypes = [
    "Sales Report",
    "Inventory Report",
    "Customer Report"
  ];

  final GlobalKey<FormState> formkey = GlobalKey();
  String selectedReport = 'Sales Report';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
            ),
            child: DropdownButton<String>(
              padding: EdgeInsets.all(12),
              underline: const SizedBox(),
              value: selectedReport,
              isExpanded: true, // Fill available space
              items: reportTypes.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedReport = newValue!;
                });
              },
            ),
          ),
        ),
        // SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            // Navigate to information entry screen based on selectedReport
            displayDialog(context, selectedReport);
          },
          child: Text("Enter Information"),
        )
      ],
    )
        // Center(
        //     child: OutlinedButton(
        //         onPressed: () {
        //           displayDialog(context);
        //         },
        //         child: Text('Press'))),
        );
  }

  displayDialog(BuildContext context, String selectedReport) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Form(
              key: formkey,
              child: SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Report: $selectedReport",
                        style: const TextStyle(fontSize: 18),
                      ),
                      CustomTextFiled(
                        filedName: 'Phone',
                        numericText: true,
                        maxLentgh: 9,
                      ),
                      CustomTextFiled(
                        filedName: 'Description',
                        maxline: true,
                        maxLentgh: 200,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    required this.filedName,
    this.maxline = false,
    this.numericText = false,
    this.maxLentgh,
    super.key,
  });
  final String filedName;
  final int? maxLentgh;
  final bool maxline, numericText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: SizedBox(
            //   height: 66,
            width: double.infinity,
            child: TextField(
                maxLength: maxLentgh,
                minLines: maxline ? 4 : 1,
                maxLines: null,
                //  keyboardType: maxline ? TextInputType.multiline : null,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        bottom: 4, left: 12, top: 12, right: 12),
                    labelStyle: TextStyle(color: Colors.amber),
                    labelText: filedName,
                    border: maxline
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))
                        : null

                    //    filled: true,
                    //fillColor: Colors.green
                    ),
                keyboardType: numericText ? TextInputType.number : null,
                inputFormatters: numericText
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ]
                    : null)),
      ),
    );
  }
}
