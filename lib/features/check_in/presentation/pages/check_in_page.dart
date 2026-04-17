import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../init_dependencies.dart';
import '../../data/models/attendance_status.dart';
import '../../../company/data/models/company_response.dart';
import '../../../company/domain/usecases/get_current_company.dart';
import '../bloc/attendance_bloc.dart';
import '../widgets/check_in_header.dart';
import '../widgets/location_card.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  late final GetCurrentCompany _getCurrentCompany;
  late LocationService _locationService;

  CompanyData? _companyData;
  LocationResult? _currentLocation;
  String? _locationError;
  bool _isLoadingCompany = false;
  bool _isLoadingLocation = false;

  @override
  void initState() {
    super.initState();
    _getCurrentCompany = serviceLocator<GetCurrentCompany>();

    Future.delayed(Duration.zero, () {
      _fetchCompanyAndLoad();
    });
  }

  Future<void> _fetchCompanyAndLoad() async {
    await _fetchCompany();
    context.read<AttendanceBloc>().add(OnLoadPage());
    if (_companyData != null && _companyData!.hasOfficeLocation) {
      _initLocationService();
      await _getCurrentLocation();
    }
  }

  Future<void> _fetchCompany() async {
    setState(() => _isLoadingCompany = true);

    final result = await _getCurrentCompany.call(NoParams());
    result.fold(
      (l) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Gagal memuat data perusahaan: ${l.message}'),
            ),
          );
        }
      },
      (company) {
        setState(() => _companyData = company);
      },
    );

    setState(() => _isLoadingCompany = false);
  }

  void _initLocationService() {
    if (_companyData == null || !_companyData!.hasOfficeLocation) return;

    _locationService = LocationService(
      officeLat: _companyData!.officeLat!,
      officeLong: _companyData!.officeLong!,
      allowedRadiusInMeters: _companyData!.allowedRadiusMeters!.toDouble(),
    );
  }

  Future<void> _getCurrentLocation() async {
    if (_isLoadingLocation) return;
    if (_companyData == null || !_companyData!.hasOfficeLocation) return;

    setState(() => _isLoadingLocation = true);

    try {
      final result = await _locationService.getCurrentLocation();
      setState(() {
        _currentLocation = result;
        _locationError = result.isSuccess ? null : result.errorMessage;
      });
    } catch (e) {
      setState(() {
        _currentLocation = null;
        _locationError = 'Gagal mendapatkan lokasi: ${e.toString()}';
      });
    } finally {
      setState(() => _isLoadingLocation = false);
    }
  }

  void _handleClockIn() async {
    if (_currentLocation == null || !_currentLocation!.isSuccess) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Lokasi Tidak Tersedia',
        text:
            'Tidak dapat mendapatkan lokasi GPS. Pastikan GPS aktif dan coba lagi.',
        confirmBtnColor: AppPallete.red,
      );
      return;
    }

    final radius = _companyData?.allowedRadiusMeters ?? 100;
    if (_currentLocation!.isInOfficeRadius == false) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        title: 'Di Luar Jangkauan',
        text:
            'Anda berada di luar radius kantor (${_currentLocation!.distanceToOffice!.toStringAsFixed(0)}m). Maksimum radius adalah ${radius}m.',
        confirmBtnColor: Colors.orange,
      );
      return;
    }

    final lat = _currentLocation!.latitude!;
    final long = _currentLocation!.longitude!;

    context.read<AttendanceBloc>().add(OnClockIn(lat, long));
  }

  void _handleClockOut() async {
    if (_currentLocation == null || !_currentLocation!.isSuccess) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Lokasi Tidak Tersedia',
        text:
            'Tidak dapat mendapatkan lokasi GPS. Pastikan GPS aktif dan coba lagi.',
        confirmBtnColor: AppPallete.red,
      );
      return;
    }

    final radius = _companyData?.allowedRadiusMeters ?? 100;
    if (_currentLocation!.isInOfficeRadius == false) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        title: 'Di Luar Jangkauan',
        text:
            'Anda berada di luar radius kantor (${_currentLocation!.distanceToOffice!.toStringAsFixed(0)}m). Maksimum radius adalah ${radius}m.',
        confirmBtnColor: Colors.orange,
      );
      return;
    }

    final lat = _currentLocation!.latitude!;
    final long = _currentLocation!.longitude!;

    context.read<AttendanceBloc>().add(OnClockOut(lat, long));
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final timeString =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    const days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];
    final dayName = days[now.weekday - 1];
    final monthName = months[now.month - 1];
    final dateString = '$dayName, ${now.day} $monthName ${now.year}';

    if (_isLoadingCompany) {
      return Scaffold(
        backgroundColor: AppPallete.backgroundGrey,
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_companyData == null || !_companyData!.hasOfficeLocation) {
      return Scaffold(
        backgroundColor: AppPallete.backgroundGrey,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.business,
                  size: 64,
                  color: AppPallete.textGrey,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lokasi Kantor Belum Diatur',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPallete.textBlack,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Admin perusahaan belum mengatur lokasi kantor. Hubungi admin untuk mengatur lokasi kantor terlebih dahulu.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppPallete.textGrey, fontSize: 14),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _fetchCompanyAndLoad,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Coba Lagi'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPallete.primaryBlue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      body: BlocListener<AttendanceBloc, AttendanceState>(
        listener: (context, state) {
          if (state is ClockInSuccess) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              title: 'Clock-In Berhasil',
              text: state.response.message ?? 'Anda berhasil clock-in',
              onConfirmBtnTap: () {
                Navigator.of(context).pop();
                context.read<AttendanceBloc>().add(OnLoadPage());
              },
            );
          }

          if (state is ClockInFailure) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Clock-In Gagal',
              text: state.message,
              confirmBtnColor: AppPallete.red,
            );
          }

          if (state is ClockOutSuccess) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              title: 'Clock-Out Berhasil',
              text: state.response.message ?? 'Anda berhasil clock-out',
              onConfirmBtnTap: () {
                Navigator.of(context).pop();
                context.read<AttendanceBloc>().add(OnLoadPage());
              },
            );
          }

          if (state is ClockOutFailure) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Clock-Out Gagal',
              text: state.message,
              confirmBtnColor: AppPallete.red,
            );
          }
        },
        child: BlocBuilder<AttendanceBloc, AttendanceState>(
          builder: (context, state) {
            if (state is ClockInLoading || state is ClockOutLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 40),
                    decoration: const BoxDecoration(
                      color: AppPallete.primaryBlue,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF0077C2), Color(0xFF005b9f)],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CheckInHeader(
                          time: timeString,
                          date: dateString,
                          shift: 'Shift Pagi: 08:00 - 17:00',
                        ),
                      ),
                    ),
                  ),

                  Transform.translate(
                    offset: const Offset(0, -30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: _buildLocationCard(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  if (state is StatusLoaded)
                    Transform.translate(
                      offset: const Offset(0, -20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _buildStatusCard(state.status),
                      ),
                    ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildActionButton(
                            context,
                            label: 'Absen Masuk',
                            icon: Icons.login,
                            color: AppPallete.green,
                            onTap: _handleClockIn,
                            isEnabled: _canClockIn(state),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildActionButton(
                            context,
                            label: 'Absen Pulang',
                            icon: Icons.logout,
                            color: AppPallete.red,
                            onTap: _handleClockOut,
                            isEnabled: _canClockOut(state),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  if (_currentLocation != null && _currentLocation!.isSuccess)
                    InkWell(
                      onTap: _isLoadingLocation ? null : _getCurrentLocation,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: _isLoadingLocation
                              ? Colors.grey[200]
                              : AppPallete.primaryBlue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _isLoadingLocation
                                ? Colors.grey[300]!
                                : AppPallete.primaryBlue,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _isLoadingLocation
                                  ? Icons.hourglass_empty
                                  : Icons.refresh,
                              size: 16,
                              color: _isLoadingLocation
                                  ? Colors.grey
                                  : AppPallete.primaryBlue,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              _isLoadingLocation
                                  ? 'Memperbarui lokasi...'
                                  : 'Perbarui Lokasi',
                              style: TextStyle(
                                color: _isLoadingLocation
                                    ? Colors.grey
                                    : AppPallete.primaryBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),
                  const Text(
                    'Pastikan lokasi anda sesuai saat melakukan absen',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppPallete.textGrey, fontSize: 12),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatusCard(AttendanceStatus status) {
    String statusText = '';
    Color statusColor = AppPallete.textGrey;

    if (status.hasClockedOut == true) {
      statusText = 'Sudah Clock-Out: ${status.clockOutTime ?? ''}';
      statusColor = AppPallete.green;
    } else if (status.hasClockedIn == true) {
      statusText = 'Sudah Clock-In: ${status.clockInTime ?? ''}';
      statusColor = AppPallete.primaryBlue;
    } else {
      statusText = 'Belum Clock-In hari ini';
      statusColor = AppPallete.textGrey;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            status.hasClockedIn == true
                ? Icons.check_circle
                : Icons.access_time,
            color: statusColor,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              statusText,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _canClockIn(AttendanceState state) {
    if (state is! StatusLoaded) return true;
    return state.status.hasClockedIn != true;
  }

  bool _canClockOut(AttendanceState state) {
    if (state is! StatusLoaded) return false;
    return state.status.hasClockedIn == true &&
        state.status.hasClockedOut != true;
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required bool isEnabled,
  }) {
    return InkWell(
      onTap: isEnabled ? onTap : null,
      borderRadius: BorderRadius.circular(20),
      child: Opacity(
        opacity: isEnabled ? 1.0 : 0.5,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(color: color.withOpacity(0.1), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationCard() {
    if (_isLoadingLocation) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 12),
              Text(
                'Mendapatkan lokasi...',
                style: TextStyle(color: AppPallete.textGrey, fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    if (_currentLocation == null || !_currentLocation!.isSuccess) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Icon(
                  Icons.location_off,
                  size: 40,
                  color: AppPallete.red,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Lokasi tidak tersedia',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppPallete.red,
              ),
            ),
            const SizedBox(height: 8),
            if (_locationError != null && _locationError!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  _locationError!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppPallete.textGrey,
                    fontSize: 12,
                  ),
                ),
              ),
            ElevatedButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('Coba Lagi'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPallete.primaryBlue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      );
    }

    return LocationCard(
      locationName: _currentLocation!.address ?? 'Lokasi tidak diketahui',
      distance: _currentLocation!.distanceToOffice ?? 0.0,
      inRadius: _currentLocation!.isInOfficeRadius ?? false,
    );
  }
}
