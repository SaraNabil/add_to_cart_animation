import 'package:flutter/material.dart';

class SearchBarTextField extends StatefulWidget {
  final TextEditingController? searchTextController;
  final Function(String)? onChanged;
  final String hint;
  final bool isEnableWriting;
  final Widget? suffix;
  final Function? onTap;
  final bool? readOnly;
  final bool? autoFocus;

  const SearchBarTextField({
    Key? key,
    this.searchTextController,
    this.hint = '',
    this.onChanged,
    this.suffix,
    this.readOnly = false,
    this.onTap,
    this.isEnableWriting = true,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  State<SearchBarTextField> createState() => _SearchBarTextFieldState();
}

class _SearchBarTextFieldState extends State<SearchBarTextField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        _searchTextFieldWithResultContainer(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search_rounded),
        ),
      ],
    );
  }

  Widget _searchTextFieldWithResultContainer() {
    return Stack(
      children: [
        TextFormField(
          autofocus: widget.autoFocus!,
          onTap: () => widget.onTap!(),
          readOnly: widget.readOnly!,
          enabled: widget.isEnableWriting,
          style: const TextStyle(fontWeight: FontWeight.normal),
          validator: (value) => null,
          cursorColor: Colors.green,
          decoration:
              _searchTextField(hint: widget.hint, suffix: widget.suffix),
          controller: widget.searchTextController,
          onChanged: widget.onChanged,
          textInputAction: TextInputAction.search,
        ),
        _searchResultContainer(widget.searchTextController == null
            ? ''
            : widget.searchTextController!.text),
      ],
    );
  }

  Widget _searchResultContainer(String searchResult) {
    return Visibility(
      visible: _isVisible,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        height: 30,
        width: searchResult.length * 14 + 25,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Text(
                searchResult,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  widget.searchTextController!.text = '';
                  _isSearchResultVisible();
                });
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _isSearchResultVisible() {
    if (widget.searchTextController!.text.isNotEmpty) {
      setState(() {
        _isVisible = true;
      });
    } else {
      _isVisible = false;
    }
  }

  InputDecoration _searchTextField({String? hint, Widget? suffix}) =>
      InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13, horizontal: 40),
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.grey[200],
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[200]!),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      );
}
