import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import 'quiz_results_screen.dart';
import 'dart:async';

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;
  final String categoryName;

  const QuestionScreen({
    super.key,
    required this.questions,
    required this.categoryName,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _secondsRemaining = 15; // Set your desired time per question
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _startTime = DateTime.now();
  }

  void _startTimer() {
    // Reset timer to 15 seconds for each new question
    _secondsRemaining = 15;

    // Cancel any existing timer before starting a new one
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
          _onTimeUp(); // Handle what happens when time runs out
        }
      });
    });
  }

  void _onTimeUp() {
    // Logic for when the user runs out of time
    // For example: Move to next question or show 'Time's Up'
    _handleAnswer(-1); // Pass a dummy index to show it's wrong
  }

  @override
  void dispose() {
    _timer?.cancel(); // IMPORTANT: Always cancel timer to avoid memory leaks
    super.dispose();
  }

  int _currentIndex = 0;
  int? _selectedIndex;
  bool _isAnswered = false;
  int _score = 0;
  late DateTime _startTime;
  // @override
  // void initState() {
  //   super.initState();
  //   _startTime = DateTime.now(); // Mark the start time immediately
  // }

  void _handleAnswer(int index) {
    if (_isAnswered) return;
    setState(() {
      _selectedIndex = index;
      _isAnswered = true;
      if (index == widget.questions[_currentIndex].correctAnswerIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedIndex = null;
        _isAnswered = false;
      });
      _startTimer(); // Restart timer for the next question
    } else {
      DateTime endTime = DateTime.now();
      Duration timeTaken = endTime.difference(_startTime);
      // THIS IS THE MOMENT WE GO TO THE RESULTS PAGE
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultsScreen(
            score: _score, // Passing the score we calculated
            totalQuestions: widget.questions.length, // Total count
            categoryName: widget.categoryName, // E.g., "Prophets" or "Quran"
            questions: widget.questions,
            duration: timeTaken, // Pass the time taken
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentIndex];
    final double progress = (_currentIndex + 1) / widget.questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFC),
      body: Stack(
        children: [
          CustomPaint(size: Size.infinite, painter: CrossPatternPainter()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildHeader(),
                  const SizedBox(height: 30),

                  // Progress & Info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "QUESTION ${_currentIndex + 1} / ${widget.questions.length}",
                        style: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildTimer(),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.categoryName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildProgressBar(progress),

                  const SizedBox(height: 40),
                  _buildQuestionText(currentQuestion.questionText),
                  const SizedBox(height: 40),

                  // Options List
                  Expanded(
                    child: ListView.builder(
                      itemCount: currentQuestion.options.length,
                      itemBuilder: (context, index) {
                        return _buildOptionCard(
                          index: index,
                          text: currentQuestion.options[index],
                          isCorrect:
                              currentQuestion.correctAnswerIndex == index,
                        );
                      },
                    ),
                  ),

                  _buildSubmitButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _circleIcon(Icons.chevron_left),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            children: [
              const Icon(Icons.stars, color: Color(0xFFC49F3D), size: 18),
              const SizedBox(width: 8),
              Text(
                widget.categoryName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        _circleIcon(Icons.more_horiz),
      ],
    );
  }

  Widget _circleIcon(IconData icon) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(color: const Color(0xFFE2E8F0)),
    ),
    child: IconButton(
      icon: Icon(icon, color: Colors.black, size: 20),
      onPressed: () => Navigator.pop(context),
    ),
  );

  Widget _buildTimer() {
    // Format seconds to always show two digits (e.g., 09 instead of 9)
    String timeString = _secondsRemaining.toString().padLeft(2, '0');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.timer_outlined, color: Color(0xFF2DC194), size: 16),
          const SizedBox(width: 6),
          Text(
            "00 : $timeString",
            style: TextStyle(
              color: _secondsRemaining <= 5 ? Colors.red : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double value) => ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: LinearProgressIndicator(
      value: value,
      minHeight: 8,
      backgroundColor: const Color(0xFFEDF2F7),
      valueColor: const AlwaysStoppedAnimation(Color(0xFF2DC194)),
    ),
  );

  Widget _buildQuestionText(String text) => Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 26,
      fontWeight: FontWeight.w800,
      height: 1.3,
    ),
  );

  Widget _buildOptionCard({
    required int index,
    required String text,
    required bool isCorrect,
  }) {
    bool isSelected = _selectedIndex == index;
    // Color logic: if answered, show green for correct, red for wrong selection.
    Color borderColor = Colors.transparent;
    if (isSelected) borderColor = const Color(0xFF2DC194);

    String letter = String.fromCharCode(65 + index); // A, B, C, D

    return GestureDetector(
      onTap: () => _handleAnswer(index),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: borderColor, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFF1F5F9),
                    radius: 20,
                    child: Text(
                      letter,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  _buildRadioCircle(isSelected),
                ],
              ),
            ),
            if (_isAnswered && isCorrect)
              const Positioned(
                top: -6,
                right: -6,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xFF2DC194),
                  child: Icon(Icons.check, color: Colors.white, size: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioCircle(bool selected) => Container(
    width: 22,
    height: 22,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: selected ? const Color(0xFF2DC194) : const Color(0xFFCBD5E1),
        width: 2,
      ),
    ),
    child: selected
        ? const Center(
            child: CircleAvatar(backgroundColor: Color(0xFF2DC194), radius: 5),
          )
        : null,
  );

  Widget _buildSubmitButton() => Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF2DC194).withOpacity(0.3),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: ElevatedButton(
      onPressed: _isAnswered ? _nextQuestion : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2DC194),
        disabledBackgroundColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _currentIndex == widget.questions.length - 1
                ? "Finish Quiz"
                : "Next Question",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.black),
        ],
      ),
    ),
  );
}

// Custom Painter for the (+) Background
class CrossPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..strokeWidth = 1;
    for (double i = 0; i < size.width; i += 30) {
      for (double j = 0; j < size.height; j += 30) {
        canvas.drawLine(Offset(i - 3, j), Offset(i + 3, j), paint);
        canvas.drawLine(Offset(i, j - 3), Offset(i, j + 3), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
