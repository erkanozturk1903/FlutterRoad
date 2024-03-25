import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/field_surveillance_form/models/field_surveiallance.dart';

class FormDetailsPage extends StatelessWidget {
  final FieldSurveillanceFormModel formModel;

  const FormDetailsPage({required this.formModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form_details'.tr),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('date'.tr),
              subtitle: Text(DateFormat('yyyy-MM-dd').format(formModel.date)),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('definition_of_nonconformity'.tr),
              subtitle: Text(formModel.definitionOfNonconformity),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('prepared_by'.tr),
              subtitle: Text(formModel.preparedBy),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('report_number'.tr),
              subtitle: Text(formModel.reportNumber),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('address_of_unit'.tr),
              subtitle: Text(formModel.addressOfUnit),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('responsible_unit'.tr),
              subtitle: Text(formModel.responsibleUnit),
            ),
            SizedBox(height: 16.0),
            // Add other fields as needed
          ],
        ),
      ),
    );
  }
}
