import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:proyecto_cafe/screens/login_screen.dart';
import 'package:proyecto_cafe/screens/register_screen.dart';
import 'package:proyecto_cafe/screens/theme_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreen({super.key});
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Contenido de la opción 1',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Contenido de la opción 2',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 20.0),
      //descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.all(24.0),
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Bienvenido",
          body: "Esta es la primera diapositiva de introducción",
          image: Image.asset('assets/fondo3.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Funcionalidad 1",
          body: "Aquí puedes describir la primera funcionalidad de tu app",
          image: Image.asset('assets/fondo3.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Funcionalidad 2",
          body: "Aquí puedes describir la segunda funcionalidad de tu app",
          image: Image.asset('assets/fondo3.jpg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {
        // Acción cuando se completa el onboarding screen
        // Por ejemplo, navegar a la pantalla de inicio de sesión
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      },
      showSkipButton: true,
      dotsFlex: 0,
      nextFlex: 0,
      skip: const Text('Saltar'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Listo', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20.0),
        CircleAvatar(
          radius: 60.0,
          backgroundImage: AssetImage('assets/fondo.jpg'),
        ),
        SizedBox(height: 20.0),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Editar perfil'),
                onTap: () {
                  // Acción para editar perfil
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.palette),
                title: Text('Cambiar tema'),
                onTap: () {
                  // Acción para cambiar tema
                  Navigator.push(context,
                MaterialPageRoute(builder: (context) => ThemeConfig()));
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Cerrar Sesion'),
                onTap: () {
                  // Acción para eliminar cuenta
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

