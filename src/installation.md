---
icon: https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/64x64/apps/mx-packageinstaller.svg
layout: page
order: 100
---
# Instalação

Pra executar os scripts deste repositório de forma facilitada, você pode instalar o `bashrun`, um utilitário que permite executar os scripts clicando num botão presente em todas as páginas.

[!button icon="terminal" iconAlign="right" corners="round" text="Executar script"]()

Você pode baixar o `bashrun` aqui:
[!file](/static/bashrun.deb)

Ou, se preferir pode instalar pelo terminal:

```sh
rm -f bashrun.deb # caso já tenha baixado uma versão anterior do pacote
wget -q --show-progress https://estudio-debian.github.io/static/bashrun.deb
sudo apt install --reinstall ./bashrun.deb
```
> [!WARNING] :zap: :exclamation: Aviso importante :exclamation: :zap:
> Pra que tudo funcione como esperado, é necessário executar todos os scripts nas categorias _**Dependências**_, _**Fontes**_ e _**Núcleo**_.