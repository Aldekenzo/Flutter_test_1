import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFF3F4F6),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: CupertinoColors.white,
              child: Column(
                children: [
                  CupertinoTextField(
                    decoration: BoxDecoration(color: CupertinoColors.white),
                    placeholder: 'Логин или почта',
                    padding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 16),
                  ),
                  Container(
                    height: 1,
                    color: Color(0xFFE0E6ED),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  CupertinoTextField(
                    decoration: BoxDecoration(color: CupertinoColors.white),
                    placeholder: 'Пароль',
                    padding: const EdgeInsets.symmetric(
                        vertical: 19, horizontal: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                color: Color(0xFF4631D2),
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text('Войти',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 19),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CupertinoButton(
                color: Color(0xFF4631D2),
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}






/*
 SafeArea(
        child: Container(
        padding: EdgeInsets.only(top: 200),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              color: Colors.white,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFE90202),
                          style: BorderStyle.solid,
                          width: 1
                        ),
                      ),
                      labelText: 'Логин или Почта',
                      labelStyle: TextStyle(fontSize: 18, color: Color(0xFFC9C9C9))
                      
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Пароль',
                      labelStyle: TextStyle(fontSize: 18, color: Color(0xFFC9C9C9))
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35,),

            ElevatedButton(onPressed: (){},
            
             child: Text('Войти', style: TextStyle(fontSize: 17.5),),
             
             style: ElevatedButton.styleFrom(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(8),
               ),
               primary: Color(0xFF3A1AC9),
               elevation: 0.1,
               fixedSize: Size(350, 65)
               
             )),
             SizedBox(height: 17,),
             ElevatedButton(onPressed: (){},
             child: Text('Зарегистрироватся', style: TextStyle(fontSize: 17.5),),
             
             style: ElevatedButton.styleFrom(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(8),
               ),
               primary: Color(0xFF3A1AC9),
               elevation: 0.1,
               fixedSize: Size(350, 65)
               
             )),
             
          ],
        ),
      ),
    ),
  */