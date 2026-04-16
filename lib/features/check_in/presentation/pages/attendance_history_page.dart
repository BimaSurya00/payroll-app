import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payroll_app/core/theme/app_pallete.dart';
import 'package:payroll_app/features/check_in/data/models/attendance_history_response.dart';
import 'package:payroll_app/features/check_in/data/models/pagination.dart';
import 'package:payroll_app/features/check_in/presentation/bloc/attendance_bloc.dart';

class AttendanceHistoryPage extends StatefulWidget {
  const AttendanceHistoryPage({super.key});

  @override
  State<AttendanceHistoryPage> createState() => _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState extends State<AttendanceHistoryPage> {
  final ScrollController _scrollController = ScrollController();
  List<AttendanceHistoryItem> _history = [];
  Pagination? _pagination;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadHistory(page: 1);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      if (_pagination != null &&
          _pagination!.currentPage != null &&
          _pagination!.lastPage != null &&
          _pagination!.currentPage! < _pagination!.lastPage! &&
          !_isLoading) {
        _loadHistory(page: (_pagination!.currentPage! + 1));
      }
    }
  }

  void _loadHistory({required int page}) {
    if (!_isLoading) {
      setState(() => _isLoading = true);
      context.read<AttendanceBloc>().add(OnGetHistory(page: page));
    }
  }

  void _refresh() {
    setState(() {
      _history = [];
      _pagination = null;
    });
    _loadHistory(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      appBar: AppBar(
        title: const Text('Riwayat Absensi'),
        backgroundColor: AppPallete.primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<AttendanceBloc, AttendanceState>(
        listener: (context, state) {
          if (state is HistoryFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppPallete.red,
              ),
            );
          } else if (state is HistoryLoaded) {
            setState(() {
              if (state.pagination?.currentPage == 1) {
                _history = state.history;
              } else {
                _history.addAll(state.history);
              }
              _pagination = state.pagination;
              _isLoading = false;
            });
          }
        },
        child: BlocBuilder<AttendanceBloc, AttendanceState>(
          builder: (context, state) {
            if (state is HistoryLoading && _history.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (_history.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history,
                      size: 64,
                      color: AppPallete.textGrey.withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Belum ada riwayat absensi',
                      style: TextStyle(
                        color: AppPallete.textGrey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                _refresh();
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _history.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _history.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  final item = _history[index];
                  return _buildHistoryCard(item);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHistoryCard(AttendanceHistoryItem item) {
    // Parse date once
    DateTime? dateTime;
    if (item.date != null) {
      try {
        dateTime = DateTime.parse(item.date!);
      } catch (e) {
        dateTime = null;
      }
    }
    
    // Format date manually for Indonesian locale
    String date = '-';
    if (dateTime != null) {
      const months = [
        'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
      ];
      const days = [
        'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'
      ];
      final dayName = days[dateTime.weekday - 1];
      final monthName = months[dateTime.month - 1];
      date = '$dayName, ${dateTime.day} $monthName ${dateTime.year}';
    }
    
    // Format time
    String clockInTime = '-';
    String clockOutTime = '-';
    
    if (item.clockInTime != null) {
      try {
        final clockInDateTime = DateTime.parse(item.clockInTime!);
        clockInTime = '${clockInDateTime.hour.toString().padLeft(2, '0')}:${clockInDateTime.minute.toString().padLeft(2, '0')}';
      } catch (e) {
        clockInTime = '-';
      }
    }
    
    if (item.clockOutTime != null) {
      try {
        final clockOutDateTime = DateTime.parse(item.clockOutTime!);
        clockOutTime = '${clockOutDateTime.hour.toString().padLeft(2, '0')}:${clockOutDateTime.minute.toString().padLeft(2, '0')}';
      } catch (e) {
        clockOutTime = '-';
      }
    }

    Color statusColor = AppPallete.textGrey;
    IconData statusIcon = Icons.help_outline;
    
    if (item.status == 'PRESENT') {
      statusColor = AppPallete.green;
      statusIcon = Icons.check_circle;
    } else if (item.status == 'LATE') {
      statusColor = Colors.orange;
      statusIcon = Icons.access_time;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppPallete.primaryBlue,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      statusIcon,
                      size: 14,
                      color: statusColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      item.status ?? '-',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTimeInfo(
                  'Masuk',
                  clockInTime,
                  Icons.login,
                  AppPallete.green,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTimeInfo(
                  'Pulang',
                  clockOutTime,
                  Icons.logout,
                  AppPallete.red,
                ),
              ),
            ],
          ),
          if (item.scheduleName != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 14,
                  color: AppPallete.textGrey,
                ),
                const SizedBox(width: 6),
                Text(
                  item.scheduleName!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppPallete.textGrey,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimeInfo(
    String label,
    String time,
    IconData icon,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 14,
              color: color,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: AppPallete.textGrey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}
