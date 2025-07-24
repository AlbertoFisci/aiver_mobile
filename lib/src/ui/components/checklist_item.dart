import 'package:flutter/material.dart';

class ChecklistItem extends StatefulWidget {
  final String zone;
  final List<dynamic> checklistData;

  const ChecklistItem({
    Key? key,
    required this.zone,
    required this.checklistData,
  }) : super(key: key);

  @override
  _ChecklistItemState createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<ChecklistItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header della zona
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.zone,
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: IconButton(
                icon: Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
            ),

            // Espansione della checklist
            if (isExpanded) ...[
              // Mostra le voci della checklist
              ...widget.checklistData.map<Widget>((checklist) {
                return ListTile(
                  title: Text(checklist['text']['it']),
                );
              }).toList(),

              // Sezione delle checklist speciali
              const SizedBox(height: 12),
              Text(
                "Per questa checklist sono attivabili le seguenti checklist speciali:",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 8),
              // Simulazione di checklist speciali per esempio
              Text("ATEX, Sicurezza Lavori in Quota"),
            ],
          ],
        ),
      ),
    );
  }
}
