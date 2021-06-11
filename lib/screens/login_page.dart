import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool? _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.adb_rounded),
        title: Row(
          children: [
            Text('Tarake'),
            Expanded(child: Container()),
            GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(width: 280.0,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                          "Переход на страницу регистрации сервисного центра"),
                    ),
                  );
                }, child: Text("Зарегистрировать сервисный центр")),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Вход",
                            style: TextStyle(
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                            "Пожалуйста, чтобы выполнить вход, заполните следующие поля:"),
                        // login
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text("Имя пользователя *"),
                            ),
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                validator: (value) => value == null ||
                                        value.isEmpty
                                    ? "Необходимо заполнить «Имя пользователя»."
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        // password
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text("Пароль *"),
                            ),
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) =>
                                    value == null || value.isEmpty
                                        ? "Необходимо заполнить «Пароль»."
                                        : null,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _isRememberMe,
                              onChanged: (value) =>
                                  setState(() => _isRememberMe = value),
                            ),
                            Text("Запомнить"),
                          ],
                        ),
                        GestureDetector(
                          child: Text(
                            "Если вы забыли пароль, его можно сбросить..",
                            style: TextStyle(
                              color: Colors.indigo,
                            ),
                          ),
                          onTap: () =>
                              ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              width: 280.0,
                              behavior: SnackBarBehavior.floating,
                              content:
                                  Text("Переход на страницу сброса пароля"),
                            ),
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    width: 280.0,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                        "Переход на страницу ремонтов и прочего"),
                                  ),
                                );
                              }
                            },
                            child: Text("Вход"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
