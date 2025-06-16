import 'package:flutter/material.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
       
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: IntrinsicHeight(
          
          child: Row(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            // Left: Form
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Let's get in touch",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Basement Grotesque',
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Pellentesque in ipsum id orci porta dapibus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Done',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email ID',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      hintText: '-Select Subject-',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    items: const [
                      DropdownMenuItem(value: '', child: Text('-Select Subject-')),
                      DropdownMenuItem(value: 'General', child: Text('General')),
                      DropdownMenuItem(value: 'Support', child: Text('Support')),
                      DropdownMenuItem(value: 'Feedback', child: Text('Feedback')),
                    ],
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF24439B), // Primary
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      ),
                      onPressed: () {},
                      child: const Text('Send', style: TextStyle(fontSize: 16,color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 32),
            // Divider
            SizedBox(
              width: 4,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF15A5CD),
                      Color(0x0015A5CD),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 32),
            // Right: Contact Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text('Call Us', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Pellentesque in ipsum id orci porta dapibus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Done', style: TextStyle(fontSize: 13)),
                  const SizedBox(height: 8),
                  _ContactInfoTile(
                    icon: Icons.phone,
                    text: '+1-323-453-5817',
                    bgColor: const Color(0xFF333333),
                  ),
                  const SizedBox(height: 24),
                  const Text('Email', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Pellentesque in ipsum id orci porta dapibus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Done', style: TextStyle(fontSize: 13)),
                  const SizedBox(height: 8),
                  _ContactInfoTile(
                    icon: Icons.email,
                    text: 'contact@example.com',
                    bgColor: const Color(0xFF333333),
                  ),
                  const SizedBox(height: 24),
                  const Text('Chat Support', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Pellentesque in ipsum id orci porta dapibus. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Done', style: TextStyle(fontSize: 13)),
                  const SizedBox(height: 8),
                  _ContactInfoTile(
                    icon: Icons.message,
                    text: 'Text message',
                    bgColor: const Color(0xFF333333),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class _ContactInfoTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color bgColor;
  const _ContactInfoTile({required this.icon, required this.text, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
