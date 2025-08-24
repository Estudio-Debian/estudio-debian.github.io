---
icon: https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps/distributor-logo-ubuntu-studio.svg
---
# ![](https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps/distributor-logo-ubuntu-studio.svg) Ubuntu Studio

Este script instala pacotes do [Ubuntu Studio](https://ubuntustudio.org/), responsáveis por configurações do sistema, além do [PipeWire](https://gitlab.freedesktop.org/pipewire/pipewire) na versão mais atual.

O repositório `noble-updates` do Ubuntu e o repositório PPA `savoury1/multimedia` são adicionados com o [_pinning_](https://wiki.debian.org/AptConfiguration#Using_pinning) baixo, impedindo que se sobreponham aos repositórios do Debian.

Ele também instala o [QjackCtl](https://qjackctl.sourceforge.io/), caso você prefira usar o [JACK](https://jackaudio.org/) diretamente, sem o PipeWire.

![qjackctl](/static/qjackctl.png)

Pra alternar entre o JACK e o PipeWire-JACK, você pode usar o comando `toggle-pipewire-jack`.

Você também pode configurar o _quantum_ e o _samplerate_ do PipeWire de forma persistente através do **PipeWire Quantum** disponível no menu de aplicativos.

![pipewire-quantum](/static/pipewire-quantum.png)

Além disso este script também instala o [Helvum](https://github.com/relulz/helvum), que é um patchbay com suporte a conexões de áudio e vídeo e também o [`nohang`](https://github.com/hakavlad/nohang), que é um utilitário que impede o sistema de travar quando a memória está cheia, encerrando processos pra garantir que o sistema continue operando.

![helvum](/static/helvum.png)

:::code source="ubuntustudio.sh" :::
[!button icon="terminal" iconAlign="right" corners="round" text="Executar script"](br:ubuntustudio)