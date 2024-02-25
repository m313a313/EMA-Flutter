import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ComplaintDialog extends StatelessWidget {
  ComplaintDialog({super.key});
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: OutlinedButton(
              onPressed: () {
                displayDialog(context);
              },
              child: Text('Press'))),
    );
  }

  displayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return  Dialog(
            child: Form(
              key: formkey,
              child: SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
