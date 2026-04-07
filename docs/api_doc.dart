// ============================================================
// HRIS / PAYROLL SAAS - API DOCUMENTATION
// ============================================================
// Backend: Go + Fiber v2 | Database: PostgreSQL + KeyDB
// Base URL: http://<host>:<port>/api/v1
// Auth: JWT Bearer Token
//
// Generated from backend source code at hris/
// Last updated: April 2026
// ============================================================

library api_documentation;

// ============================================================
// 1. BASE URL & AUTHENTICATION
// ============================================================
//
// Base URL: http://localhost:3000/api/v1
// Auth Header: Authorization: Bearer <accessToken>
//
// JWT Claims:
//   - user_id: UUID
//   - role: "SUPER_USER" | "ADMIN" | "USER"
//   - company_id: UUID (multi-tenancy)
//   - type: "access"
//   - exp: expiry timestamp
//
// Access Token: 15 minutes expiry
// Refresh Token: 7 days expiry (stored in KeyDB)
//
// Rate Limits:
//   - Global: 100 req/min per IP
//   - Auth endpoints: 5 req/min per IP+path
//   - Payroll generate: 3 req/min per IP

// ============================================================
// 2. STANDARD RESPONSE ENVELOPES
// ============================================================
//
// Standard success response
// ```json
// {
//   "success": true,
//   "statusCode": 200,
//   "message": "...",
//   "data": { ... }
// }
// ```
//
// Standard paginated response
// ```json
// {
//   "success": true,
//   "statusCode": 200,
//   "message": "...",
//   "data": [ ... ],
//   "pagination": {
//     "currentPage": 1,
//     "perPage": 10,
//     "total": 100,
//     "lastPage": 10,
//     "firstPageUrl": "...",
//     "lastPageUrl": "...",
//     "nextPageUrl": "...",
//     "prevPageUrl": "..."
//   }
// }
// ```
//
// Error response
// ```json
// {
//   "success": false,
//   "statusCode": 400,
//   "message": "Error description",
//   "error": "..."
// }
// ```
//
// Validation error (422)
// ```json
// {
//   "success": false,
//   "statusCode": 422,
//   "message": "Validation failed",
//   "error": [
//     { "field": "email", "message": "Invalid email format" }
//   ]
// }
// ```

// ============================================================
// 3. DART MODELS
// ============================================================

// --- Authentication ---

/// Auth response returned from register and login endpoints.
class AuthResponse {
  final UserResponse user;
  final String accessToken;
  final String refreshToken;
  final int expiresAt;
  final String tokenType;

  const AuthResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
    required this.tokenType,
  });
}

/// Request body for POST /api/v1/auth/refresh
class RefreshTokenRequest {
  final String refreshToken;
  final String userId;

  const RefreshTokenRequest({required this.refreshToken, required this.userId});
}

/// Request body for PUT /api/v1/auth/change-password
class ChangePasswordRequest {
  final String oldPassword;
  final String newPassword;

  const ChangePasswordRequest({
    required this.oldPassword,
    required this.newPassword,
  });
}

/// Response from POST /api/v1/auth/refresh
class RefreshResponse {
  final String accessToken;
  final String refreshToken;
  final int expiresAt;

  const RefreshResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });
}

// --- User ---

class UserResponse {
  final String id;
  final String companyId;
  final String companyName;
  final String name;
  final String email;
  final String role; // "SUPER_USER" | "ADMIN" | "USER"
  final bool isActive;
  final String profileImageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserResponse({
    required this.id,
    required this.companyId,
    required this.companyName,
    required this.name,
    required this.email,
    required this.role,
    required this.isActive,
    required this.profileImageUrl,
    required this.createdAt,
    required this.updatedAt,
  });
}

/// Request body for POST /api/v1/users/ (SUPER_USER only)
class CreateUserRequest {
  final String name; // required, min=3, max=100, trimmed
  final String email; // required, valid email
  final String password; // required, min=8, password_strength
  final String role; // required: "SUPER_USER" | "ADMIN" | "USER"
  final String? companyId; // optional, UUID

  const CreateUserRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    this.companyId,
  });
}

/// Request body for PATCH /api/v1/users/:id (SUPER_USER only)
class UpdateUserRequest {
  final String? name; // min=3, max=100, trimmed
  final String? email; // valid email
  final String? password; // min=8, password_strength
  final String? role; // "SUPER_USER" | "ADMIN" | "USER"
  final bool? isActive;
  final String? companyId; // UUID

  const UpdateUserRequest({
    this.name,
    this.email,
    this.password,
    this.role,
    this.isActive,
    this.companyId,
  });
}

// --- Employee ---

class EmployeeResponse {
  final String id;
  final String userId;
  final String userName;
  final String userEmail;
  final String position;
  final String? phoneNumber;
  final String? address;
  final double salaryBase;
  final String joinDate; // YYYY-MM-DD
  final String? bankName;
  final String? bankAccountNumber;
  final String? bankAccountHolder;
  final String? scheduleId;
  final ScheduleDetail? schedule;
  final String employmentStatus; // "PERMANENT" | "CONTRACT" | "PROBATION"
  final String jobLevel; // "CEO" | "MANAGER" | "SUPERVISOR" | "STAFF"
  final String? gender; // "MALE" | "FEMALE"
  final String? division;
  final String? departmentId;
  final String? departmentName;
  final DateTime createdAt;
  final DateTime updatedAt;

  const EmployeeResponse({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.position,
    this.phoneNumber,
    this.address,
    required this.salaryBase,
    required this.joinDate,
    this.bankName,
    this.bankAccountNumber,
    this.bankAccountHolder,
    this.scheduleId,
    this.schedule,
    required this.employmentStatus,
    required this.jobLevel,
    this.gender,
    this.division,
    this.departmentId,
    this.departmentName,
    required this.createdAt,
    required this.updatedAt,
  });
}

class ScheduleDetail {
  final String id;
  final String name;
  final String timeIn; // HH:MM
  final String timeOut; // HH:MM
  final int allowedLateMinutes;

  const ScheduleDetail({
    required this.id,
    required this.name,
    required this.timeIn,
    required this.timeOut,
    required this.allowedLateMinutes,
  });
}

/// Request body for POST /api/v1/employees/ (ADMIN, SUPER_USER)
class CreateEmployeeRequest {
  // User Account
  final String name; // required, min=3, max=100, trimmed
  final String email; // required, valid email
  final String password; // required, min=6, password_strength

  // Employee Details
  final String position; // required, min=3, max=100, trimmed
  final String? phoneNumber; // max=20
  final String? address; // max=500
  final double salaryBase; // required, gt=0
  final String joinDate; // required, YYYY-MM-DD
  final String? bankName; // max=100
  final String? bankAccountNumber; // max=50
  final String? bankAccountHolder; // max=100
  final String? scheduleId; // UUID

  // Additional Fields
  final String
  employmentStatus; // required: "PERMANENT" | "CONTRACT" | "PROBATION"
  final String jobLevel; // required: "CEO" | "MANAGER" | "SUPERVISOR" | "STAFF"
  final String gender; // required: "MALE" | "FEMALE"
  final String? division; // max=100
  final String? departmentId; // UUID

  const CreateEmployeeRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.position,
    this.phoneNumber,
    this.address,
    required this.salaryBase,
    required this.joinDate,
    this.bankName,
    this.bankAccountNumber,
    this.bankAccountHolder,
    this.scheduleId,
    required this.employmentStatus,
    required this.jobLevel,
    required this.gender,
    this.division,
    this.departmentId,
  });
}

