import 'package:teklifimgelsin_case/core/constants/api_constants.dart';
import 'package:teklifimgelsin_case/data/enums/credit_type_enum.dart';
import 'package:rest_api_package/rest_api_package.dart';

final class GetLoanOffersRequest extends IRestApiRequest {
  GetLoanOffersRequest({
    required this.loanType,
    required this.loanAmount,
    required this.loanTerm,
  }) {
    baseUrl = APIConstants.baseURL;
    endPoint = '${APIConstants.getLoanOffersByTypeEndPoint}?kredi_tipi=${loanType.value}&vade=$loanTerm&tutar=${loanAmount.toInt()}';

    requestMethod = RequestMethod.GET;

    authorize = false;
  }
  final LoanTypeEnum loanType;
  final double loanAmount;
  final int loanTerm;
}
