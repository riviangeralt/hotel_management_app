import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/auth/controllers/location_info/location_info_controller.dart';
import 'package:hotel_booking_app/utils/popups/state_bottom_sheet.dart';
import 'package:hotel_booking_app/utils/static/state_list.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:hotel_booking_app/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class LocationInfoForm extends StatelessWidget {
  const LocationInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationInfoController());
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plot address of Hotel',
              style: AppTextStyles.applyTextStyles(
                styles: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: controller.addressController,
              validator: AppValidator.validateAddress,
              decoration: const InputDecoration(
                hintText: 'Enter the address of hotel',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              'State of Location',
              style: AppTextStyles.applyTextStyles(
                styles: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: controller.stateController,
              validator: controller.validateState,
              readOnly: true,
              onTap: () => showCityStateBottomSheet(
                title: 'Select a State',
                list: statesList,
                context: context,
                onSelect: controller.onSelectState,
                selectedValue: controller.stateController.text,
              ),
              decoration: const InputDecoration(
                hintText: 'Select a state',
                suffixIcon: Icon(Iconsax.arrow_down_1),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              'City of Location',
              style: AppTextStyles.applyTextStyles(
                styles: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Obx(
              () => TextFormField(
                controller: controller.cityController,
                validator: controller.validateState,
                readOnly: true,
                enabled: controller.isCityFieldDisabled.isFalse,
                onTap: () => showCityStateBottomSheet(
                  title: 'Select a City',
                  list: controller.stateWiseCities,
                  context: context,
                  onSelect: controller.onSelectCity,
                  selectedValue: controller.cityController.text,
                ),
                decoration: InputDecoration(
                  hintText: 'Select a city',
                  suffixIcon: Icon(
                    controller.isCityFieldDisabled.isFalse
                        ? Iconsax.arrow_down_1
                        : Iconsax.slash,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
