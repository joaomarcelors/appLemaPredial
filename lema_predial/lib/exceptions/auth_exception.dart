class AuthException implements Exception {

  final String key;
  const AuthException(this.key);

  @override
  String toString(){
    if(key.contains('INCORRECT')){
      return 'Usuário e/ou Senha inválido.';
    }else{
      return 'Ocorreu um erro na autentificação!';
    }
  }
} 