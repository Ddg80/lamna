enum AccountType {
  traveler,
  company,
}

class Account {
  late int id;
  late String email;
  late String firstName;
  late String lastName;
  late String password;
  late AccountType type;
  Account(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.type});
}

List<Account> accounts = [
  Account(
      id: 1,
      email: "lucasguillard@gmail.com",
      firstName: "Lucas",
      lastName: "Guillard",
      password: "qwerty1234",
      type: AccountType.traveler),
  Account(
      id: 2,
      email: "mysupercomany@gmail.com",
      firstName: "Sara",
      lastName: "Conor",
      password: "qwerty1234",
      type: AccountType.company),
  Account(
      id: 3,
      email: "test@test.fr",
      firstName: "Sara",
      lastName: "Conor",
      password: "qwerty1234",
      type: AccountType.traveler)
];
