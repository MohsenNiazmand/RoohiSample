import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roohi_sample/config/l10n/app_localization_helper.dart';
import 'package:roohi_sample/config/theme/app_styles.dart';
import 'package:roohi_sample/core/constants/colors.dart';
import 'package:roohi_sample/core/constants/dimentions.dart';
import 'package:roohi_sample/presentation/widgets/primary_gap.dart';
import 'package:roohi_sample/presentation/widgets/primary_rectangle.dart';
import 'package:roohi_sample/presentation/widgets/primary_textfield.dart';
import 'package:roohi_sample/presentation/widgets/primary_toast.dart';
import 'package:roohi_sample/presentation/widgets/primary_widget.dart';
import 'package:roohi_sample/resources/resources.dart';

class FacultyProfile extends HookConsumerWidget {
  const FacultyProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    void performAction(){
      if (formKey.currentState?.saveAndValidate() ?? false) {
        PrimaryToast.show(context.tr.successful);
      }
    }

    return Scaffold(
      backgroundColor: cBackground,
      appBar: AppBar(
        backgroundColor: cWhite,
        surfaceTintColor: cWhite,
        elevation: dimen6,
        // This adds the shadow
        shadowColor: cShadow,
        toolbarHeight: dimen56,
        title: Container(
            padding: const EdgeInsets.all(dimen16),
            child: Row(
              children: [
                SvgPicture.asset(
                  AssetIcons.academiIcon,
                ),
              ],
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: dimen12),
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                //could open drawer ...
                // Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: dimen32),
          child: Column(
            children: [
              Gap.v32(),
              Row(
                children: [
                  Text(
                   context.tr.facultyInformation,
                    style: AppStyles().styleText_14_600(),
                  ),
                ],
              ),
              Gap.v16(),
              PrimaryRectangle(
                padding: const EdgeInsets.all(dimen16),
                width: MediaQuery.sizeOf(context).width,
                radius: dimen8,
                child: FormBuilder(
                  key: formKey,
                  child: Column(
                    children: [
                      PrimaryTextField(
                        label: context.tr.firstName,
                        name: 'fName',
                        isRequired: true,
                        labelPadding: const EdgeInsets.only(bottom: dimen8),
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      Gap.v20(),
                      PrimaryTextField(
                        label: context.tr.lastName,
                        name: 'lName',
                        isRequired: true,
                        labelPadding: const EdgeInsets.only(bottom: dimen8),
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      Gap.v20(),
                      PrimaryTextField(
                        label: context.tr.email,
                        name: 'email',
                        isRequired: true,
                        labelPadding: const EdgeInsets.only(bottom: dimen8),
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      Gap.v20(),
                      PrimaryTextField(
                        label: context.tr.university,
                        name: 'university',
                        labelPadding: const EdgeInsets.only(bottom: dimen8),
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      Gap.v20(),
                      PrimaryTextField(
                        label: context.tr.department,
                        name: 'department',
                        isRequired: true,
                        labelPadding: const EdgeInsets.only(bottom: dimen8),
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      Gap.v20(),
                      PrimaryTextField(
                        label: context.tr.labWebsite,
                        name: 'labWebsite',
                        labelPadding: const EdgeInsets.only(bottom: dimen8),
                        onEditingComplete: () {
                          FocusScope.of(context).nextFocus();
                        },
                      ),
                      Gap.v20(),
                      PrimaryTextField(
                        label: context.tr.googleScholarLink,
                        name: 'googleLink',
                        labelPadding: const EdgeInsets.only(bottom: dimen8),
                        onEditingComplete: ()=>performAction(),
                      ),
                    ],
                  ),
                ),
              ),
              Gap.v20(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PrimaryButton(onPress: ()=>performAction(),text: context.tr.update,),
                ],
              ),
              Gap.v32(),

            ],
          ),
        ),
      ),
    );
  }
}


