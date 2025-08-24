---
icon: https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps/software-properties.svg
---
# ![](https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps/software-properties.svg) Fontes de programas

Este script é o que faz _grande mágica_ acontecer!

Ele adiciona ao sistema outras fontes de instalação de programas, que são:

[`am`](https://github.com/ivan-hc/AM) - _instalador de programas **AppImage** e binários diretos do GitHub_


[`pacstall`](https://pacstall.dev) - _instalador de pacotes `deb` de terceiros além de programas compilados direto do código fonte_


Outro complemento muito importante instalado através deste script é o [`topgrade`](https://github.com/topgrade-rs/topgrade), um atualizador do sistema que checa tudo que é possível no sistema e atualiza de uma vez só, como por exemplo `apt`, `am`, `pacstall`, _Flatpak_, _Python_, `npm`, _Ruby_, etc...

A lista de atualizações suportadas pelo `togprade` é realmente bem extensa.

Além de tudo isso, ainda é disponibilizado um script `search-app` que você pode usar pra pesquisar programas no `apt`, `am` e `pacstall` de uma só vez.

Basta digitar `search-app NOME_DO_APP` que ele exibe os resultados após a pesquisa nas 3 fontes.

![search-app](/static/search-app.png)

:::code source="software-sources.sh" :::
[!button icon="terminal" iconAlign="right" corners="round" text="Executar script"](br:software-sources)