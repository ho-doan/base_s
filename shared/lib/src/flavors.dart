enum Flavor {
  dev,
  test,
  stg,
  prod,
}

class F {
  F._();
  static final instance = F._();
  Flavor appFlavor = Flavor.dev;

  String get name => appFlavor.name;
}
