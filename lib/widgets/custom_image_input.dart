import 'package:flutter/material.dart';

class CustomImageInput extends StatefulWidget {
  final TextEditingController imageController;
  final String label;

  const CustomImageInput({
    super.key,
    required this.imageController,
    required this.label,
  });

  @override
  State<CustomImageInput> createState() => _CustomImageInputState();
}

class _CustomImageInputState extends State<CustomImageInput> {
  @override
  var image;

  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: image != null && image!.isNotEmpty
              ? Image.network(
                  image!,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                )
              : Text("Rasm kiriting"),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextField(
          decoration: InputDecoration(label: Text(widget.label)),
          controller: widget.imageController,
          onSubmitted: (value) {
            setState(() {
              image = value;
            });
          },
        ))
      ],
    );
  }
}