/// Request body for PATCH /api/v1/employees/:id (ADMIN, SUPER_USER)
class UpdateEmployeeRequest {
  final String? position; // min=3, max=100, trimmed
  final String? phoneNumber; // max=20
  final String? address; // max=500
  final double? salaryBase; // gt=0
  final String? bankName; // max=100
  final String? bankAccountNumber; // max=50
  final String? bankAccountHolder; // max=100
  final String? scheduleId; // UUID
  final String? employmentStatus; // "PERMANENT" | "CONTRACT" | "PROBATION"
  final String? jobLevel; // "CEO" | "MANAGER" | "SUPERVISOR" | "STAFF"
  final String? gender; // "MALE" | "FEMALE"
  final String? division; // max=100
  final String? departmentId; // UUID

  const UpdateEmployeeRequest({
    this.position,
    this.phoneNumber,
    this.address,
    this.salaryBase,
    this.bankName,
    this.bankAccountNumber,
    this.bankAccountHolder,
    this.scheduleId,
    this.employmentStatus,
    this.jobLevel,
    this.gender,
    this.division,
    this.departmentId,
  });
}

/// Request body for PATCH /api/v1/employees/me (ALL - limited fields)
class UpdateMyProfileRequest {
  final String? phoneNumber; // min=10, max=15
  final String? address; // min=5
  final String? bankName;
  final String? bankAccountNumber;
  final String? bankAccountHolder;

  const UpdateMyProfileRequest({
    this.phoneNumber,
    this.address,
    this.bankName,
    this.bankAccountNumber,
    this.bankAccountHolder,
  });
}

// --- Schedule ---

