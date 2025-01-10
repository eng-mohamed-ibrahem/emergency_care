enum Routes {
  splash("/", "Splash"),
  login("/login", "Login"),
  register("/register", "Register"),
  home("/home", "Home"),
  profile("/profile", "Profile"),
  editProfile("edit", "Edit_Profile"),
  editVehcile("vehicle", "Edit_Vehicle"),
  contacts("contacts", "Contacts"),
  emergencyContacts("/emergency_contacts", "Emergency_Contacts"),

  /// will be inside the home page
  registerVehicle("register-vehicle", "Register_Vehicle"),
  about("about", "About");

  final String path;
  final String name;

  const Routes(this.path, this.name);
}
