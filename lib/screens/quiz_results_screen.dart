import 'package:flutter/material.dart';
import 'package:islamic_study_app/screens/question_screen.dart';
import 'package:islamic_study_app/models/quiz_model.dart';

class QuizResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String categoryName;
  final List<Question> questions;
  final Duration? duration;

  const QuizResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.categoryName,
    required this.questions,
    required this.duration,
  });
  
    // Helper function to turn Duration into "00:00" format
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
  

  String _getFeedbackMessage(int percentage) {
    if (percentage >= 80) {
      return "MashaAllah!";
    } else if (percentage >= 50) {
      return "Well Done!";
    } else {
      return "Keep Learning!";
    }
  }

  String _getSubtitleMessage(int percentage) {
    if (percentage >= 80) {
      return "You mastered this topic beautifully.";
    } else if (percentage >= 50) {
      return "You're doing great! Just a bit more practice.";
    } else {
      return "Don't give up! Knowledge is a journey.";
    }
  }


  @override
  Widget build(BuildContext context) {
    // Dynamic calculations
    double accuracy = score / totalQuestions;
    int percentage = (accuracy * 100).toInt();
    int incorrect = totalQuestions - score;

    return Scaffold(
      backgroundColor: const Color(0xFF064E3B), // Dark Forest Green
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Accuracy Circle
                  _buildAccuracyGauge(accuracy, percentage),
                  // Inside your Column in QuizResultsScreen
                  const SizedBox(height: 30),

                  Text(
                    _getFeedbackMessage(percentage),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    _getSubtitleMessage(percentage),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 40),

                  // Stats Grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _buildStatCard(
                              "CORRECT",
                              "$score",
                              Icons.check_circle,
                              Colors.green,
                            ),
                            const SizedBox(width: 16),
                            _buildStatCard(
                              "INCORRECT",
                              "$incorrect",
                              Icons.cancel,
                              Colors.red,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _buildStatCard(
                              "TIME",
                              _formatDuration(duration ?? Duration.zero),
                              Icons.timer,
                              Colors.blue,
                            ),
                            _buildStatCard(
                              "POINTS",
                              "+${score * 10}",
                              Icons.bolt,
                              Colors.amber,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Bottom Performance Sheet
          _buildPerformanceSheet(percentage, context),
        ],
      ),
    );
  }

  Widget _buildAccuracyGauge(double value, int percent) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 180,
          width: 180,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: 12,
            backgroundColor: Colors.white10,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color(0xFFFACC15),
            ), // Gold/Amber
          ),
        ),
        Column(
          children: [
            Text(
              "$percent%",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "ACCURACY",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 18),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceSheet(int percentage, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Performance",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                "$percentage%",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF064E3B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Reusable Progress bar for the topic
          LinearProgressIndicator(
            value: percentage / 100,
            minHeight: 10,
            backgroundColor: const Color(0xFFF1F5F9),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF064E3B)),
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 32),
          // Play Again Button
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                // Navigation logic to restart quiz
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(
                      categoryName: categoryName,
                      questions: questions, // Pass the same list back here,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC49F3D), // Gold button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Play Again",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
