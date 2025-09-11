import 'package:bookly_app/Features/Search/presentation/controllers/cubits/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? searchQuery;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter search query';
            }
            return null;
          },
          onChanged: (value) {
            searchQuery = value;
            setState(() {});
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            filled: true,
            fillColor: Colors.white.withOpacity(0.25),
            hintText: 'Search...',
            hintStyle: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
            suffixIcon: IconButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<SearchCubit>(
                    context,
                  ).searchBooks(searchQuery!);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              icon: Icon(FontAwesomeIcons.magnifyingGlass),
              iconSize: 18,
            ),
            border: buildOutLineInputBorder(),
            enabledBorder: buildOutLineInputBorder(),
            focusedBorder: buildOutLineInputBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    );
  }
}
