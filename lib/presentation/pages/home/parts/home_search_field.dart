part of '../home_page.dart';

class HomeSearchField extends StatefulWidget {
  final Function(String) onChanged;
  final VoidCallback onPressed;

  const HomeSearchField({
    super.key,
    required this.onChanged,
    required this.onPressed,
  });

  @override
  State<HomeSearchField> createState() => _HomeSearchFieldState();
}

class _HomeSearchFieldState extends State<HomeSearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _controller.clear();
              widget.onPressed();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
