import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SimpleLoginScreen(),
    );
  }
}
//Untuk memulai aplikasi



class SimpleLoginScreen extends StatefulWidget {
  /// Kalau syaratnya terpenuhi, bisa di call
  final Function(String? email, String? password)? onSubmitted;

  const SimpleLoginScreen({this.onSubmitted, Key? key}) : super(key: key);
  @override
  State<SimpleLoginScreen> createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  late String email, password;
  String? emailError, passwordError;
  Function(String? email, String? password)? get onSubmitted =>
      widget.onSubmitted;

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';

    emailError = null;
    passwordError = null;
    //Stateawal passowrd
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
      //Kondisi password salah kalau ditekan Login
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
        //Pattern untuk email address (Karena biasanya kan aneh2)

    bool isValid = true;
    if (email.isEmpty || !emailExp.hasMatch(email)) {
      setState(() {
        emailError = 'Email is invalid';
      });
      isValid = false;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = 'Please enter a password';
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        onSubmitted!(email, password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    //MediaQuery fungsinya untuk menyamakan screen (responsive)

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .12),
            const Text(
              'Welcome,',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              'Sign in to continue!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .12),
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: 'Email',
              errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              onSubmitted: (val) => submit(),
              labelText: 'Password',
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * .075,
            ),
            FormButton(
              text: 'Log In',
              onPressed: submit,
            ),
            SizedBox(
              height: screenHeight * .15,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SimpleRegisterScreen(),
                ),
              ),
              child: RichText(
                text: const TextSpan(
                  text: "I'm a new user, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SimpleRegisterScreen extends StatefulWidget {
  final Function(
    String? email,
    String? password,
    String? fullName,
    String? address,
    double? height,
    double? weight,
    int? age,
  )? onSubmitted;
  //Function ini bekerja ketika ditekan tombol submit

  const SimpleRegisterScreen({this.onSubmitted, Key? key}) : super(key: key);
  //Cara simple menjelaskan ini mungkin kek main Lego
  //Misalkan lu bikin Rumah pakai lego, dan lu mau ada fitur2 keren tanpa mengubah bentuk rumahnya
  //misalnya bisa berubah warna, atau ada pintu rahasia
  //Super Key (key) ini pada dasarnya sebagai konstanta tetap atau base supaya kode yang kita tambahkan nantinya tidak berubah

  @override
  State<SimpleRegisterScreen> createState() => _SimpleRegisterScreenState();
}

class _SimpleRegisterScreenState extends State<SimpleRegisterScreen> {
  late String email, password, confirmPassword, fullName, address;
  double? height, weight;
  int? age;
  String? emailError, passwordError;
  Function(
    String? email,
    String? password,
    String? fullName,
    String? address,
    double? height,
    double? weight,
    int? age,
  )? get onSubmitted => widget.onSubmitted;

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';
    confirmPassword = '';
    fullName = '';
    address = '';
    height = 160.0; // Default height
    weight = 60.0; // Default weight
    age = 25; // Default age

    emailError = null;
    passwordError = null;
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (email.isEmpty || !emailExp.hasMatch(email)) {
      setState(() {
        emailError = 'Email is invalid';
      });
      isValid = false;
    }

    if (password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        passwordError = 'Please enter a password';
      });
      isValid = false;
    }
    if (password != confirmPassword) {
      setState(() {
        passwordError = 'Passwords do not match';
      });
      isValid = false;
    }

    if (fullName.isEmpty || address.isEmpty || height == 0.0 || weight == 0.0 || age == 0) {
      // Belum nambahin validasi, biar work dulu aja
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        onSubmitted!(email, password, fullName, address, height, weight, age);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .12),
            const Text(
              'Create Account,',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              'Sign up to get started!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .12),
            InputField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              labelText: 'Email',
              errorText: emailError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              labelText: 'Password',
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
              onSubmitted: (value) => submit(),
              labelText: 'Confirm Password',
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  fullName = value;
                });
              },
              labelText: 'Full Name',
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  address = value;
                });
              },
              labelText: 'Address',
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: screenHeight * .025),
            Row(
              children: [
                Expanded(
                  child: InputField(
                    onChanged: (value) {
                      setState(() {
                        height = double.tryParse(value) ?? 0.0;
                      });
                    },
                    labelText: 'Height (cm)',
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: InputField(
                    onChanged: (value) {
                      setState(() {
                        weight = double.tryParse(value) ?? 0.0;
                      });
                    },
                    labelText: 'Weight (kg)',
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  age = int.tryParse(value) ?? 0;
                });
              },
              labelText: 'Age',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: screenHeight * .075,
            ),
            FormButton(
              text: 'Sign Up',
              onPressed: submit,
            ),
            SizedBox(
              height: screenHeight * .125,
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: RichText(
                text: const TextSpan(
                  text: "I'm already a member, ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FormButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  const FormButton({this.text = '', this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String? labelText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autoFocus;
  final bool obscureText;
  const InputField(
      {this.labelText,
      this.onChanged,
      this.onSubmitted,
      this.errorText,
      this.keyboardType,
      this.textInputAction,
      this.autoFocus = false,
      this.obscureText = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

//Properti (Variabel):
//labelText: Label yang muncul di atas kolom input.
//onChanged: Fungsi yang dipanggil ketika konten kolom input berubah.
//onSubscribed: Fungsi yang dipanggil ketika pengguna mengirimkan input, misalnya dengan menekan Enter pada keyboard.
//errorText: Teks yang muncul di bawah kolom input untuk menampilkan pesan kesalahan.
//keyboardType: Jenis keyboard yang muncul saat pengguna fokus pada kolom input (misalnya, numerik, email).
//textInputAction: Menentukan tindakan yang harus diambil ketika pengguna menekan tombol tindakan pada keyboard (misalnya, selanjutnya, selesai).
//autoFocus: Boolean yang menunjukkan apakah kolom input harus secara otomatis memiliki fokus saat layar dimuat.
//ObscureTeks: Boolean yang menunjukkan apakah teks yang dimasukkan harus dikaburkan (misalnya, untuk masukan kata sandi).
//Build Method:
//Build Method mengembalikan widget TextField, yang merupakan widget Flutter standar untuk input teks.
//Ia menggunakan properti yang disediakan untuk menyesuaikan tampilan dan perilaku kolom input. Misalnya, mengatur label, teks kesalahan, jenis keyboard, dll.
//TextField dibungkus dengan InputDecoration untuk menambahkan style tambahan, seperti bordernya mau bentuk bulat.
