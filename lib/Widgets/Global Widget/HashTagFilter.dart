import '../../Constants/TextThemes.dart';
import '../../Constants/colors.dart';
import 'package:flutter/material.dart';

class FilterHashtag extends StatefulWidget {
  final double height;
  Icon? prefixIcon;
  Icon? suffixIcon;
  final List<String> suggestions;
  final String? text;
  FilterHashtag({
    super.key,
    required this.suggestions,
    this.height = 40,
    this.prefixIcon,
    this.suffixIcon,
    this.text,
  });

  @override
  State<FilterHashtag> createState() => _FilterHashtagState();
}

class _FilterHashtagState extends State<FilterHashtag> {
  String? selectedValue;

  List<String> filteredSuggestions = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        filteredSuggestions = widget.suggestions
            .where((suggestion) => suggestion
                .toLowerCase()
                .contains(_controller.text.toLowerCase()))
            .toList();
      });
    });
  }

  void _selectSuggestion(String suggestion) {
    setState(() {
      selectedValue = suggestion;
      _controller.clear();
    });
  }

  void _removeSelection() {
    setState(() {
      selectedValue = null;
    });
  }

  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // _controller = TextEditingController(text: widget.text);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height,
          child: TextField(
            showCursor: false,
            focusNode: _focusNode,
            controller: _controller,
            style: AppTextTheme.allTextTheme.labelLarge,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                borderSide: BorderSide(
                  color: ConstantColors.borderGrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                borderSide: BorderSide(
                  color: ConstantColors.borderGrey,
                ),
              ),
            ),
          ),
        ),
        if (_focusNode.hasFocus)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
              color: ConstantColors.borderGrey2,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredSuggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredSuggestions[index]),
                  onTap: () {
                    _selectSuggestion(filteredSuggestions[index]);
                    _focusNode.unfocus();
                  },
                );
              },
            ),
          ),
        if (selectedValue != null)
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: ConstantColors.primaryGreen.withOpacity(0.1),
              border: Border.all(
                color: ConstantColors.primaryGreen,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  selectedValue!,
                  style: AppTextTheme.allTextTheme.titleSmall!.copyWith(
                    fontSize: 16,
                  ),
                ),
                const Expanded(child: SizedBox(width: 10)),
                GestureDetector(
                  onTap: _removeSelection,
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
