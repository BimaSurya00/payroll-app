import 'package:payroll_app/core/api/api_helper.dart';
import 'package:payroll_app/core/config/app_config.dart';
import 'package:payroll_app/features/company/data/models/company_response.dart';

abstract interface class CompanyRemoteDataSource {
  Future<CompanyResponse> getCurrentCompany();
}

class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  CompanyRemoteDataSourceImpl();

  @override
  Future<CompanyResponse> getCurrentCompany() async {
    final baseUrl = FlavorConfig.instance.baseUrl;
    return ApiHelper.request<CompanyResponse>(
      url: '$baseUrl/companies/current',
      method: Method.GET,
      fromJson: (json) => CompanyResponse.fromJson(json),
    );
  }
}
