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
    final currentTheme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              children: [
                OptionCard(                
                  image: 'assets/cafe.png',
                  title: 'Cafe',
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                ),
                OptionCard(
                  image: 'assets/te.png',
                  title: 'Té',
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => RegisterScreen(),),
                    );
                  },
                ),
                OptionCard(
                  image: 'assets/frappe.png',
                  title: 'Frappes y Malteadas',
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => LoginScreen(),),
                    );
                  },
                ),
                OptionCard(
                  image: 'assets/postre.png',
                  title: 'Postres',
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => LoginScreen(),),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onPressed;

  const OptionCard({
    required this.image,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
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
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20.0),
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage('assets/fondo.jpg'),
          ),
          SizedBox(height: 20),
          OptionItem(
            icon: Icons.edit,
            title: 'Editar Perfil',
            onTap: () {
              // Acción para la opción 1
              
            },
          ),
          Divider(),
          OptionItem(
            icon: Icons.palette,
            title: 'Cambiar tema',
            onTap: () {
              // Acción para la opción 2
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => ThemeConfig()));
            },
          ),
          Divider(),
          OptionItem(
            icon: Icons.logout,
            title: 'Cerrar Sesion',
            onTap: () {
              // Acción para la opción 3
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const OptionItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 16.0),
            Text(title),
          ],
        ),
      ),
    );
  } 
}

