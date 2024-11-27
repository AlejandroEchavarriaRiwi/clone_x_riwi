import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeftColumn extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const LeftColumn({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  _LeftColumnState createState() => _LeftColumnState();
}

class _LeftColumnState extends State<LeftColumn> {
  int? hoveredIndex; // Para rastrear el índice en hover

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ícono de encabezado alineado a la izquierda
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FaIcon(
                FontAwesomeIcons.xTwitter,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          // Lista de navegación
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildNavItem(
                  icon: Icons.home,
                  label: 'Home',
                  index: 0,
                ),
                _buildNavItem(
                  icon: Icons.search,
                  label: 'Search',
                  index: 1,
                ),
                _buildNavItem(
                  icon: Icons.notifications,
                  label: 'Notifications',
                  index: 2,
                ),
                _buildNavItem(
                  icon: Icons.mail,
                  label: 'Messages',
                  index: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = index == widget.currentIndex;
    final bool isHovered = hoveredIndex == index;

    // Define dinámicamente el estilo del contenedor
    final BoxDecoration decoration = BoxDecoration(
      color: isHovered
          ? const Color.fromARGB(255, 123, 123, 123).withOpacity(0.2)
          : isSelected
              ? const Color.fromARGB(0, 0, 0, 0).withOpacity(
                  0.2) // Color diferente para el estado seleccionado
              : const Color.fromARGB(0, 0, 0, 0),
      borderRadius: BorderRadius.circular(8.0),
    );

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          hoveredIndex = null;
        });
      },
      child: GestureDetector(
        onTap: () => widget.onTap(index),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: decoration, // Usa la decoración dinámica
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.white,
              ),
              const SizedBox(width: 16.0),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
