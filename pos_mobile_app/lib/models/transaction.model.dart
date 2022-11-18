import '../enums/transaction_status.dart';

List<Transaction> TRANSACTION_LIST = [
  Transaction(
    id: '1',
    title: 'POS 1',
    date: "11 July, '22",
    status: TransactionStatus.CREDIT,
    amount: '45,000',
  ),
  Transaction(
    id: '2',
    title: 'POS 2',
    date: "11 July, '22",
    status: TransactionStatus.DEBIT,
    amount: '45,000',
  ),
  Transaction(
    id: '3',
    title: 'POS 3',
    date: "11 July, '22",
    status: TransactionStatus.DEBIT,
    amount: '1,250',
  ),
  Transaction(
    id: '4',
    title: 'POS 4',
    date: "11 July, '22",
    status: TransactionStatus.CREDIT,
    amount: '8,000',
  ),
  Transaction(
    id: '5',
    title: 'POS 5',
    date: "11 July, '22",
    status: TransactionStatus.DEBIT,
    amount: '45,000',
  ),
];

class Transaction {
  String id;
  String title;
  TransactionStatus status;
  String date;
  String amount;

  Transaction({
    required this.id,
    required this.title,
    required this.status,
    required this.date,
    required this.amount,
  });
}
