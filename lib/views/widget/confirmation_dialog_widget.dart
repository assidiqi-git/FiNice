import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmText = 'Hapus',
    this.cancelText = 'Batal',
    this.isDestructive = true, // Jika true, tombol konfirmasi berwarna merah
  });

  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final bool isDestructive;
  final VoidCallback onConfirm;

  /// Static Method untuk memanggil dialog dengan mudah dari mana saja
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String content,
    required VoidCallback onConfirm,
    String confirmText = 'Hapus',
    String cancelText = 'Batal',
    bool isDestructive = true,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User wajib memilih, tidak bisa tap luar
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: title,
          content: content,
          onConfirm: onConfirm,
          confirmText: confirmText,
          cancelText: cancelText,
          isDestructive: isDestructive,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      content: Text(
        content,
        style: const TextStyle(fontSize: 15, color: Colors.black87),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      actions: <Widget>[
        // Tombol Batal
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(foregroundColor: Colors.grey[600]),
          child: Text(cancelText),
        ),

        // Tombol Konfirmasi
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop(); // Tutup dialog
            onConfirm(); // Jalankan aksi
          },
          style: TextButton.styleFrom(
            // Ubah warna berdasarkan isDestructive
            foregroundColor: isDestructive ? Colors.red : Colors.indigo,
          ),
          child: Text(
            confirmText,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
