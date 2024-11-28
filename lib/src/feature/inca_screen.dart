import 'dart:developer';

void main() {
  BankAcount data = BankAcount("jehad");
  data.setwithdrawal = 200;
  data.getbalance;
  log(data.getbalance);
}

class BankAcount {
  double _balance = 50;
  String _accountnumber;
  BankAcount(this._accountnumber);

  get getbalance => _balance;

  set setDeposit(double newnumber) {
    if (newnumber > 0) {
      _balance += newnumber;
    } else {
      print("الرصيد نفسه اكبر من صفر");
    }
  }

  set setwithdrawal(double newnumber) {
    if (newnumber > 0 && newnumber <= _balance) {
      _balance -= newnumber;
    } else {
      print("الرصيد غير كافي");
    }
  }
}
