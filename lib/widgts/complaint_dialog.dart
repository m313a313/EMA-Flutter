import 'package:flutter/material.dart';

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
    final colorback = Theme.of(context).colorScheme.background;
    final Color colorOnBack = Theme.of(context).colorScheme.onBackground;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomeDropdownButton(
              iconEnabledColor: colorOnBack,
              dropdownColor: colorback,
              color: colorOnBack,
              selectedReport: selectedReport,
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
            )),
        // SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            // Navigate to information entry screen based on selectedReport
            displayDialog(context, selectedReport);
          },
          child: Text("Enter Information"),
        )
      ],
    ));
  }

  displayDialog(BuildContext context, String selectedReport) {
    showDialog(
        context: context,
        builder: (context) {
          final colorback = Theme.of(context).colorScheme.background;
          final Color colorOnBack = Theme.of(context).colorScheme.onBackground;
          return Dialog(
            // backgroundColor:
            //     Theme.of(context).colorScheme.onBackground.withOpacity(.9),
            child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorOnBack.withOpacity(.9),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            " $selectedReport",
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                          DropdownDilog(),
                          TextFormFieldDes(
                            validator: (data) {
                              if (data == '') {
                                return 'Descrutpion is empty';
                              } else
                                return null;
                            },
                            labelText: 'Descrutpion',
                            colorback: colorback,
                            icon: Icons.message_outlined,
                            maxLines: 4,
                          ),
                          TextFormFieldPhone(
                            validator: (data) {
                              if (data == '') {
                                return 'Phone Num is empty';
                              } else
                                return null;
                            },
                            labelText: 'Phone',
                            colorback: colorback,
                            icon: Icons.phone,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      return;
                                    }
                                  },
                                  child: Text('Conferm')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('cancel')),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          );
        });
  }
}

class TextFormFieldPhone extends StatelessWidget {
  const TextFormFieldPhone({
    super.key,
    required this.colorback,
    this.icon,
    required this.labelText,
    this.validator,
  });

  final Color colorback;
  final IconData? icon;
  final String labelText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: validator,
        style: TextStyle(color: colorback),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          label: Text(
            labelText,
            style: TextStyle(color: Colors.blueGrey),
          ),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: colorback)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorback),
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: colorback)),
        ),
      ),
    );
  }
}

class TextFormFieldDes extends StatelessWidget {
  const TextFormFieldDes({
    super.key,
    required this.colorback,
    this.icon,
    required this.labelText,
    this.expands = false,
    this.maxLines = 1,
    this.validator,
  });

  final Color colorback;
  final IconData? icon;
  final String labelText;
  final bool expands;
  final int? maxLines;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      expands: expands,
      maxLines: maxLines,
      style: TextStyle(color: colorback),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        label: Text(
          labelText,
          style: TextStyle(color: Colors.blueGrey),
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: colorback)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorback),
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: colorback)),
      ),
    );
  }
}

class CustomeDropdownButton extends StatelessWidget {
  const CustomeDropdownButton(
      {super.key,
      this.selectedReport,
      this.items,
      this.onChanged,
      this.iconEnabledColor,
      this.dropdownColor,
      this.color});
  final String? selectedReport;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final Color? iconEnabledColor;
  final Color? dropdownColor;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
        ),
        child: DropdownButton<String>(
          iconEnabledColor: iconEnabledColor,
          dropdownColor: dropdownColor,
          // Colors.blue.shade300,
          style: TextStyle(color: color),
          padding: EdgeInsets.all(12),
          underline: const SizedBox(),
          value: selectedReport,
          isExpanded: true, // Fill available space
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class DropdownDilog extends StatefulWidget {
  const DropdownDilog({super.key});

  @override
  State<DropdownDilog> createState() => _DropdownDilogState();
}

class _DropdownDilogState extends State<DropdownDilog> {
  List<String> types = [
    "Finshing materials",
    "Not clean",
    "Expinsive",
    "Other",
  ];
  String selectedTepes = 'Finshing materials';
  @override
  Widget build(BuildContext context) {
    final colorback = Theme.of(context).colorScheme.background;
    final Color colorOnBack = Theme.of(context).colorScheme.onBackground;
    return CustomeDropdownButton(
      iconEnabledColor: colorback,
      dropdownColor: colorOnBack,
      color: colorback,
      selectedReport: selectedTepes,
      items: types.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedTepes = newValue!;
        });
      },
    );
  }
}
