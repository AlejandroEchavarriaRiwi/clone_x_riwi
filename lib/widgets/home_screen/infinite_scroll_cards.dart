import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '/widgets/home_screen/post_card.dart';

class InfiniteScrollCards extends StatefulWidget {
  const InfiniteScrollCards({super.key});

  @override
  _InfiniteScrollCardsState createState() => _InfiniteScrollCardsState();
}

class _InfiniteScrollCardsState extends State<InfiniteScrollCards> {
  final List<Map<String, dynamic>> _items = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  final Dio _dio = Dio();
  final String _apiUrl = 'https://6740e5dad0b59228b7f1b5d7.mockapi.io/posts/posts';

  // Estado para controlar la pestaña seleccionada
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _loadMoreItems();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading) {
        _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _dio.get(_apiUrl, queryParameters: {
        'page': _currentPage,
        'limit': _itemsPerPage,
      });

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> newItems =
            List<Map<String, dynamic>>.from(response.data);
        setState(() {
          _items.addAll(newItems);
          _currentPage++;
          _isLoading = false;
        });
      } else {
        throw Exception('Error al cargar los datos: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      debugPrint('Error al cargar los posts: $e');
    }
  }

  String calculateTimeAgo(String createdAt) {
    final DateTime postTime = DateTime.parse(createdAt);
    final Duration difference = DateTime.now().difference(postTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h';
    } else {
      return '${difference.inDays} d';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return const Padding(
              padding: EdgeInsets.all(0.1),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final item = _items[index];
          return PostCard(
            avatarUrl: item['avatar'] ?? '',
            username: item['name'] ?? 'Usuario desconocido',
            verified: item['verified'] ?? false,
            timeAgo: calculateTimeAgo(item['createdAt']),
            content: item['text'],
            imageUrl: item['image'],
            likes: item['likes'] ?? 0,
            comments: item['comments'] ?? 0,
          );
        },
      ),
    );
  }

  Widget _buildTabButton({required String label, required int index}) {
    final bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 18.0,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
