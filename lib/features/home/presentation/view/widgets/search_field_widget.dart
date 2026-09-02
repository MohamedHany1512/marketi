import 'package:flutter/material.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  State<SearchFieldWidget> createState() =>
      _SearchFieldWidgetState();
}

class _SearchFieldWidgetState
    extends State<SearchFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        // context
            // .read<ProductsCubit>()
            // .searchProducts(value);
      },
      decoration: InputDecoration(
        hintText: 'What are you looking for?',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 13,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xff3F80FF),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.tune,
            color: Color(0xff3F80FF),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xff3F80FF),
          ),
        ),
      ),
    );
  }
}