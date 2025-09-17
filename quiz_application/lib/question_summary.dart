import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // Set a specific height for the scrollable area
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: (data['user_answer'] as String) == (data['correct_answer'] as String)
                            ? Colors.green[600]
                            : Colors.red[600],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Your Answer: ${data['user_answer']}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 181, 254, 246),
                            ),
                          ),
                          Text(
                            'Correct Answer: ${data['correct_answer']}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 150, 255, 237),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ).toList(), // Convert the iterable to a List
        ),
      ),
    );
  }
}