import 'package:flutter/cupertino.dart';

class ErrorManager extends ChangeNotifier{
  bool _bSubmitTitleErrorFlag = false;
  bool _bSubmitDescriptionErrorFlag = false;
  bool _bSubmitDateErrorFlag = false;

  bool _bAlertSelectedDateError = false;
  bool _bAlertBeforeErrorFlag = false;

  bool get bSubmitTitleErrorFlag{return _bSubmitTitleErrorFlag;}
  bool get bSubmitDescriptionErrorFlag{return _bSubmitDescriptionErrorFlag;}
  bool get bSubmitDateErrorFlag{return _bSubmitDateErrorFlag;}

  bool get bAlertSelectedDateError{return _bAlertSelectedDateError;}
  bool get bAlertBeforeErrorFlag{return _bAlertBeforeErrorFlag;}

  void submitTitleErrorFlag(){
    _bSubmitTitleErrorFlag = true;
    notifyListeners();
  }

  void submitDescriptionErrorFlag(){
    _bSubmitDescriptionErrorFlag = true;
    notifyListeners();
  }

  void submitDateErrorFlag(){
    _bSubmitDateErrorFlag = true;
    notifyListeners();
  }

  void cleanSubmitFlags(){
    _bSubmitTitleErrorFlag = false;
    _bSubmitDescriptionErrorFlag = false;
    _bSubmitDateErrorFlag = false;
    notifyListeners();
  }

  void cleanSubmitTitleFlag(){
    _bSubmitTitleErrorFlag = false;
    notifyListeners();
  }

  void cleanSubmitDescriptionFlag(){
    _bSubmitDescriptionErrorFlag = false;
    notifyListeners();
  }

  void raiseAlertBeforeError(){
    _bAlertBeforeErrorFlag = true;
    notifyListeners();
  }

  void raiseAlertSelectDateError(){
    _bAlertSelectedDateError = true;
    notifyListeners();
  }

  void cleanAlertErrorFlag(){
    _bAlertSelectedDateError = false;
    _bAlertBeforeErrorFlag = false;
    notifyListeners();
  }

}