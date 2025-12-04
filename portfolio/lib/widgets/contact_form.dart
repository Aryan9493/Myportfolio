import 'package:flutter/material.dart';
import '../utils/theme.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isSubmitted) {
      return _buildSuccessState(context);
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Your name',
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'your.email@example.com',
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          
          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(
              labelText: 'Message',
              hintText: 'Your message...',
              prefixIcon: Icon(Icons.message),
              alignLabelWithHint: true,
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a message';
              }
              if (value.length < 10) {
                return 'Message must be at least 10 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          
          ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: const Text('Send Message'),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: AppColors.accentTeal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.accentTeal.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: AppColors.accentTeal,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 48,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Message Sent!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AppColors.accentTeal,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Thank you for reaching out. I\'ll get back to you soon!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {
              setState(() {
                _isSubmitted = false;
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              });
            },
            child: const Text('Send Another Message'),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simulate form submission
      setState(() {
        _isSubmitted = true;
      });
    }
  }
}
