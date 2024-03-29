class AppValidator {
  AppValidator._();

  static String? validateMobile(String? mobile) {
    if (mobile == null || mobile.isEmpty) {
      return "Mobile number is required";
    }

    final mobileRegExp = RegExp(r"^[6-9]\d{9}$");

    if (!mobileRegExp.hasMatch(mobile)) {
      return "Enter a valid mobile number";
    }

    return null;
  }

  static String? validatePin(String? pin) {
    if (pin == null || pin.isEmpty) {
      return "Pin is required";
    }

    if (pin.length < 4 || pin.length > 4) {
      return 'Pin must of 4 character';
    }

    return null;
  }

  static String? validateHotelName(String? name) {
    if (name == null || name.isEmpty) {
      return "This is required";
    }

    if (name.length < 4) {
      return 'Name must of atleast 4 character';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }

    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!emailRegExp.hasMatch(email)) {
      return "Enter a valid email";
    }

    return null;
  }

  static String? validateOtp(String? otp) {
    if (otp == null || otp.isEmpty) {
      return "OTP is required";
    }

    if (otp.length < 6 || otp.length > 6) {
      return 'OTP must of 6 character';
    }

    return null;
  }

  static String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return "Address is required";
    }

    if (address.length < 10) {
      return 'Address must of atleast 10 character';
    }

    return null;
  }
}
