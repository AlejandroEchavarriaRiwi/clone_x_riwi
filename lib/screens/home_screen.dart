import 'package:clone_x_riwi/screens/following_screen.dart';
import 'package:flutter/material.dart';
import 'package:clone_x_riwi/screens/messages_page.dart';
import 'package:clone_x_riwi/screens/notifications_page.dart';
import 'package:clone_x_riwi/screens/search_screen.dart';
import '/widgets/custom_app_bar.dart';
import '/widgets/custom_bottom_navigation_bar.dart';
import '/widgets/responsive_body.dart';
import '/widgets/home_screen/left_column.dart'; // Importa la columna izquierda
import '/widgets/home_screen/right_column.dart'; // Importa la columna derecha
import '/widgets/home_screen/infinite_scroll_cards.dart'; // Importa el widget de scroll infinito

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0; // Mantiene el índice de la vista principal (Para ti, Following, Search, etc.)
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Establece 2 pestañas para "Para ti" y "Siguiendo"
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: isMobile
          ? const CustomAppBar() // Muestra el CustomAppBar en móviles
          : null, // Si no es móvil, no muestra AppBar
      backgroundColor: Colors.black, // Fondo negro para todo el Scaffold
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300), // Máximo ancho de 1300 píxeles
          child: ResponsiveBody(
            leftColumn: isMobile
                ? const SizedBox.shrink() // Usa un contenedor vacío si es móvil
                : LeftColumn(
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index; // Actualiza el índice al hacer tap
                      });
                    },
                  ), // Usa el widget LeftColumn
            centerColumn: Column(
              children: [
                // Mostrar TabBar solo si el índice es de "Para ti" o "Siguiendo"
                if (_currentIndex == 0)
                  TabBar(
                    controller: _tabController,
                    onTap: (index) {
                      setState(() {
                        _tabController.index = index; // Cambia el índice del TabController
                      });
                    },
                    tabs: const [
                      Tab(text: 'Para ti'),
                      Tab(text: 'Siguiendo'),
                    ],
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                  ),
                Expanded(
                  child: IndexedStack(
                    index: _tabController.index, // Sincroniza el índice de la vista con el TabController
                    children: [
                      // Aquí están todas las vistas que se alternan dependiendo del índice
                      IndexedStack(
                        index: _tabController.index,
                        children: const [
                          InfiniteScrollCards(), // Vista de "Para ti"
                          FollowingScreen(), // Vista de "Siguiendo"
                        ],
                      ),
                      SearchScreen(), // Vista de Búsqueda
                      NotificationsPage(), // Vista de Notificaciones
                      MessagesPage(), // Vista de Mensajes
                    ],
                  ),
                ),
              ],
            ),
            rightColumn: isMobile
                ? const SizedBox.shrink() // Usa un contenedor vacío si es móvil
                : const RightColumn(), // Usa el widget RightColumn
          ),
        ),
      ),
      bottomNavigationBar: isMobile
          ? CustomBottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index; // Cambia el contenido de la columna central
                  if (_currentIndex == 0) {
                    // Si el índice es 0 (Para ti), restablece el TabController
                    _tabController.index = 0; // Asegura que "Para ti" esté activo
                  }
                });
              },
            )
          : null, // Oculta el BottomNavigationBar en pantallas grandes
    );
  }
}
