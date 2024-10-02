import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú de Cursos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: MenuCursos(),
    );
  }
}

class MenuCursos extends StatelessWidget {
  final List<Curso> cursos = [
    Curso("Desarrollo Flutter", "assets/flutter_logo.png", "Aprende a crear apps móviles."),
    Curso("Ciencia de Datos", "assets/data_science.png", "Adéntrate en el análisis de datos y la IA."),
    Curso("Desarrollo Web", "assets/web_dev.png", "Crea aplicaciones web modernas."),
    Curso("Diseño Gráfico", "assets/graphic_design.png", "Explora la creatividad visual."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cursos Disponibles', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          // Fondo degradado
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.purple.shade500, Colors.pink.shade400],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: cursos.length,
            itemBuilder: (context, index) {
              return TarjetaCurso(curso: cursos[index]);
            },
          ),
        ],
      ),
    );
  }
}

class Curso {
  final String nombre;
  final String rutaImagen;
  final String descripcion;

  Curso(this.nombre, this.rutaImagen, this.descripcion);
}

class TarjetaCurso extends StatelessWidget {
  final Curso curso;

  TarjetaCurso({required this.curso});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 6, // Más sombra
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(15.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              curso.rutaImagen,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            curso.nombre,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            curso.descripcion,
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white70),
        ),
      ),
    );
  }
}
