import 'package:my_coding_setup/core/constants/api_constants.dart';
import 'package:my_coding_setup/data/enums/credit_type_enum.dart';
import 'package:rest_api_package/rest_api_package.dart';

final class GetLoanOffersRequest extends IRestApiRequest {
  GetLoanOffersRequest({
    required this.loanType,
    required this.loanAmount,
    required this.loanTerm,
  }) {
    baseUrl = APIConstants.baseURL;
    endPoint = '${APIConstants.getLoanOffersByTypeEndPoint}?kredi_tipi=${loanType.value}&vade=$loanTerm&tutar=$loanAmount';

    requestMethod = RequestMethod.GET;

    authorize = false;
  }
  final LoanTypeEnum loanType;
  final int loanAmount;
  final int loanTerm;
}