class ScheduleResponse {
  final String id;
  final String name;
  final String timeIn; // HH:MM
  final String timeOut; // HH:MM
  final int allowedLateMinutes;
  final double officeLat; // -90..90
  final double officeLong; // -180..180
  final int allowedRadiusMeters; // 10-1000
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ScheduleResponse({
    required this.id,
    required this.name,
    required this.timeIn,
    required this.timeOut,
    required this.allowedLateMinutes,
    required this.officeLat,
    required this.officeLong,
    required this.allowedRadiusMeters,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CreateScheduleRequest {
  final String name; // required, min=3, max=100, trimmed
  final String timeIn; // required, HH:MM
  final String timeOut; // required, HH:MM
  final int allowedLateMinutes; // min=0, max=60, default=15
  final double officeLat; // required, -90..90
  final double officeLong; // required, -180..180
  final int allowedRadiusMeters; // min=10, max=1000, default=50
  final String? description; // max=500

  const CreateScheduleRequest({
    required this.name,
    required this.timeIn,
    required this.timeOut,
    this.allowedLateMinutes = 15,
    required this.officeLat,
    required this.officeLong,
    this.allowedRadiusMeters = 50,
    this.description,
  });
}

class UpdateScheduleRequest {
  final String? name; // min=3, max=100, trimmed
  final String? timeIn; // HH:MM
  final String? timeOut; // HH:MM
  final int? allowedLateMinutes; // min=0, max=60
  final double? officeLat; // -90..90
  final double? officeLong; // -180..180
  final int? allowedRadiusMeters; // min=10, max=1000
  final String? description; // max=500

  const UpdateScheduleRequest({
    this.name,
    this.timeIn,
    this.timeOut,
    this.allowedLateMinutes,
    this.officeLat,
    this.officeLong,
    this.allowedRadiusMeters,
    this.description,
  });
}

// --- Attendance ---

class AttendanceResponse {
  final String id;
  final String date; // YYYY-MM-DD
  final String? clockInTime; // ISO 8601
  final String? clockOutTime; // ISO 8601
  final String status; // "PRESENT" | "LATE" | "ABSENT" | "LEAVE"
  final String? notes;
  final String? scheduleName;

  const AttendanceResponse({
    required this.id,
    required this.date,
    this.clockInTime,
    this.clockOutTime,
    required this.status,
    this.notes,
    this.scheduleName,
  });
}

/// Request body for POST /api/v1/attendance/clock-in
class ClockInRequest {
  final double lat; // required, -90..90
  final double long; // required, -180..180

  const ClockInRequest({required this.lat, required this.long});
}

class ClockInResponse {
  final String attendanceId;
  final String employeeId;
  final String clockInTime; // ISO 8601
  final String status; // "PRESENT" | "LATE"
  final double distance; // meters from office
  final String scheduleName;

  const ClockInResponse({
    required this.attendanceId,
    required this.employeeId,
    required this.clockInTime,
    required this.status,
    required this.distance,
    required this.scheduleName,
  });
}

/// Request body for POST /api/v1/attendance/clock-out
class ClockOutRequest {
  final double lat; // required, -90..90
  final double long; // required, -180..180

  const ClockOutRequest({required this.lat, required this.long});
}

class ClockOutResponse {
  final String attendanceId;
  final String clockOutTime; // ISO 8601
  final double distance; // meters from office

  const ClockOutResponse({
    required this.attendanceId,
    required this.clockOutTime,
    required this.distance,
  });
}

/// Request body for POST /api/v1/attendance/correction (ADMIN, SUPER_USER)
class CreateCorrectionRequest {
  final String employeeId; // required, UUID
  final String date; // required
  final String clockIn; // required, HH:MM
  final String? clockOut; // optional, HH:MM
  final String status; // required: "PRESENT" | "LATE" | "ABSENT"
  final String notes; // required, min=5 chars

  const CreateCorrectionRequest({
    required this.employeeId,
    required this.date,
    required this.clockIn,
    this.clockOut,
    required this.status,
    required this.notes,
  });
}

/// Request body for PATCH /api/v1/attendance/:id/correction (ADMIN, SUPER_USER)
class UpdateCorrectionRequest {
  final String? clockIn; // HH:MM
  final String? clockOut; // HH:MM
  final String? status; // "PRESENT" | "LATE" | "ABSENT"
  final String? notes; // min=5 chars

  const UpdateCorrectionRequest({
    this.clockIn,
    this.clockOut,
    this.status,
    this.notes,
  });
}

class MyAttendanceSummary {
  final String period;
  final int totalPresent;
  final int totalLate;
  final int totalAbsent;
  final int totalLeave;
  final int totalDays;
  final double attendanceRate; // percentage

  const MyAttendanceSummary({
    required this.period,
    required this.totalPresent,
    required this.totalLate,
    required this.totalAbsent,
    required this.totalLeave,
    required this.totalDays,
    required this.attendanceRate,
  });
}

class MonthlyAttendanceReport {
  final String period;
  final int month;
  final int year;
  final int totalEmployees;
  final AttendanceReportItem summary;
  final List<AttendanceReportItem> items;

  const MonthlyAttendanceReport({
    required this.period,
    required this.month,
    required this.year,
    required this.totalEmployees,
    required this.summary,
    required this.items,
  });
}

class AttendanceReportItem {
  final String employeeId;
  final String employeeName;
  final String position;
  final String division;
  final int totalPresent;
  final int totalLate;
  final int totalAbsent;
  final int totalLeave;
  final int totalDays;
  final double attendanceRate; // percentage
  final String period;

  const AttendanceReportItem({
    required this.employeeId,
    required this.employeeName,
    required this.position,
    required this.division,
    required this.totalPresent,
    required this.totalLate,
    required this.totalAbsent,
    required this.totalLeave,
    required this.totalDays,
    required this.attendanceRate,
    required this.period,
  });
}

// --- Payroll ---

class PayrollResponse {
  final String id;
  final String employeeId;
  final String employeeName;
  final String? bankName;
  final String? bankAccountNumber;
  final String? bankAccountHolder;
  final String periodStart; // YYYY-MM-DD
  final String periodEnd; // YYYY-MM-DD
  final double baseSalary;
  final double totalAllowance;
  final double totalDeduction;
  final double netSalary;
  final String status; // "DRAFT" | "APPROVED" | "PAID" | "CANCELLED"
  final List<PayrollItemResponse> items;
  final String? generatedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const PayrollResponse({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    this.bankName,
    this.bankAccountNumber,
    this.bankAccountHolder,
    required this.periodStart,
    required this.periodEnd,
    required this.baseSalary,
    required this.totalAllowance,
    required this.totalDeduction,
    required this.netSalary,
    required this.status,
    required this.items,
    this.generatedAt,
    required this.createdAt,
    required this.updatedAt,
  });
}

class PayrollItemResponse {
  final String id;
  final String name;
  final double amount;
  final String type; // "EARNING" | "DEDUCTION"

  const PayrollItemResponse({
    required this.id,
    required this.name,
    required this.amount,
    required this.type,
  });
}

class PayrollListResponse {
  final String id;
  final String employeeName;
  final String period;
  final double netSalary;
  final String status; // "DRAFT" | "APPROVED" | "PAID" | "CANCELLED"
  final String? generatedAt;

  const PayrollListResponse({
    required this.id,
    required this.employeeName,
    required this.period,
    required this.netSalary,
    required this.status,
    this.generatedAt,
  });
}

/// Request body for POST /api/v1/payrolls/generate (ADMIN, SUPER_USER)
class GeneratePayrollRequest {
  final int periodMonth; // required, 1-12
  final int periodYear; // required, 2020-2100

  const GeneratePayrollRequest({
    required this.periodMonth,
    required this.periodYear,
  });
}

class GeneratePayrollResponse {
  final int totalGenerated;
  final String periodStart;
  final String periodEnd;
  final String message;

  const GeneratePayrollResponse({
    required this.totalGenerated,
    required this.periodStart,
    required this.periodEnd,
    required this.message,
  });
}

/// Request body for PATCH /api/v1/payrolls/:id/status (ADMIN, SUPER_USER)
class UpdatePayrollStatusRequest {
  final String status; // required: "DRAFT" | "APPROVED" | "PAID" | "CANCELLED"
  final String? notes; // max=500

  const UpdatePayrollStatusRequest({required this.status, this.notes});
}

// --- Leave ---

class LeaveTypeResponse {
  final String id;
  final String name;
  final String code;
  final String? description;
  final int maxDaysPerYear;
  final int defaultDays;
  final bool isPaid;
  final bool requiresApproval;
  final bool isActive;
  final String color; // hex color e.g. "#3b82f6"
  final DateTime createdAt;
  final DateTime updatedAt;

  const LeaveTypeResponse({
    required this.id,
    required this.name,
    required this.code,
    this.description,
    required this.maxDaysPerYear,
    required this.defaultDays,
    required this.isPaid,
    required this.requiresApproval,
    required this.isActive,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CreateLeaveTypeRequest {
  final String name; // required, min=3, max=100
  final String code; // required, min=2, max=50, UPPERCASE
  final String? description; // max=500
  final int maxDaysPerYear; // min=0, max=365, default=12
  final int defaultDays; // min=0, max=365, default=0
  final bool isPaid; // default=true
  final bool requiresApproval; // default=true
  final bool isActive; // default=true
  final String? color; // max=7, e.g. "#3b82f6"

  const CreateLeaveTypeRequest({
    required this.name,
    required this.code,
    this.description,
    this.maxDaysPerYear = 12,
    this.defaultDays = 0,
    this.isPaid = true,
    this.requiresApproval = true,
    this.isActive = true,
    this.color,
  });
}

class UpdateLeaveTypeRequest {
  final String? name; // min=3, max=100
  final String? description; // max=500
  final int? maxDaysPerYear; // min=1, max=365
  final bool? isPaid;
  final bool? requiresApproval;
  final bool? isActive;

  const UpdateLeaveTypeRequest({
    this.name,
    this.description,
    this.maxDaysPerYear,
    this.isPaid,
    this.requiresApproval,
    this.isActive,
  });
}

class LeaveRequestResponse {
  final String id;
  final String employeeId;
  final String employeeName;
  final String employeePosition;
  final LeaveTypeDetail leaveType;
  final String startDate; // YYYY-MM-DD
  final String endDate; // YYYY-MM-DD
  final int totalDays;
  final String reason;
  final String? attachmentUrl;
  final String? emergencyContact;
  final String status; // "PENDING" | "APPROVED" | "REJECTED" | "CANCELLED"
  final String? approvedBy;
  final String? approvedByName;
  final DateTime? approvedAt;
  final String? rejectionReason;
  final DateTime createdAt;
  final DateTime updatedAt;

  const LeaveRequestResponse({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.employeePosition,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    required this.reason,
    this.attachmentUrl,
    this.emergencyContact,
    required this.status,
    this.approvedBy,
    this.approvedByName,
    this.approvedAt,
    this.rejectionReason,
    required this.createdAt,
    required this.updatedAt,
  });
}

class LeaveTypeDetail {
  final String id;
  final String name;
  final String code;
  final bool isPaid;

  const LeaveTypeDetail({
    required this.id,
    required this.name,
    required this.code,
    required this.isPaid,
  });
}

/// Request body for POST /api/v1/leave/requests (ALL)
class CreateLeaveRequestRequest {
  final String leaveTypeId; // required, UUID
  final String startDate; // required, YYYY-MM-DD
  final String endDate; // required, YYYY-MM-DD
  final String reason; // required, min=10, max=1000
  final String? attachmentUrl; // valid URL
  final String? emergencyContact; // max=20

  const CreateLeaveRequestRequest({
    required this.leaveTypeId,
    required this.startDate,
    required this.endDate,
    required this.reason,
    this.attachmentUrl,
    this.emergencyContact,
  });
}

class ApproveLeaveRequest {
  final String? approvalNote; // max=500

  const ApproveLeaveRequest({this.approvalNote});
}

class RejectLeaveRequest {
  final String rejectionReason; // required, min=10, max=500

  const RejectLeaveRequest({required this.rejectionReason});
}

class LeaveBalanceResponse {
  final String employeeId;
  final String employeeName;
  final int year;
  final List<LeaveBalanceItem> balances;

  const LeaveBalanceResponse({
    required this.employeeId,
    required this.employeeName,
    required this.year,
    required this.balances,
  });
}

class LeaveBalanceItem {
  final String leaveTypeId;
  final String leaveTypeName;
  final int balance;
  final int used;
  final int pending;
  final int available;

  const LeaveBalanceItem({
    required this.leaveTypeId,
    required this.leaveTypeName,
    required this.balance,
    required this.used,
    required this.pending,
    required this.available,
  });
}

// --- Overtime ---

class OvertimePolicyResponse {
  final String id;
  final String name;
  final String? description;
  final String rateType; // "FIXED" | "MULTIPLIER"
  final double rateMultiplier;
  final double fixedAmount;
  final int minOvertimeMinutes;
  final double maxOvertimeHoursPerDay;
  final double maxOvertimeHoursPerMonth;
  final bool requiresApproval;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OvertimePolicyResponse({
    required this.id,
    required this.name,
    this.description,
    required this.rateType,
    required this.rateMultiplier,
    required this.fixedAmount,
    required this.minOvertimeMinutes,
    required this.maxOvertimeHoursPerDay,
    required this.maxOvertimeHoursPerMonth,
    required this.requiresApproval,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CreateOvertimePolicyRequest {
  final String name; // required, min=3, max=100
  final String? description; // max=500
  final String rateType; // required: "FIXED" | "MULTIPLIER"
  final double rateMultiplier; // required if rateType=MULTIPLIER, gt=0
  final double fixedAmount; // required if rateType=FIXED, gt=0
  final int minOvertimeMinutes; // required, min=1
  final double maxOvertimeHoursPerDay; // required, gt=0
  final double maxOvertimeHoursPerMonth; // required, gt=0
  final bool requiresApproval;

  const CreateOvertimePolicyRequest({
    required this.name,
    this.description,
    required this.rateType,
    required this.rateMultiplier,
    required this.fixedAmount,
    required this.minOvertimeMinutes,
    required this.maxOvertimeHoursPerDay,
    required this.maxOvertimeHoursPerMonth,
    required this.requiresApproval,
  });
}

class UpdateOvertimePolicyRequest {
  final String? name; // min=3, max=100
  final String? description; // max=500
  final String? rateType; // "FIXED" | "MULTIPLIER"
  final double? rateMultiplier; // gt=0
  final double? fixedAmount; // gt=0
  final int? minOvertimeMinutes; // min=1
  final double? maxOvertimeHoursPerDay; // gt=0
  final double? maxOvertimeHoursPerMonth; // gt=0
  final bool? requiresApproval;
  final bool? isActive;

  const UpdateOvertimePolicyRequest({
    this.name,
    this.description,
    this.rateType,
    this.rateMultiplier,
    this.fixedAmount,
    this.minOvertimeMinutes,
    this.maxOvertimeHoursPerDay,
    this.maxOvertimeHoursPerMonth,
    this.requiresApproval,
    this.isActive,
  });
}

class OvertimeRequestResponse {
  final String id;
  final String employeeId;
  final String employeeName;
  final String employeePosition;
  final String overtimeDate; // YYYY-MM-DD
  final String startTime; // HH:MM
  final String endTime; // HH:MM
  final double totalHours;
  final String reason;
  final OvertimePolicyDetail overtimePolicy;
  final String status; // "PENDING" | "APPROVED" | "REJECTED"
  final String? approvedBy;
  final String? approvedByName;
  final DateTime? approvedAt;
  final String? rejectionReason;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OvertimeRequestResponse({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.employeePosition,
    required this.overtimeDate,
    required this.startTime,
    required this.endTime,
    required this.totalHours,
    required this.reason,
    required this.overtimePolicy,
    required this.status,
    this.approvedBy,
    this.approvedByName,
    this.approvedAt,
    this.rejectionReason,
    required this.createdAt,
    required this.updatedAt,
  });
}

class OvertimePolicyDetail {
  final String id;
  final String name;
  final String rateType;
  final double rateMultiplier;
  final double fixedAmount;

  const OvertimePolicyDetail({
    required this.id,
    required this.name,
    required this.rateType,
    required this.rateMultiplier,
    required this.fixedAmount,
  });
}

/// Request body for POST /api/v1/overtime/requests (ALL)
class CreateOvertimeRequestRequest {
  final String overtimeDate; // required, YYYY-MM-DD
  final String startTime; // required, HH:MM
  final String endTime; // required, HH:MM
  final String reason; // required, min=10, max=1000
  final String overtimePolicyId; // required, UUID

  const CreateOvertimeRequestRequest({
    required this.overtimeDate,
    required this.startTime,
    required this.endTime,
    required this.reason,
    required this.overtimePolicyId,
  });
}

class ApproveOvertimeRequest {
  final String? approvalNote; // max=500

  const ApproveOvertimeRequest({this.approvalNote});
}

class RejectOvertimeRequest {
  final String rejectionReason; // required, min=10, max=500

  const RejectOvertimeRequest({required this.rejectionReason});
}

class OvertimeClockInRequest {
  final String? notes; // max=500

  const OvertimeClockInRequest({this.notes});
}

class OvertimeClockOutRequest {
  final String? notes; // max=500

  const OvertimeClockOutRequest({this.notes});
}

class OvertimeAttendanceResponse {
  final String id;
  final String overtimeRequestId;
  final String employeeId;
  final String employeeName;
  final String? clockInTime; // ISO 8601
  final String? clockOutTime; // ISO 8601
  final double actualHours;
  final String? notes;
  final DateTime createdAt;

  const OvertimeAttendanceResponse({
    required this.id,
    required this.overtimeRequestId,
    required this.employeeId,
    required this.employeeName,
    this.clockInTime,
    this.clockOutTime,
    required this.actualHours,
    this.notes,
    required this.createdAt,
  });
}

class OvertimeCalculationResponse {
  final String employeeId;
  final String employeeName;
  final double totalHours;
  final String rateType;
  final double rateMultiplier;
  final double hourlyRate; // salaryBase / 173
  final double overtimePay; // totalHours * hourlyRate * rateMultiplier

  const OvertimeCalculationResponse({
    required this.employeeId,
    required this.employeeName,
    required this.totalHours,
    required this.rateType,
    required this.rateMultiplier,
    required this.hourlyRate,
    required this.overtimePay,
  });
}

// --- Department ---

class DepartmentResponse {
  final String id;
  final String name;
  final String code;
  final String? description;
  final String? headEmployeeId;
  final String? headEmployeeName;
  final bool isActive;
  final int employeeCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DepartmentResponse({
    required this.id,
    required this.name,
    required this.code,
    this.description,
    this.headEmployeeId,
    this.headEmployeeName,
    required this.isActive,
    required this.employeeCount,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CreateDepartmentRequest {
  final String name; // required, min=2, max=100
  final String code; // required, min=2, max=20, UPPERCASE
  final String? description; // max=500
  final String? headEmployeeId; // UUID
  final bool? isActive;

  const CreateDepartmentRequest({
    required this.name,
    required this.code,
    this.description,
    this.headEmployeeId,
    this.isActive,
  });
}

class UpdateDepartmentRequest {
  final String? name; // min=2, max=100
  final String? code; // min=2, max=20, UPPERCASE
  final String? description; // max=500
  final String? headEmployeeId; // UUID
  final bool? isActive;

  const UpdateDepartmentRequest({
    this.name,
    this.code,
    this.description,
    this.headEmployeeId,
    this.isActive,
  });
}

// --- Holiday ---

class HolidayResponse {
  final String id;
  final String name;
  final String date; // YYYY-MM-DD
  final String type; // "NATIONAL" | "COMPANY" | "OPTIONAL"
  final bool isRecurring;
  final int? year;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const HolidayResponse({
    required this.id,
    required this.name,
    required this.date,
    required this.type,
    required this.isRecurring,
    this.year,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CreateHolidayRequest {
  final String name; // required, min=2, max=200
  final String date; // required, YYYY-MM-DD
  final String type; // required: "NATIONAL" | "COMPANY" | "OPTIONAL"
  final bool isRecurring; // default=false
  final int? year; // min=2000
  final String? description; // max=500

  const CreateHolidayRequest({
    required this.name,
    required this.date,
    required this.type,
    this.isRecurring = false,
    this.year,
    this.description,
  });
}

class UpdateHolidayRequest {
  final String? name; // min=2, max=200
  final String? date; // YYYY-MM-DD
  final String? type; // "NATIONAL" | "COMPANY" | "OPTIONAL"
  final bool? isRecurring;
  final int? year; // min=2000
  final String? description; // max=500

  const UpdateHolidayRequest({
    this.name,
    this.date,
    this.type,
    this.isRecurring,
    this.year,
    this.description,
  });
}

// --- Company ---

class CompanyResponse {
  final String id;
  final String name;
  final String slug;
  final bool isActive;
  final String plan; // "free" | "starter" | "pro" | "enterprise"
  final int maxEmployees;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CompanyResponse({
    required this.id,
    required this.name,
    required this.slug,
    required this.isActive,
    required this.plan,
    required this.maxEmployees,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CreateCompanyRequest {
  final String name; // required, min=2, max=200
  final String slug; // required, min=2, max=100, slug format
  final String? plan; // "free" | "starter" | "pro" | "enterprise"
  final int? maxEmployees; // min=1

  const CreateCompanyRequest({
    required this.name,
    required this.slug,
    this.plan,
    this.maxEmployees,
  });
}

class UpdateCompanyRequest {
  final String? name; // min=2, max=200
  final String? slug; // min=2, max=100, slug format
  final bool? isActive;
  final String? plan; // "free" | "starter" | "pro" | "enterprise"
  final int? maxEmployees; // min=1

  const UpdateCompanyRequest({
    this.name,
    this.slug,
    this.isActive,
    this.plan,
    this.maxEmployees,
  });
}

// --- Dashboard ---

class DashboardSummary {
  final DashboardAttendanceSummary attendance;
  final DashboardLeaveSummary leave;
  final DashboardPayrollSummary payroll;
  final DashboardEmployeeSummary employee;

  const DashboardSummary({
    required this.attendance,
    required this.leave,
    required this.payroll,
    required this.employee,
  });
}

class DashboardAttendanceSummary {
  final int todayPresent;
  final int todayLate;
  final int todayAbsent;
  final int todayLeave;
  final int totalEmployees;

  const DashboardAttendanceSummary({
    required this.todayPresent,
    required this.todayLate,
    required this.todayAbsent,
    required this.todayLeave,
    required this.totalEmployees,
  });
}

class DashboardLeaveSummary {
  final int pendingRequests;
  final int approvedThisMonth;
  final int rejectedThisMonth;

  const DashboardLeaveSummary({
    required this.pendingRequests,
    required this.approvedThisMonth,
    required this.rejectedThisMonth,
  });
}

class DashboardPayrollSummary {
  final int draftCount;
  final int approvedCount;
  final int paidCount;
  final double totalNetSalary;
  final String currentPeriod;

  const DashboardPayrollSummary({
    required this.draftCount,
    required this.approvedCount,
    required this.paidCount,
    required this.totalNetSalary,
    required this.currentPeriod,
  });
}

class DashboardEmployeeSummary {
  final int totalActive;
  final int totalInactive;
  final int newThisMonth;

  const DashboardEmployeeSummary({
    required this.totalActive,
    required this.totalInactive,
    required this.newThisMonth,
  });
}

class AttendanceStats {
  final String period;
  final List<DailyAttendanceStat> dailyBreakdown;
  final AttendancePeriodSummary summary;

  const AttendanceStats({
    required this.period,
    required this.dailyBreakdown,
    required this.summary,
  });
}

class DailyAttendanceStat {
  final String date;
  final int present;
  final int late;
  final int absent;
  final int leave;
  final int total;

  const DailyAttendanceStat({
    required this.date,
    required this.present,
    required this.late,
    required this.absent,
    required this.leave,
    required this.total,
  });
}

class AttendancePeriodSummary {
  final int totalPresent;
  final int totalLate;
  final int totalAbsent;
  final int totalLeave;
  final double avgPresent;
  final double avgLate;

  const AttendancePeriodSummary({
    required this.totalPresent,
    required this.totalLate,
    required this.totalAbsent,
    required this.totalLeave,
    required this.avgPresent,
    required this.avgLate,
  });
}

class PayrollStats {
  final String period;
  final int totalPayrolls;
  final double totalAmount;
  final double averageSalary;
  final PayrollStatusBreakdown statusBreakdown;
  final List<DepartmentPayrollStat> departmentStats;

  const PayrollStats({
    required this.period,
    required this.totalPayrolls,
    required this.totalAmount,
    required this.averageSalary,
    required this.statusBreakdown,
    required this.departmentStats,
  });
}

class PayrollStatusBreakdown {
  final int draftCount;
  final int approvedCount;
  final int paidCount;
  final double draftAmount;
  final double approvedAmount;
  final double paidAmount;

  const PayrollStatusBreakdown({
    required this.draftCount,
    required this.approvedCount,
    required this.paidCount,
    required this.draftAmount,
    required this.approvedAmount,
    required this.paidAmount,
  });
}

class DepartmentPayrollStat {
  final String departmentId;
  final String departmentName;
  final int employeeCount;
  final double totalPayroll;

  const DepartmentPayrollStat({
    required this.departmentId,
    required this.departmentName,
    required this.employeeCount,
    required this.totalPayroll,
  });
}

class EmployeeStats {
  final int totalCount;
  final EmployeeStatusBreakdown statusBreakdown;
  final List<DepartmentEmployeeStat> departmentStats;
  final List<JobLevelStat> jobLevelStats;
  final List<RecentHire> recentHires;

  const EmployeeStats({
    required this.totalCount,
    required this.statusBreakdown,
    required this.departmentStats,
    required this.jobLevelStats,
    required this.recentHires,
  });
}

class EmployeeStatusBreakdown {
  final int permanent;
  final int contract;
  final int probation;
  final int intern;
  final int resigned;

  const EmployeeStatusBreakdown({
    required this.permanent,
    required this.contract,
    required this.probation,
    required this.intern,
    required this.resigned,
  });
}

class DepartmentEmployeeStat {
  final String departmentId;
  final String departmentName;
  final int employeeCount;
  final int activeCount;

  const DepartmentEmployeeStat({
    required this.departmentId,
    required this.departmentName,
    required this.employeeCount,
    required this.activeCount,
  });
}

class JobLevelStat {
  final String level;
  final int employeeCount;

  const JobLevelStat({required this.level, required this.employeeCount});
}

class RecentHire {
  final String employeeId;
  final String employeeName;
  final String position;
  final String joinDate;

  const RecentHire({
    required this.employeeId,
    required this.employeeName,
    required this.position,
    required this.joinDate,
  });
}

class RecentActivity {
  final String id;
  final String timestamp;
  final String action;
  final String resourceType;
  final String resourceId;
  final String userId;
  final String userName;
  final String description;

  const RecentActivity({
    required this.id,
    required this.timestamp,
    required this.action,
    required this.resourceType,
    required this.resourceId,
    required this.userId,
    required this.userName,
    required this.description,
  });
}

class RecentActivitiesResponse {
  final List<RecentActivity> activities;
  final int total;

  const RecentActivitiesResponse({
    required this.activities,
    required this.total,
  });
}

// --- Audit ---

class AuditLogResponse {
  final String id;
  final String userId;
  final String userName;
  final String action;
  final String resourceType;
  final String? resourceId;
  final Map<String, dynamic>? oldData;
  final Map<String, dynamic>? newData;
  final Map<String, dynamic>? metadata;
  final String? ipAddress;
  final DateTime createdAt;

  const AuditLogResponse({
    required this.id,
    required this.userId,
    required this.userName,
    required this.action,
    required this.resourceType,
    this.resourceId,
    this.oldData,
    this.newData,
    this.metadata,
    this.ipAddress,
    required this.createdAt,
  });
}

class AuditLogListResponse {
  final String id;
  final String userId;
  final String userName;
  final String action;
  final String resourceType;
  final String? resourceId;
  final String? ipAddress;
  final DateTime createdAt;

  const AuditLogListResponse({
    required this.id,
    required this.userId,
    required this.userName,
    required this.action,
    required this.resourceType,
    this.resourceId,
    this.ipAddress,
    required this.createdAt,
  });
}

class AuditLogPagination {
  final List<AuditLogListResponse> data;
  final int page;
  final int perPage;
  final int total;
  final int totalPages;

  const AuditLogPagination({
    required this.data,
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
  });
}

// ============================================================
// 4. API ENDPOINTS - COMPLETE REFERENCE
// ============================================================
//
// Legend:
//   [P]  = Public (no auth required)
//   [U]  = USER role
//   [A]  = ADMIN role
//   [S]  = SUPER_USER role
//   ALL  = USER + ADMIN + SUPER_USER
//
// Note: SUPER_USER bypasses ALL role checks (auto-granted)
// ============================================================

// ----------------------------------------------------------
// 4.1 AUTH MODULE - /api/v1/auth
// ----------------------------------------------------------
//
// POST /api/v1/auth/register                    [P]
//   Create new user account
//   Body: {
//     "name": "string (3-100, trimmed)",
//     "email": "string (valid email)",
//     "password": "string (min=8, must have uppercase+lowercase+number+special)",
//     "companyId": "string (UUID)"
//   }
//   Response 201: AuthResponse { user, accessToken, refreshToken, expiresAt, tokenType }
//   Errors: 400 (company not found), 409 (email already exists), 422 (validation)
//
// POST /api/v1/auth/login                       [P]
//   Login with email and password
//   Body: {
//     "email": "string (valid email)",
//     "password": "string"
//   }
//   Response 200: AuthResponse
//   Errors: 401 (invalid credentials), 403 (account inactive), 422 (validation)
//
// POST /api/v1/auth/refresh                     [P]
//   Refresh access token using refresh token
//   Body: {
//     "refreshToken": "string",
//     "userId": "string (UUID)"
//   }
//   Response 200: { accessToken, refreshToken, expiresAt }
//   Errors: 401 (invalid/expired refresh token)
//
// POST /api/v1/auth/logout                      [ALL]
//   Logout from current device (invalidate refresh token)
//   Header: Authorization: Bearer <accessToken>
//   Body: { "refresh_token": "string" }
//   Response 200: null
//
// POST /api/v1/auth/logout-all                  [ALL]
//   Logout from all devices
//   Header: Authorization: Bearer <accessToken>
//   Response 200: null
//
// PUT  /api/v1/auth/change-password             [ALL]
//   Change password
//   Body: { "oldPassword": "string", "newPassword": "string (min=8, password_strength)" }
//   Response 200: null
//   Errors: 401 (old password incorrect), 422 (validation)

// ----------------------------------------------------------
// 4.2 USER MODULE - /api/v1/users
// ----------------------------------------------------------
//
// GET  /api/v1/users/me                         [ALL]
//   Get current user profile
//   Response 200: UserResponse
//
// POST /api/v1/users/                           [S]
//   Create new user
//   Body: CreateUserRequest
//   Response 201: UserResponse
//   Errors: 409, 422
//
// GET  /api/v1/users/                           [S]
//   List all users (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: [UserResponse] + pagination
//
// GET  /api/v1/users/:id                        [S]
//   Get user by ID
//   Response 200: UserResponse
//   Errors: 404
//
// PATCH /api/v1/users/:id                       [S]
//   Update user
//   Body: UpdateUserRequest (all fields optional)
//   Response 200: UserResponse
//   Errors: 404, 409, 422
//
// DELETE /api/v1/users/:id                      [S]
//   Delete user (hard delete)
//   Response 200: null
//
// POST /api/v1/users/:id/profile-image          [U(own), A, S]
//   Upload profile image
//   Body: multipart/form-data { image: file }
//   Response 200: { imageUrl: "string" }
//
// PUT  /api/v1/users/:id/profile-image          [U(own), A, S]
//   Update (replace) profile image
//   Body: multipart/form-data { image: file }
//   Response 200: { imageUrl: "string" }
//
// DELETE /api/v1/users/:id/profile-image        [U(own), A, S]
//   Delete profile image
//   Response 200: null

// ----------------------------------------------------------
// 4.3 EMPLOYEE MODULE - /api/v1/employees
// ----------------------------------------------------------
//
// GET  /api/v1/employees/me                     [ALL]
//   Get own employee profile
//   Response 200: EmployeeResponse
//   Errors: 404 (no employee linked)
//
// PATCH /api/v1/employees/me                     [ALL]
//   Update own profile (limited fields only)
//   Body: UpdateMyProfileRequest
//   Response 200: EmployeeResponse
//
// POST /api/v1/employees/                        [A, S]
//   Create employee (+ user account)
//   Body: CreateEmployeeRequest
//   Response 201: EmployeeResponse
//   Errors: 409, 422
//
// GET  /api/v1/employees/                        [A, S]
//   List employees (paginated, searchable)
//   Query: ?page=1&per_page=10&search=keyword
//   Response 200: [EmployeeResponse] + pagination
//
// GET  /api/v1/employees/:id                     [A, S]
//   Get employee by ID
//   Response 200: EmployeeResponse
//
// PATCH /api/v1/employees/:id                    [A, S]
//   Update employee
//   Body: UpdateEmployeeRequest (all fields optional)
//   Response 200: EmployeeResponse
//
// DELETE /api/v1/employees/:id                   [A, S]
//   Soft-delete employee
//   Response 200: null

// ----------------------------------------------------------
// 4.4 SCHEDULE MODULE - /api/v1/schedules
// ----------------------------------------------------------
//
// POST /api/v1/schedules/                        [S]
//   Create schedule
//   Body: CreateScheduleRequest
//   Response 201: ScheduleResponse
//
// GET  /api/v1/schedules/                        [S]
//   List schedules (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: [ScheduleResponse] + pagination
//
// GET  /api/v1/schedules/:id                     [S]
//   Get schedule by ID
//   Response 200: ScheduleResponse
//
// PATCH /api/v1/schedules/:id                    [S]
//   Update schedule
//   Body: UpdateScheduleRequest
//   Response 200: ScheduleResponse
//
// DELETE /api/v1/schedules/:id                   [S]
//   Soft-delete schedule

// ----------------------------------------------------------
// 4.5 ATTENDANCE MODULE - /api/v1/attendance
// ----------------------------------------------------------
//
// POST /api/v1/attendance/clock-in               [ALL]
//   Clock in (blocked for ADMIN/SUPER_USER -> 403)
//   Body: ClockInRequest { lat, long }
//   Response 201: ClockInResponse
//   Errors: 400 (already clocked in), 403
//
// POST /api/v1/attendance/clock-out              [ALL]
//   Clock out (blocked for ADMIN/SUPER_USER -> 403)
//   Body: ClockOutRequest { lat, long }
//   Response 200: ClockOutResponse
//   Errors: 400 (not clocked in), 403
//
// GET  /api/v1/attendance/history                [ALL]
//   Own attendance history (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: [AttendanceResponse] + pagination
//
// GET  /api/v1/attendance/all                    [A, S]
//   All attendances (filterable)
//   Query: ?page=1&per_page=10&employee_id=UUID&schedule_id=UUID&status=PRESENT&date_from=2025-01-01&date_to=2025-01-31
//   Response 200: [AttendanceResponse] + pagination
//
// GET  /api/v1/attendance/report/monthly         [A, S]
//   Monthly attendance report for all employees
//   Query: ?month=1&year=2025
//   Response 200: MonthlyAttendanceReport
//
// GET  /api/v1/attendance/report/my              [ALL]
//   Own monthly attendance summary
//   Query: ?month=1&year=2025
//   Response 200: MyAttendanceSummary
//
// POST /api/v1/attendance/correction             [A, S]
//   Create attendance correction
//   Body: CreateCorrectionRequest
//   Response 201: AttendanceResponse
//
// PATCH /api/v1/attendance/:id/correction        [A, S]
//   Update attendance correction
//   Body: UpdateCorrectionRequest
//   Response 200: AttendanceResponse

// ----------------------------------------------------------
// 4.6 PAYROLL MODULE - /api/v1/payrolls
// ----------------------------------------------------------
//
// POST /api/v1/payrolls/generate                 [A, S]
//   Generate bulk payroll for all employees
//   Body: GeneratePayrollRequest { periodMonth(1-12), periodYear(2020-2100) }
//   Response 201: GeneratePayrollResponse
//   Rate limit: 3 req/min
//
// GET  /api/v1/payrolls/                          [A, S]
//   List all payrolls (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: [PayrollListResponse] + pagination
//
// GET  /api/v1/payrolls/export/csv               [A, S]
//   Export payrolls to CSV
//   Query: ?month=1&year=2025 (required)
//   Response 200: CSV file
//
// PATCH /api/v1/payrolls/:id/status              [A, S]
//   Update payroll status
//   Body: UpdatePayrollStatusRequest { status, notes? }
//   Valid transitions: DRAFT->APPROVED, APPROVED->PAID
//   Response 200: null
//
// GET  /api/v1/payrolls/my                        [ALL]
//   Own payrolls (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: [PayrollListResponse] + pagination
//
// GET  /api/v1/payrolls/my/:id                    [ALL]
//   Own payroll detail by ID
//   Response 200: PayrollResponse
//
// GET  /api/v1/payrolls/:id                       [ALL]
//   Payroll detail by ID
//   Response 200: PayrollResponse

// ----------------------------------------------------------
// 4.7 LEAVE MODULE - /api/v1/leave
// ----------------------------------------------------------
//
// --- Leave Types ---
//
// GET  /api/v1/leave/types                       [ALL]
//   Active leave types for company
//   Response 200: [LeaveTypeResponse]
//
// GET  /api/v1/leave/types/all                   [A, S]
//   All leave types (including inactive)
//   Response 200: [LeaveTypeResponse]
//
// GET  /api/v1/leave/types/:id                   [A, S]
//   Leave type by ID
//   Response 200: LeaveTypeResponse
//
// POST /api/v1/leave/types                       [A, S]
//   Create leave type
//   Body: CreateLeaveTypeRequest
//   Response 201: LeaveTypeResponse
//   Errors: 409 (code exists)
//
// PUT  /api/v1/leave/types/:id                   [A, S]
//   Update leave type
//   Body: UpdateLeaveTypeRequest
//   Response 200: LeaveTypeResponse
//
// DELETE /api/v1/leave/types/:id                 [A, S]
//   Delete leave type
//   Response 200: null
//
// --- Leave Requests ---
//
// POST /api/v1/leave/requests                    [ALL]
//   Create leave request
//   Body: CreateLeaveRequestRequest
//   Response 201: LeaveRequestResponse
//   Errors: 400 (insufficient balance, overlap), 404, 422
//
// GET  /api/v1/leave/requests/my                 [ALL]
//   Own leave requests (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: [LeaveRequestResponse] + pagination
//
// GET  /api/v1/leave/balances/my                 [ALL]
//   Own leave balances
//   Query: ?year=2025
//   Response 200: LeaveBalanceResponse
//
// GET  /api/v1/leave/requests/pending            [A, S]
//   All pending leave requests
//   Response 200: [LeaveRequestResponse]
//
// GET  /api/v1/leave/requests                    [A, S]
//   All leave requests (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: [LeaveRequestResponse] + pagination
//
// GET  /api/v1/leave/requests/:id                [ALL]
//   Leave request by ID
//   Response 200: LeaveRequestResponse
//
// PUT  /api/v1/leave/requests/:id/approve        [A, S]
//   Approve leave request
//   Body: ApproveLeaveRequest { approvalNote? }
//   Response 200: LeaveRequestResponse
//
// PUT  /api/v1/leave/requests/:id/reject         [A, S]
//   Reject leave request
//   Body: RejectLeaveRequest { rejectionReason (10-500 chars) }
//   Response 200: LeaveRequestResponse

// ----------------------------------------------------------
// 4.8 OVERTIME MODULE - /api/v1/overtime
// ----------------------------------------------------------
//
// GET  /api/v1/overtime/policies                 [ALL]
//   Active overtime policies
//   Response 200: [OvertimePolicyResponse]
//
// POST /api/v1/overtime/requests                 [ALL]
//   Create overtime request
//   Body: CreateOvertimeRequestRequest
//   Response 201: OvertimeRequestResponse
//   Errors: 400 (duplicate date, policy limit), 404, 422
//
// GET  /api/v1/overtime/requests/my              [ALL]
//   Own overtime requests (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: [OvertimeRequestResponse] + pagination
//
// GET  /api/v1/overtime/requests/pending         [A, S]
//   All pending overtime requests
//   Response 200: [OvertimeRequestResponse]
//
// GET  /api/v1/overtime/requests                 [A, S]
//   All overtime requests (filterable)
//   Query: ?page=1&per_page=10&status=PENDING&employee_id=UUID
//   Response 200: [OvertimeRequestResponse] + pagination
//
// GET  /api/v1/overtime/requests/:id             [ALL]
//   Overtime request by ID
//   Response 200: OvertimeRequestResponse
//
// POST /api/v1/overtime/requests/:id/clock-in    [ALL]
//   Clock in for approved overtime
//   Body: OvertimeClockInRequest { notes? }
//   Response 201: OvertimeAttendanceResponse
//   Errors: 400 (not approved, already clocked in)
//
// POST /api/v1/overtime/requests/:id/clock-out   [ALL]
//   Clock out from overtime
//   Body: OvertimeClockOutRequest { notes? }
//   Response 200: OvertimeAttendanceResponse
//   Errors: 400 (not clocked in)
//
// PUT  /api/v1/overtime/requests/:id/approve     [A, S]
//   Approve overtime request
//   Body: ApproveOvertimeRequest { approvalNote? }
//   Response 200: OvertimeRequestResponse
//
// PUT  /api/v1/overtime/requests/:id/reject      [A, S]
//   Reject overtime request
//   Body: RejectOvertimeRequest { rejectionReason (10-500 chars) }
//   Response 200: OvertimeRequestResponse
//
// GET  /api/v1/overtime/calculation/:employeeId  [A, S]
//   Calculate overtime pay for employee
//   Query: ?start_date=2025-01-01&end_date=2025-01-31 (required)
//   Formula: hourly_rate = salaryBase / 173
//            overtime_pay = totalHours * hourlyRate * rateMultiplier
//   Response 200: OvertimeCalculationResponse

// ----------------------------------------------------------
// 4.9 DEPARTMENT MODULE - /api/v1/departments
// ----------------------------------------------------------
//
// GET  /api/v1/departments/                      [A, S]
//   List departments (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: [DepartmentResponse] + pagination
//
// POST /api/v1/departments/                      [A, S]
//   Create department
//   Body: CreateDepartmentRequest
//   Response 201: DepartmentResponse
//
// GET  /api/v1/departments/:id                   [A, S]
//   Department by ID
//   Response 200: DepartmentResponse
//
// PATCH /api/v1/departments/:id                  [A, S]
//   Update department
//   Body: UpdateDepartmentRequest
//   Response 200: DepartmentResponse
//
// DELETE /api/v1/departments/:id                 [A, S]
//   Soft-delete department

// ----------------------------------------------------------
// 4.10 HOLIDAY MODULE - /api/v1/holidays
// ----------------------------------------------------------
//
// GET  /api/v1/holidays/                          [A, S]
//   List holidays by year
//   Query: ?year=2025
//   Response 200: [HolidayResponse]
//
// POST /api/v1/holidays/                          [A, S]
//   Create holiday
//   Body: CreateHolidayRequest
//   Response 201: HolidayResponse
//
// GET  /api/v1/holidays/:id                       [A, S]
//   Holiday by ID
//   Response 200: HolidayResponse
//
// PATCH /api/v1/holidays/:id                      [A, S]
//   Update holiday
//   Body: UpdateHolidayRequest
//   Response 200: HolidayResponse
//
// DELETE /api/v1/holidays/:id                     [A, S]
//   Delete holiday

// ----------------------------------------------------------
// 4.11 COMPANY MODULE - /api/v1/companies
// ----------------------------------------------------------
//
// GET  /api/v1/companies/current                  [ALL]
//   Get current user's company
//   Response 200: CompanyResponse
//
// GET  /api/v1/companies/:id                      [ALL]
//   Company by ID
//   Response 200: CompanyResponse
//
// POST /api/v1/companies/                          [S]
//   Create company
//   Body: CreateCompanyRequest
//   Response 201: CompanyResponse
//
// GET  /api/v1/companies/                          [S]
//   List all companies
//   Response 200: [CompanyResponse]
//
// PUT  /api/v1/companies/:id                      [S]
//   Update company
//   Body: UpdateCompanyRequest
//   Response 200: CompanyResponse
//
// DELETE /api/v1/companies/:id                     [S]
//   Delete company

// ----------------------------------------------------------
// 4.12 DASHBOARD MODULE - /api/v1/dashboard
// ----------------------------------------------------------
//
// GET  /api/v1/dashboard/summary                  [A, S]
//   Dashboard summary (attendance, leave, payroll, employee)
//   Response 200: DashboardSummary
//
// GET  /api/v1/dashboard/attendance-stats         [A, S]
//   Attendance statistics (daily breakdown + period summary)
//   Response 200: AttendanceStats
//
// GET  /api/v1/dashboard/payroll-stats            [A, S]
//   Payroll statistics (totals + status + department)
//   Response 200: PayrollStats
//
// GET  /api/v1/dashboard/employee-stats           [A, S]
//   Employee statistics (status, department, job level, recent)
//   Response 200: EmployeeStats
//
// GET  /api/v1/dashboard/recent-activities        [A, S]
//   Latest audit log entries
//   Response 200: RecentActivitiesResponse

// ----------------------------------------------------------
// 4.13 AUDIT MODULE - /api/v1/audit
// ----------------------------------------------------------
//
// GET  /api/v1/audit/logs                         [S]
//   All audit logs (paginated)
//   Query: ?page=1&per_page=10
//   Response 200: AuditLogPagination
//
// GET  /api/v1/audit/logs/:resourceType/:resourceId  [S]
//   Audit logs for specific resource
//   Response 200: [AuditLogResponse]

// ============================================================
// 5. AUTHENTICATION FLOW (mobile implementation guide)
// ============================================================
//
// Step 1: Register
//   POST /api/v1/auth/register
//   Save accessToken, refreshToken, expiresAt to flutter_secure_storage
//
// Step 2: Attach token to all requests
//   Header: Authorization: Bearer <accessToken>
//
// Step 3: Handle token refresh (use dio interceptor)
//   When API returns 401:
//   POST /api/v1/auth/refresh
//   Body: { refreshToken, userId }
//   Save new tokens and retry failed request
//
// Step 4: Logout
//   POST /api/v1/auth/logout
//   Body: { refresh_token: "<stored>" }
//   Clear local tokens
//
// Recommended Flutter packages:
//   - dio: HTTP client with interceptors
//   - flutter_secure_storage: token persistence
//   - json_annotation + json_serializable: JSON serialization

// ============================================================
// 6. CUSTOM VALIDATION RULES
// ============================================================
//
// password_strength:
//   Min 8 chars, must contain: uppercase + lowercase + number + special char
//
// trimmed_string:
//   No leading/trailing whitespace
//
// time_format:
//   HH:MM (24-hour), e.g. "09:00", "17:30"
//
// slug:
//   Lowercase letters, numbers, hyphens only

// ============================================================
// 7. HTTP STATUS CODES
// ============================================================
//
// 200 - Success
// 201 - Created
// 400 - Bad Request (business logic error)
// 401 - Unauthorized (invalid/expired token, wrong password)
// 403 - Forbidden (insufficient role)
// 404 - Not Found
// 409 - Conflict (duplicate)
// 413 - Payload Too Large
// 415 - Unsupported Media Type
// 422 - Validation Error
// 429 - Too Many Requests (rate limited)
// 500 - Internal Server Error

// ============================================================
// 8. ROLE ACCESS MATRIX (mobile features)
// ============================================================
//
// Feature                      | USER | ADMIN | SUPER_USER
// -----------------------------|------|-------|-----------
// View own profile             |  Y   |   Y   |     Y
// Update own profile           |  Y   |   Y   |     Y
// Upload profile image         |  Y   |   Y   |     Y
// Clock in/out                 |  Y*  |   -   |     -
// View own attendance          |  Y   |   Y   |     Y
// View own attendance summary  |  Y   |   Y   |     Y
// View own leave balances      |  Y   |   Y   |     Y
// Create leave request         |  Y   |   Y   |     Y
// Create overtime request      |  Y   |   Y   |     Y
// Overtime clock in/out        |  Y   |   Y   |     Y
// View own payrolls            |  Y   |   Y   |     Y
// View company info            |  Y   |   Y   |     Y
// Change password              |  Y   |   Y   |     Y
// -----------------------------|------|-------|-----------
// Manage users                 |  -   |   -   |     Y
// Manage employees             |  -   |   Y   |     Y
// Manage schedules             |  -   |   -   |     Y
// View all attendances         |  -   |   Y   |     Y
// Attendance corrections       |  -   |   Y   |     Y
// Monthly attendance report    |  -   |   Y   |     Y
// Generate payrolls            |  -   |   Y   |     Y
// Approve leave requests       |  -   |   Y   |     Y
// Approve overtime requests    |  -   |   Y   |     Y
// Manage leave types           |  -   |   Y   |     Y
// Manage departments           |  -   |   Y   |     Y
// Manage holidays              |  -   |   Y   |     Y
// Manage companies             |  -   |   -   |     Y
// Dashboard stats              |  -   |   Y   |     Y
// Audit logs                   |  -   |   -   |     Y
//
// Y* = USER role only (ADMIN/SUPER_USER blocked -> 403)
