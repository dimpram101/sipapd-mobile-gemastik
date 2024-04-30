import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sipapd_mobile/extensions/date_formatter.dart';
import 'package:sipapd_mobile/utils/string_utils.dart';
import 'package:sipapd_mobile/widgets/image_dialog.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionState();
}

class _DetectionState extends State<DetectionScreen> {
  List<DateTime?> dateFilter = [DateTime.now().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0)];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    IconData(0xef1e, fontFamily: 'MaterialIcons'),
                    size: 32,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Detections',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      var results = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(),
                        dialogSize: const Size(325, 400),
                      );

                      if (results != null) {
                        setState(() {
                          dateFilter = results;
                        });
                      }
                    },
                    label: Text(
                      dateFilter.first!.getDateOnlyString(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Flexible(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("detections").orderBy("time", descending: true).snapshots(),
              builder: (ctx, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No messages found'),
                  );
                }

                if (snapshots.hasError) {
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                }

                final detectionDocs = snapshots.data!.docs;

                return ListView.builder(
                  itemCount: detectionDocs.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey.shade300, width: 1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (_) => ImageDialog(
                              imgUrl: detectionDocs[index]["image_url"],
                            ),
                          );
                        },
                        title: Text(
                          detectionDocs[index]['attribute'].toString(),
                          //StringUtils.attributeFormatter(detectionDocs[index]['attribute']),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          detectionDocs[index]['time'].toString(),
                          //StringUtils.dateToString(detectionDocs[index]['time'], "_"),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
