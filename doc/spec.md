Especificação da implementação
==============================

O software deve importar em um banco de dados as informações da balança
comercial brasileira por estado e município, disponíveis como
arquivos padronizados em [site][arquivos] do Ministério do Desenvolvimento, Indústria e
Comércio Exterior.

Mais detalhes seguem...

## Executável e uso

Executável: `secex-importa-padronizados` (além do sufixo padrão de executáveis da plataforma)

Uso: `secex-importa-padronizados <tipo> <destino> <entrada> [...]`

Onde:
 - `tipo`: pode ser `estadual` ou `municipal` (obrigatório)
 - `destino`: caminho para a tabela de destino no banco de dados (obrigatório)
    - suporte somente a Sqlite
    - a sintaxe para a especificação do destino é dada por `<arquivo> # [<database> .] <tabela>`
    - exemplos: `padronizados.db#main.estadual`, `padronizados.db#estadual`
    - esta especificação é compatível, futuramente, com [Database
      URIs][uri-db], assumindo `db:sqlite:/`
 - `entrada`: caminho para um ou mais arquivos padronizados
    - os arquivos devem ser (ou seguir o formato dos) obtidos no [site][arquivos] oficial
    - suporte a `*.zip`, `*.txt` (fixed) e `*.csv`
    - as árvores comprimidas (`*.zip`) poderão ser recursivas, isto é, poderão ter internamente
      pastas e até outras árvores comprimidas
    - o reconhecimento do formato do arquivo deve ser feito pelo nome do arquivo

Exemplos:

```sh
# arquivos txt/csv
./secex-importa-padronizados estadual padronizados.db#estadual EXP_MPP201112_v201201_VIA_TRANSP.txt
./secex-importa-padronizados estadual padronizados.db#estadual *.txt

# zips internos
./secex-importa-padronizados estadual padronizados.db#estadual EXP_MPP201112_v201201_VIA_TRANSP.zip
./secex-importa-padronizados estadual padronizados.db#estadual *.zip

# zips externos
./secex-importa-padronizados estadual padronizados.db#estadual dwnl_1433875461.zip

# magia de busca recursiva de txts/csvs disponível em alguns shells (como o zsh)
./secex-importa-padronizados estadual padronizados.db#estadual **/*.txt **/*.csv
```

## Banco de dados

Quando necessário, o software é responsável por criar as tabelas e restrições
no banco de dados de destino.

Ele também precisa evitar a duplicação de dados, se isso for possível; é necessário primeiro
verificar se os arquivos disponibilizados foram ou não agregados.  Caso seja possível e necessário
deduplicá-los, o software poderá abortar a operação, adaptá-la (por exemplo, ignorando os
novos dados) ou emtir um alerta de potencial problema, além de qualquer combinação das ações anteriores.

## Outras restrições

O tempo necessário para a importação de todos os dados disponíveis deve ser razoável,
em comparação com a importação de CSVs pela CLI oficial de testes do Sqlite.

[arquivos]: http://www.mdic.gov.br/sitio/interna/interna.php?area=5&menu=606
[uri-db]: https://github.com/theory/uri-db/
