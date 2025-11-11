import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  static const Color primaryColor = Color(0xFF93679D);
  static const Color accentColor = Color(0xFFA995AE);
  static const Color backgroundColor = Color(0xFFEBEAE2);
  static const String sleepDiaryKey = 'sleepDiaryEntries';

  List<Map<String, String>> diaryEntries = [];
  bool isLoading = true;
  double avgSleepHours = 0.0;
  double avgSleepQuality = 0.0;
  int totalLogsCount = 0;
  bool showFormulaInfo = false;

  @override
  void initState() {
    super.initState();
    _loadAndCalculateStats();
  }

  Future<void> _loadAndCalculateStats() async {
    final prefs = await SharedPreferences.getInstance();
    final String? entriesString = prefs.getString(sleepDiaryKey);

    final List<Map<String, String>> tempEntries = [];

    if (entriesString != null) {
      try {
        final List<dynamic> decodedList = jsonDecode(entriesString);

        for (var entry in decodedList) {
          final Map<String, dynamic> dynamicMap = entry as Map<String, dynamic>;
          final Map<String, String> stringMap = {};
          dynamicMap.forEach((key, value) {
            stringMap[key] = value.toString();
          });
          tempEntries.add(stringMap);
        }
      } catch (e) {
        // Handle JSON decode error silently
      }
    }

    // Calculate statistics
    double totalHours = 0.0;
    double totalQuality = 0.0;
    int validQualityCount = 0;

    for (var entry in tempEntries) {
      // Calculate sleep duration from bedtime and wake time
      try {
        final goToBed = entry['Go to Bed'] ?? '';
        final wakeUp = entry['Wake Up'] ?? '';

        if (goToBed.isNotEmpty && wakeUp.isNotEmpty) {
          final sleepDuration = _calculateSleepDuration(goToBed, wakeUp);
          totalHours += sleepDuration;
        }

        // Parse sleep quality
        final qualityStr = entry['Quality'] ?? '';
        if (qualityStr.isNotEmpty) {
          final quality = double.tryParse(qualityStr) ?? 0;
          if (quality > 0) {
            totalQuality += quality;
            validQualityCount++;
          }
        }
      } catch (e) {
        // Skip entries with parsing errors
      }
    }

    setState(() {
      diaryEntries = tempEntries;
      totalLogsCount = tempEntries.length;
      avgSleepHours =
          totalLogsCount > 0 ? totalHours / totalLogsCount : 0.0;
      avgSleepQuality =
          validQualityCount > 0 ? totalQuality / validQualityCount : 0.0;
      isLoading = false;
    });
  }

  /// Calculate sleep duration in hours from bedtime (e.g., "10:30 PM") to wake time (e.g., "7:00 AM")
  double _calculateSleepDuration(String bedtime, String wakeTime) {
    try {
      final bedParts = bedtime.split(':');
      final wakeParts = wakeTime.split(':');

      int bedHour = int.parse(bedParts[0]);
      int bedMinute = int.parse(bedParts[1].split(' ')[0]);
      final bedPeriod = bedtime.contains('PM') ? 'PM' : 'AM';

      int wakeHour = int.parse(wakeParts[0]);
      int wakeMinute = int.parse(wakeParts[1].split(' ')[0]);
      final wakePeriod = wakeTime.contains('PM') ? 'PM' : 'AM';

      // Convert to 24-hour format
      if (bedPeriod == 'PM' && bedHour != 12) bedHour += 12;
      if (bedPeriod == 'AM' && bedHour == 12) bedHour = 0;

      if (wakePeriod == 'PM' && wakeHour != 12) wakeHour += 12;
      if (wakePeriod == 'AM' && wakeHour == 12) wakeHour = 0;

      // Calculate difference (assuming wake is next day if time is earlier)
      int bedTotalMinutes = bedHour * 60 + bedMinute;
      int wakeTotalMinutes = wakeHour * 60 + wakeMinute;

      if (wakeTotalMinutes < bedTotalMinutes) {
        wakeTotalMinutes += 24 * 60; // Add 24 hours
      }

      return (wakeTotalMinutes - bedTotalMinutes) / 60.0;
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 20.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Sleep Analytics',
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  // Stats boxes
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: Row(
                      children: [
                        // Average sleep duration
                        Expanded(
                          child: _buildStatBox(
                            title: 'Avg Sleep Duration',
                            value: '${avgSleepHours.toStringAsFixed(1)} hrs',
                            subtitle: '$totalLogsCount nights',
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Average sleep quality
                        Expanded(
                          child: _buildStatBox(
                            title: 'Avg Sleep Quality',
                            value: '${avgSleepQuality.toStringAsFixed(1)} / 5',
                            subtitle: 'Your rating',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Sleep quality trend (line chart placeholder)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sleep Improvement Trend',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildSleepImprovementChart(),
                          const SizedBox(height: 16),
                          // Formula info dropdown
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showFormulaInfo = !showFormulaInfo;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: primaryColor.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'How is this calculated?',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Icon(
                                    showFormulaInfo
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (showFormulaInfo)
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sleep Improvement Score:',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '(Sleep Duration / 9 hrs) × 50 + (Quality / 5) × 50',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Colors.grey[700],
                                        fontStyle: FontStyle.italic,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'This combines two factors: how long you sleep (targeting 9 hours) and quality rating (1-5). A score of 100 represents ideal sleep: 9 hours at quality level 5.',
                                      style: GoogleFonts.poppins(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Average sleep by day of week
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sleep Hours by Day',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildSleepHoursByDayChart(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Sleep logs history table
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sleep History',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        diaryEntries.isEmpty
                            ? Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'No sleep logs yet. Start logging your sleep!',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              )
                            : _buildSleepHistoryTable(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget _buildStatBox({
    required String title,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSleepImprovementChart() {
    if (diaryEntries.isEmpty) {
      return Center(
        child: Text(
          'No data yet',
          style: GoogleFonts.poppins(color: Colors.grey[400]),
        ),
      );
    }

    // Sort entries by date (oldest to newest)
    final sortedEntries = List<Map<String, String>>.from(diaryEntries);
    sortedEntries.sort((a, b) {
      final dateA = DateTime.tryParse(a['Date'] ?? '') ?? DateTime.now();
      final dateB = DateTime.tryParse(b['Date'] ?? '') ?? DateTime.now();
      return dateA.compareTo(dateB);
    });

    // Calculate improvement scores for each entry
    final scoreData = <(String, double)>[];
    for (var entry in sortedEntries) {
      try {
        final dateStr = entry['Date'] ?? '';
        final goToBed = entry['Go to Bed'] ?? '';
        final wakeUp = entry['Wake Up'] ?? '';
        final qualityStr = entry['Quality'] ?? '';

        if (dateStr.isNotEmpty &&
            goToBed.isNotEmpty &&
            wakeUp.isNotEmpty &&
            qualityStr.isNotEmpty) {
          final sleepDuration = _calculateSleepDuration(goToBed, wakeUp);
          final quality = double.tryParse(qualityStr) ?? 0;

          // Score formula: (duration/9) * 50 + (quality/5) * 50
          // Max = 100 (9 hours at quality 5)
          final durationScore = (sleepDuration / 9.0).clamp(0, 1) * 50;
          final qualityScore = (quality / 5.0).clamp(0, 1) * 50;
          final totalScore = (durationScore + qualityScore) as double;

          // Format date for display (e.g., "Nov 12")
          final date = DateTime.parse(dateStr);
          final dateDisplay =
              '${_monthAbbr(date.month)} ${date.day}';

          scoreData.add((dateDisplay, totalScore));
        }
      } catch (e) {
        // Skip entries with parsing errors
      }
    }

    if (scoreData.isEmpty) {
      return Center(
        child: Text(
          'No complete sleep data',
          style: GoogleFonts.poppins(color: Colors.grey[400]),
        ),
      );
    }

    // Find max and min for scaling
    final maxScore = scoreData.map((e) => e.$2).reduce((a, b) => a > b ? a : b);
    final minScore = scoreData.map((e) => e.$2).reduce((a, b) => a < b ? a : b);

    // Build line chart with dots
    const chartHeight = 180.0;
    const chartBottomPadding = 30.0;

    return SizedBox(
      height: chartHeight + chartBottomPadding,
      child: Stack(
        children: [
          // Grid and axes
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: chartBottomPadding,
            child: CustomPaint(
              painter: LineChartPainter(
                scores: scoreData.map((e) => e.$2).toList(),
                maxScore: maxScore,
                minScore: minScore,
                primaryColor: primaryColor,
              ),
              size: Size.infinite,
            ),
          ),
          // Date labels at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: chartBottomPadding,
            child: Row(
              children: List.generate(scoreData.length, (index) {
                return Expanded(
                  child: Center(
                    child: Text(
                      scoreData[index].$1,
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  String _monthAbbr(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  Widget _buildSleepHoursByDayChart() {
    if (diaryEntries.isEmpty) {
      return Center(
        child: Text(
          'No data yet',
          style: GoogleFonts.poppins(color: Colors.grey[400]),
        ),
      );
    }

    // Group by day of week and calculate average hours
    final dayHours = <int, List<double>>{};
    for (var entry in diaryEntries) {
      try {
        final dateStr = entry['Date'] ?? '';
        if (dateStr.isNotEmpty) {
          final date = DateTime.parse(dateStr);
          final dayOfWeek = date.weekday; // 1 = Monday, 7 = Sunday

          final goToBed = entry['Go to Bed'] ?? '';
          final wakeUp = entry['Wake Up'] ?? '';
          if (goToBed.isNotEmpty && wakeUp.isNotEmpty) {
            final duration = _calculateSleepDuration(goToBed, wakeUp);
            dayHours.putIfAbsent(dayOfWeek, () => []).add(duration);
          }
        }
      } catch (e) {
        // Skip entries with errors
      }
    }

    if (dayHours.isEmpty) {
      return Center(
        child: Text(
          'No sleep duration data',
          style: GoogleFonts.poppins(color: Colors.grey[400]),
        ),
      );
    }

    final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final maxHours = 12.0;

    return SizedBox(
      height: 120,
      child: Row(
        children: List.generate(7, (dayIndex) {
          final dayOfWeek = dayIndex + 1;
          final hoursForDay = dayHours[dayOfWeek] ?? [];
          final avgHours = hoursForDay.isEmpty
              ? 0.0
              : hoursForDay.reduce((a, b) => a + b) / hoursForDay.length;
          final height = (avgHours / maxHours) * 80;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    avgHours.toStringAsFixed(1),
                    style: GoogleFonts.poppins(
                      fontSize: 9,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    dayNames[dayIndex],
                    style: GoogleFonts.poppins(
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSleepHistoryTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header row
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    'Date',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    'Bedtime',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    'Wake',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    'Hrs',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Quality',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          // Data rows
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: diaryEntries.length,
            itemBuilder: (context, index) {
              final entry = diaryEntries[diaryEntries.length - 1 - index]; // Reverse to show newest first
              final date = entry['Date'] ?? 'N/A';
              final bedtime = entry['Go to Bed'] ?? 'N/A';
              final wakeup = entry['Wake Up'] ?? 'N/A';
              final quality = entry['Quality'] ?? 'N/A';

              final sleepHours = bedtime.isNotEmpty && wakeup.isNotEmpty
                  ? _calculateSleepDuration(bedtime, wakeup)
                      .toStringAsFixed(1)
                  : 'N/A';

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        date,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.grey[700],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        bedtime,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.grey[700],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        wakeup,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.grey[700],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        sleepHours,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getQualityColor(quality),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          quality,
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Color _getQualityColor(String qualityStr) {
    final quality = int.tryParse(qualityStr) ?? 0;
    if (quality <= 1) return Colors.red;
    if (quality == 2) return Colors.orange;
    if (quality == 3) return Colors.yellow[700]!;
    if (quality == 4) return Colors.lightGreen;
    return Colors.green;
  }
}

/// Custom painter for drawing a smooth line chart with dots
class LineChartPainter extends CustomPainter {
  final List<double> scores;
  final double maxScore;
  final double minScore;
  final Color primaryColor;

  LineChartPainter({
    required this.scores,
    required this.maxScore,
    required this.minScore,
    required this.primaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (scores.isEmpty) return;

    final paint = Paint()
      ..color = primaryColor
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final dotPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.1)
      ..strokeWidth = 1.0;

    // Draw horizontal grid lines
    for (int i = 0; i <= 4; i++) {
      final y = (size.height / 4) * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Calculate points
    final points = <Offset>[];
    final scoreRange = maxScore - minScore;

    for (int i = 0; i < scores.length; i++) {
      final x = (size.width / (scores.length - 1)) * i;
      // Normalize score to 0-1, then map to canvas height
      final normalizedScore =
          scoreRange > 0 ? (scores[i] - minScore) / scoreRange : 0.5;
      final y = size.height - (normalizedScore * size.height);
      points.add(Offset(x, y));
    }

    // Draw connecting line
    if (points.length > 1) {
      for (int i = 0; i < points.length - 1; i++) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }

    // Draw dots at each point
    for (final point in points) {
      canvas.drawCircle(point, 4.0, dotPaint);
      // White center for better visibility
      canvas.drawCircle(
        point,
        2.0,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill,
      );
    }

    // Draw y-axis labels (score range)
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
    for (int i = 0; i <= 4; i++) {
      final y = (size.height / 4) * i;
      final score =
          maxScore - (scoreRange * i / 4); // Descending from max to min
      final text = score.toStringAsFixed(0);
      textPainter.text = TextSpan(
        text: text,
        style: const TextStyle(color: Colors.grey, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-35, y - textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(LineChartPainter oldDelegate) {
    return oldDelegate.scores != scores ||
        oldDelegate.maxScore != maxScore ||
        oldDelegate.minScore != minScore;
  }
}
