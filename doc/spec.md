Especificação da implementação
==============================

 - Suporte as bases de dados da balança comercial brasileira por estado e
   município disponíveis como arquivos padradonizados no [site
   oficial](http://www.mdic.gov.br/sitio/interna/interna.php?area=5&menu=606)
 - Executável: `secex-importa-padronizados`
 - Uso: `secex-importa-padronizados <db> <arquivo> ...`
 - `db`: [URI para um db](https://github.com/theory/uri-db/)
    - engine: somente `sqlite`
    - authority: somente 'local/file'
    - query: ``
    - fragment: nome da tabela no formato `table` ou `db.table`
    - exemplo: `db:sqlite:secex.db3#main.estadual`
 - `arquivo`: dados
    - Suporte a `*.zip`, `*.txt` (fixed) e `*.csv`
    - Suporte a `*.zip` de `*.txt`/`*.csv` ou de outros `*.zip`
    - Reconhecimento do tipo de arquivo e do formato é feito pelo nome do
      arquivo
       - (detalhar...)
 - Deve ser capaz de importar todos os dados disponíveis no site oficial em
   **tempo razoável**

