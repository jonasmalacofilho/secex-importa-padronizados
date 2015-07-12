import sys.FileSystem;

class Importa
{
  static function main() {
//Aqui pode começar um IF DEBUG...
    trace('Lidos ${Sys.args().length}.Os args são:');
    for (i in 0...Sys.args().length){
        trace ('- ' + Sys.args()[i]);
    }
//aqui pode acabar o if DEBUG

   
    if (Sys.args()[0]!='estadual' && Sys.args()[0]!='municipal') display_usage_and_exit();
    trace ('Testa expressão para ser substituido a chamada ao db');
    for (i in 2...Sys.args().length){
        if (!FileSystem.exists(Sys.args()[i])){
            trace ('file not found:' + Sys.args()[i]);
            display_usage_and_exit();
        }
        if(FileSystem.isDirectory(Sys.args()[i]{ 
            trace ('file is dir:' + Sys.args()[i]);
            display_usage_and_exit();
        }
    }
  }



  static function display_usage_and_exit(){
  trace(' Uso: secex-importa-padronizados <tipo> <destino> <entrada> [...]');
  Sys.exit(0);
  }
}
