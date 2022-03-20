import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EthereumUtils {
  late http.Client httpClient;
  late Web3Client ethClient;
  final contractAddress = dotenv.env["HEALTH_TECH_CONTRACT_ADDRESS"];

  void initialSetup() {
    httpClient = http.Client();
    String infura =
        "https://rinkeby.infura.io/v3/" '71fdb5df946846f5ae424207dac62289';
    ethClient = Web3Client(infura, httpClient);
  }

  Future<DeployedContract> getDeployedContract() async {
    String abi = await rootBundle.loadString("assets/docAbi.json");
    final contract = DeployedContract(ContractAbi.fromJson(abi, "doctor_"),
        EthereumAddress.fromHex('0x3A37f0cDE09FeB4a5cE627A80274557720392Bf5'));

    return contract;
  }

  Future retreive_doc() async {
    List<dynamic> result = await query("retreive_doc", []);
    var myData = result[0];
    return myData;
  }

  Future<String> withdrawCoin(double amount) async {
    var bigAmount = BigInt.from(amount);
    var response = await submit("withdrawBalance", [bigAmount]);
    return response;
  }

  Future<String> depositCoin(double amount) async {
    var bigAmount = BigInt.from(amount);
    var response = await submit("depositBalance", [bigAmount]);
    return response;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await getDeployedContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    try {
      EthPrivateKey credential = EthPrivateKey.fromHex(
          '70a5a91e738ab0fc2e1ae50d61fc4b6c43b4f595f9f2c208ab83d306d533febb');
      DeployedContract contract = await getDeployedContract();
      final ethFunction = contract.function(functionName);
      final result = await ethClient.sendTransaction(
          credential,
          Transaction.callContract(
              contract: contract,
              function: ethFunction,
              parameters: args,
              maxGas: 100000),
          chainId: 4);
      return result;
    } catch (e) {
      print("Something wrong happened!");
      return ("error");
    }
  }
}
