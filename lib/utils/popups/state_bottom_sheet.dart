import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/icon_button.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

Future<Widget?> showCityStateBottomSheet({
  required List<Map<String, dynamic>> list,
  required String title,
  required BuildContext context,
  required Function(String value) onSelect,
  required String selectedValue,
}) async {
  // Create a scroll controller
  ScrollController scrollController = ScrollController();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext innercontext) {
      final dataKey = GlobalKey();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Find the index of the selected value
        int selectedIndex =
            list.indexWhere((element) => element['name'] == selectedValue);
        // Scroll to the selected index
        if (selectedIndex != -1) {
          scrollController.animateTo(
            selectedIndex * 50.0, // Adjust this value as needed
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });

      return Container(
        height: (MediaQuery.of(context).size.height * .875).h,
        width: MediaQuery.of(context).size.width.w,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xFF1721EE).withOpacity(.08),
                    width: 1.w,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.applyTextStyles(
                        styles: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                      height: 16.h,
                      child: CustomIconButton(
                        onTap: () => Navigator.pop(innercontext),
                        child: const Icon(
                          Icons.close,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: list.isNotEmpty
                  ? ListView.builder(
                      controller:
                          scrollController, // Assign scroll controller to ListView
                      scrollDirection: Axis.vertical,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: list.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Material(
                        color: Colors.transparent,
                        child: ListTile(
                          key: list[index]['name'] == selectedValue
                              ? dataKey
                              : null,
                          selected: list[index]['name'] == selectedValue,
                          onTap: () {
                            onSelect(list[index]['name']);
                            Navigator.pop(innercontext);
                          },
                          title: Text(
                            list[index]['name'],
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        'No Data Available',
                        style: AppTextStyles.applyTextStyles(
                          styles: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      );
    },
  );
}
