import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Accueil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _afficherPageEnvoyer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFF3F3F3), // Fond global de la modal
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const PageEnvoyerArgent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(0, 143, 143, 143),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              'assets/images/logo.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: const Color(0xFFF3F3F3),
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 80),
              Image.asset(
                "assets/images/banner.png",
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Transactions",
                      style: TextStyle(
                        color: Color.fromARGB(255, 82, 82, 82),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Afficher tout",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/sendpfp.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Migros M Aira pute",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "30 juin",
                              style: TextStyle(
                                color: Color.fromARGB(255, 109, 109, 109),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Text(
                          "-0,95",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Image.asset(
                "assets/images/banner2.png",
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _afficherPageEnvoyer(context),
                            child: Container(
                              height: 135,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/envoyer.png',
                                  width: 55,
                                  height: 90,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Container(
                            height: 135,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/demander.png',
                                width: 153,
                                height: 90,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7DB27E),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/payer.png',
                          width: 110,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class PageEnvoyerArgent extends StatefulWidget {
  const PageEnvoyerArgent({super.key});

  @override
  State<PageEnvoyerArgent> createState() => _PageEnvoyerArgentState();
}

class _PageEnvoyerArgentState extends State<PageEnvoyerArgent> with SingleTickerProviderStateMixin {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final FocusNode _amountFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _messageFocus = FocusNode();

  bool _isFormValid = false;
  bool _isAmountEntered = false;
  bool _anyFieldFocused = false;

  // Variables pour l'animation de chargement
  bool _isLoading = false;
  late AnimationController _loadingController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _amountFocus.requestFocus();
    });

    _amountController.addListener(_gererChangementMontant);
    _phoneController.addListener(_verifierFormulaire);
    _nameController.addListener(_verifierFormulaire);

    _amountFocus.addListener(_gererChangementFocus);
    _phoneFocus.addListener(_gererChangementFocus);
    _nameFocus.addListener(_gererChangementFocus);
    _messageFocus.addListener(_gererChangementFocus);

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _messageController.dispose();
    _amountFocus.dispose();
    _phoneFocus.dispose();
    _nameFocus.dispose();
    _messageFocus.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  void _gererChangementMontant() {
    setState(() {
      _isAmountEntered = _amountController.text.isNotEmpty;
    });
    _verifierFormulaire();
  }

  void _gererChangementFocus() {
    setState(() {
      _anyFieldFocused = _amountFocus.hasFocus ||
          _phoneFocus.hasFocus ||
          _nameFocus.hasFocus ||
          _messageFocus.hasFocus;
    });
  }

  void _verifierFormulaire() {
    final montantValide = _amountController.text.isNotEmpty;
    final telephoneValide = _phoneController.text.length > 5;
    final nomValide = _nameController.text.trim().isNotEmpty;

    setState(() {
      _isFormValid = montantValide && telephoneValide && nomValide;
    });
  }

  // --- LOGIQUE D'ENVOI ET D'ANIMATION ---
  void _lancerEnvoi() async {
    // 1. Cacher le clavier et démarrer le blur/loading
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    _loadingController.repeat();

    // 2. Simuler un temps de chargement réseau
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    _loadingController.stop();

    String montantSaisi = _amountController.text;
    String nomSaisi = _nameController.text;
    String telSaisi = _phoneController.text;

    // 3. Fermer le modal actuel
    Navigator.pop(context);

    // 4. Ouvrir la page de succès avec une animation Slide up sur toute la fenêtre
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false, // Permet l'animation au-dessus
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) => PageSuccesEnvoyer(
          montant: montantSaisi,
          nom: nomSaisi,
          numero: telSaisi,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeOutCubic;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }

  Widget _buildEmojiButton(String emoji) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          emoji,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFFA3A3A3), fontSize: 16),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFAEAEAE), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFA3A3A3), width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // CONTENU PRINCIPAL
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.94,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFF3F3F3),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Barre d'en-tête (Fixe)
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    border: Border(bottom: BorderSide(color: Color.fromARGB(255, 228, 228, 228))),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 90),
                      const Text(
                        "Envoyer",
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        ),
                        child: const Text("Interrompre", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),

                // Corps défilant
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SECTION : Montant
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 16, top: 18, bottom: 8),
                          child: const Text("Montant", style: TextStyle(color: Color(0xFF666666), fontWeight: FontWeight.bold, fontSize: 13)),
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          color: const Color(0xFFFFFFFF),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "CHF ",
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: _isAmountEntered ? Colors.black : const Color(0xFFA3A3A3),
                                ),
                              ),
                              IntrinsicWidth(
                                child: TextField(
                                  controller: _amountController,
                                  focusNode: _amountFocus,
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (_) => _phoneFocus.requestFocus(),
                                  style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                                  decoration: const InputDecoration(
                                    hintText: "0,00",
                                    hintStyle: TextStyle(color: Color(0xFFA3A3A3)),
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // SECTION : Contacts
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 16, top: 18, bottom: 8),
                          child: const Text("Contacts", style: TextStyle(color: Color(0xFF666666), fontWeight: FontWeight.bold, fontSize: 13)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              TextField(
                                controller: _phoneController,
                                focusNode: _phoneFocus,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                onSubmitted: (_) => _nameFocus.requestFocus(),
                                inputFormatters: [FormateurTelephoneSuisse()],
                                decoration: _buildInputDecoration("p. ex. 079 555 12 34"),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: _nameController,
                                focusNode: _nameFocus,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                onSubmitted: (_) => _messageFocus.requestFocus(),
                                decoration: _buildInputDecoration("Prénom, nom"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Autoriser l'accès aux contacts", style: TextStyle(color: Color(0xFF62AA6E), fontWeight: FontWeight.w600, fontSize: 15)),
                          ),
                        ),

                        // SECTION : Message
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Message", style: TextStyle(color: Color(0xFF666666), fontWeight: FontWeight.bold, fontSize: 13)),
                              if (_anyFieldFocused)
                                GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.white,
                                    ),
                                    child: const Text(
                                      "Terminé",
                                      style: TextStyle(color: Color(0xFF62AA6E), fontWeight: FontWeight.bold, fontSize: 13),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              TextField(
                                controller: _messageController,
                                focusNode: _messageFocus,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                decoration: _buildInputDecoration("Ajouter un message"),
                              ),
                              const SizedBox(height: 14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildEmojiButton("🙏"),
                                  _buildEmojiButton("😘"),
                                  _buildEmojiButton("🥪"),
                                  _buildEmojiButton("❤️"),
                                  _buildEmojiButton("🍕"),
                                  _buildEmojiButton("🎉"),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.symmetric(horizontal: BorderSide(color: Colors.grey.shade300, width: 0.8)),
                                ),
                                child: IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(vertical: 14),
                                            child: Text(
                                              "GIF",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF57A965), fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(width: 1, color: Colors.grey.shade300),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.image_outlined, color: Color(0xFF57A965), size: 24),
                                        ),
                                      ),
                                      VerticalDivider(width: 1, color: Colors.grey.shade300),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.camera_alt_outlined, color: Color(0xFF57A965), size: 24),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Bouton Principal d'action
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            decoration: BoxDecoration(
                              color: _isFormValid ? const Color(0xFF7DB27E) : const Color(0xFFB1D4B7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: _isFormValid ? _lancerEnvoi : null,
                              child: const Text(
                                "Envoyer de l'argent",
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // OVERLAY DE CHARGEMENT BLUR
        if (_isLoading)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _loadingController,
                      builder: (context, child) {
                        return CustomPaint(
                          size: const Size(45, 50),
                          painter: HexagonLoaderPainter(
                            animationValue: _loadingController.value,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// --- CLASSE POUR LA PAGE DE SUCCES ---
class PageSuccesEnvoyer extends StatefulWidget {
  final String montant;
  final String nom;
  final String numero;

  const PageSuccesEnvoyer({
    super.key,
    required this.montant,
    required this.nom,
    required this.numero,
  });

  @override
  State<PageSuccesEnvoyer> createState() => _PageSuccesEnvoyerState();
}

class _PageSuccesEnvoyerState extends State<PageSuccesEnvoyer> with SingleTickerProviderStateMixin {
  late AnimationController _successController;

  @override
  void initState() {
    super.initState();
    _successController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    // Lance l'animation du vu après un tout petit délai
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _successController.forward();
    });
  }

  @override
  void dispose() {
    _successController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String initiale = widget.nom.isNotEmpty ? widget.nom.trim()[0].toUpperCase() : "?";

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF307432), // 100% (Bas)
              Color(0xFF43A747), // 0% (Haut)
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 200),
              
              // Hexagone animé + Vu
              AnimatedBuilder(
                animation: _successController,
                builder: (context, child) {
                  return CustomPaint(
                    size: const Size(45, 50),
                    painter: SuccessIconPainter(
                      animationValue: _successController.value,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                "L'envoi a réussi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const Spacer(),

              // Carte blanche façon "Ticket"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: Text(
                          "Montant",
                          style: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 0),
                      Center(
                        child: Text(
                          "CHF ${widget.montant}",
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 10),
                      
                      // Ligne de séparation avec encoche
                      SizedBox(
                        width: double.infinity,
                        height: 10,
                        child: CustomPaint(
                          painter: TicketSeparatorPainter(),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 8, right: 16,),
                        child: Text(
                          "Bénéficiaire",
                          style: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                        child: Row(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  initiale,
                                  style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.translate(
                                  offset: const Offset(0, -2),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.nom,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        widget.numero,
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Bouton Fermer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Retour à l'écran d'accueil
                    },
                    child: const Text(
                      "Fermer",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// --- PAINTERS PERSONNALISÉS ---

// 1. L'hexagone de chargement
class HexagonLoaderPainter extends CustomPainter {
  final double animationValue;

  HexagonLoaderPainter({required this.animationValue});

  Path _getHexagonPath(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    // Dessine l'hexagone (sommet en haut)
    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.75);
    path.lineTo(w * 0.5, h);
    path.lineTo(0, h * 0.75);
    path.lineTo(0, h * 0.25);
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final path = _getHexagonPath(size);

    // Peinture de fond (hexagone gris clair)
    final bgPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, bgPaint);

    // Peinture animée (segment gris foncé)
    final fgPaint = Paint()
      ..color = const Color(0xFF333333)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final metrics = path.computeMetrics().first;
    final totalLength = metrics.length;
    
    // Le segment représente 25% du périmètre
    final segmentLength = totalLength * 0.25; 
    final currentOffset = animationValue * totalLength;

    Path extractPath = Path();
    if (currentOffset + segmentLength > totalLength) {
      // Gère le passage à la fin de la boucle
      extractPath.addPath(metrics.extractPath(currentOffset, totalLength), Offset.zero);
      extractPath.addPath(metrics.extractPath(0, (currentOffset + segmentLength) - totalLength), Offset.zero);
    } else {
      extractPath = metrics.extractPath(currentOffset, currentOffset + segmentLength);
    }

    canvas.drawPath(extractPath, fgPaint);
  }

  @override
  bool shouldRepaint(covariant HexagonLoaderPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

// 2. L'hexagone de succès blanc et la coche (vu)
class SuccessIconPainter extends CustomPainter {
  final double animationValue;

  SuccessIconPainter({required this.animationValue});

  Path _getHexagonPath(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(w * 0.5, 0);
    path.lineTo(w, h * 0.25);
    path.lineTo(w, h * 0.75);
    path.lineTo(w * 0.5, h);
    path.lineTo(0, h * 0.75);
    path.lineTo(0, h * 0.25);
    path.close();
    return path;
  }

  Path _getCheckPath(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;
    path.moveTo(w * 0.3, h * 0.5);
    path.lineTo(w * 0.45, h * 0.65);
    path.lineTo(w * 0.7, h * 0.35);
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Phase 1 : 0.0 à 0.5 = Dessin de l'hexagone
    final hexProgress = (animationValue * 2).clamp(0.0, 1.0);
    if (hexProgress > 0) {
      final hexPath = _getHexagonPath(size);
      final hexMetrics = hexPath.computeMetrics().first;
      final extractHex = hexMetrics.extractPath(0, hexMetrics.length * hexProgress);
      canvas.drawPath(extractHex, paint);
    }

    // Phase 2 : 0.5 à 1.0 = Dessin du vu (check)
    if (animationValue > 0.5) {
      final checkProgress = ((animationValue - 0.5) * 2).clamp(0.0, 1.0);
      final checkPath = _getCheckPath(size);
      final checkMetrics = checkPath.computeMetrics().first;
      final extractCheck = checkMetrics.extractPath(0, checkMetrics.length * checkProgress);
      canvas.drawPath(extractCheck, paint);
    }
  }

  @override
  bool shouldRepaint(covariant SuccessIconPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

// 3. La ligne de séparation dans le ticket avec la petite encoche en V
class TicketSeparatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    final w = size.width;
    final h = size.height;
    final midY = h / 2;

    path.moveTo(0, midY);
    // Ligne gauche jusqu'au milieu moins l'encoche
    path.lineTo(w / 2 - 6, midY);
    // Dessin de l'encoche (V)
    path.lineTo(w / 2, midY + 6);
    path.lineTo(w / 2 + 6, midY);
    // Ligne droite jusqu'à la fin
    path.lineTo(w, midY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Formateur inchangé
class FormateurTelephoneSuisse extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    if (text.isEmpty) return newValue;

    String chiffres = text.replaceAll(RegExp(r'\D'), '');
    if (chiffres.startsWith('41')) {
      chiffres = chiffres.substring(2);
    }

    StringBuffer buffer = StringBuffer('+41 ');
    for (int i = 0; i < chiffres.length; i++) {
      if (i == 2 || i == 5 || i == 7) {
        buffer.write(' ');
      }
      buffer.write(chiffres[i]);
    }

    String resultat = buffer.toString().trimRight();

    return TextEditingValue(
      text: resultat,
      selection: TextSelection.collapsed(offset: resultat.length),
    );
  }
}
