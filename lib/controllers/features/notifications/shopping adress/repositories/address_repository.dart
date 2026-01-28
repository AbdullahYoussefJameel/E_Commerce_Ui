import 'package:e_commerce_app_ui/controllers/features/notifications/shopping%20adress/models/address.dart';

class AddressRepository {
  List<Address> getAddresses() {
    return const [
      Address(
        id: '1',
        label: 'Home',
        fullAddress: 'شارع فلسطين، قرب مجمع الأيادي السكني',
        city: 'Baghdad',
        state: 'Baghdad Governorate',
        zipcode: '10069',
        isDefault: true,
        type: AddressType.home,
      ),
      Address(
        id: '2',
        label: 'Office',
        fullAddress: 'الكرادة داخل، شارع 62، قرب مطعم الساعة',
        city: 'Baghdad',
        state: 'Baghdad Governorate',
        zipcode: '10001',
        isDefault: false,
        type: AddressType.office,
      ),
    ];
  }

  Address? getDefultAddress() {
    return getAddresses().firstWhere(
      (address) => address.isDefault,
      orElse: () => getAddresses().first,
    );
  }
}
