import 'package:flutter/material.dart';

const kPrimeryColor = Color(0xFF000000);
const kPrimaryLightColor = Color(0xFF999999);
const kColorFontFlatButton = Color(0XFFFFFFFF);
const KPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xFFFFA53E),
      const Color(0xFFFF7643)
    ]
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kGray = Color(0xFFD3D3D3);

const kAnimationDuration = Duration(milliseconds: 200);

//constantes de texto

const kTitle = "Doceria São José";
const kWelcomeTitle = "Bem vindo à Doceria São José";
const textFlatSplashButton = "Continuar";
const textFlatSplashButtonFinish = "Finalizar Cadastro";
const textSignInScreen = "Entrar";
const textSignUpScreen = "Cadastrar";
const textSignInBody = "Bem vindo";
const textSignUpBody = "Cadastrar-se";
const textSignUpComplete = "Completar cadastro";
const textSignUpAddress = "Inserir endereço";
const textSignInAdvise = "Entre com o seu e-mail e senha";
const textSignInAdviseComplete = "Entre com seus dados pessoais";
const textSignInAdviseAddress = "Entre com seu endereço";
const textEmail = "E-mail";
const textHintEmail = "Entre com seu e-mail";
const textPassword = "Senha";
const textHintPassword = "Digite sua senha";
const textRetypePassword = "Confirme a senha";
const textHintRetypePassword = "Repita sua senha";
const textButtonSignin = "Entrar";
const textRememberMe = "Lembrar de mim";
const textForgotPassword = "Esqueceu a senha";
const textDontHaveAccount = "Não tem uma conta? ";
const textSignUp = "Criar uma.";
const textTitleForgotPassword = "Esqueceu a senha";
const textInfoForgotPassword = "Por favor entre com o seu e-mail e nós enviaremos a você um link para recuperação da senha";
const textClientNameF = "Insira seu nome";
const textClientHintNameF = "Entre com seu nome";
const textClientNameJ = "Insira sua Razão Social";
const textClientHintNameJ = "Entre com sua Razão Social";
const textClientCpf = "CPF";
const textClientHintCpf = "Entre com seu CPF";
const textClientCnpj = "CNPJ";
const textClientHintCnpj = "Entre com seu CNPJ";
const textClientBirthDate = "Data de nascimento";
const textClientCDate = "Data de criação";
const textClientHintBirthDate = "Entre com sua data de nascimento";
const textClientHintCDate = "Entre com sua data de criação";
const textClientGenero = "Gênero";
const textClientHintGenero = "Selecione o Gênero";
const textClientPhone = "Fone";
const textClientHintPhone = "Entre com seu fone/celular";
const textClientCep = "CEP";
const textClientHintCep = "Entre com seu CEP";
const textClientState = "Estado";
const textClientHintState = "Selecione o Estado";
const textClientCity = "Cidade";
const textClientHintCity = "Entre com sua cidade";
const textClientAddres = "Logradouro";
const textClientHintAddres = "Entre com seu endereço";
const textClientNumber = "Número";
const textClientHintNumber = "Entre com seu número";
const textClientComplement = "Complemento";
const textClientHintComplement = "Entre com seu complemento";
const textClientDistrict = "Bairro";
const textClientHintDistrict = "Entre com seu bairro";
const textClientRef = "Referência";
const textClientHintRef = "Entre com sua referência";
const textSearchInput = "Procure produtos";
const textHomeSpecial = "Especial para você";
const textSeeMore = "Veja mais";
const textFeature = "Destaques";
const textDe = "De: ";
const textPor = "A partir de: ";
const textCurrency = "R\$ ";
const textHome = "Home";
const textProducts = "Produtos";
const textCart = "Carrinho";
const textAddCart = "Adicionar ao carrinho";
const textAccount = "Conta";
//errors constantes
const textErrorEmptyEmail = "Por favor entre com seu e-mail";
const textErrorValidEmail = "Por favor entre com um e-mail válido";
const textErrorPassword = "Entre com a sua senha";
const textErrorRenterPassword = "Reptita a sua senha";
const textErrorNoMatchPassword = "A senhas não conferem \ntente novamente";
const sizePasswordShortError = "Senha muito curta";
const matchPassworError = "Senhas não são iguais";
const textErrorEmptyNomeF = "Por favor insira seu nome";
const textErrorEmptyNomeJ = "Por favor insira sua Razão Social";
const textErrorValidNome = "Por favor insira nome e sobrenome";
const textErrorEmptyCpf = "Por favor insira seu CPF";
const textErrorEmptyCnpj = "Por favor insira seu CNPJ";
const textErrorEmptyBirthDate = "Por favor insira sua data de nascimento";
const textErrorEmptyCDate = "Por favor insira a data de criação";
const textErrorEmptyGender = "Por favor escolha um gênero";
const textErrorEmptyFone = "Por favor entre com seu fone/celular";
final  RegExp emailValidator = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
final  RegExp nomeValidator = RegExp(r"^(.+)([\s]{1})(.+)$");

const defaultDuration = Duration(milliseconds: 250);