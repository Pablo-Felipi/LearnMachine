import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart'
    as formatter;

class TextFormatterShared {
  static final phoneFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    formatter.PhoneInputFormatter(
      allowEndlessPhone: false,
      defaultCountryCode: 'br',
    ),
  ];

  static final ageFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
  ];

  static final zipCodeFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
  ];

   static final streetNumberFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
  ];
  

}
