---
icon: https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps/system-software-update.svg
---
# ![](https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps/system-software-update.svg) Ganchos do APT

Ao instalar alguns programas, pode acontecer do lançador estar com a classe de janela errada ou precisar de algum ajuste na linha de execução, como por exemplo forçar o backend X11 no Wayland ou trocar o nome do ícone pra ficar compatível com o tema em uso, entre outras coisas.

Pra que essas correções sejam feitas automaticamente e de forma permantente, é possível usar _ganchos_ no `apt`, que são scripts lançados após cada execução do `apt`, garantindo que essas correções não serão sobrescritas pelas atualizações do sistema.

Cada programa instalado pelos scripts deste repositório tem as devidas correções quando necessário e todos os scripts ficam na pasta `/usr/local/share/custom-launchers`, caso você queria conferir o que cada script faz.

:::code source="apt-hooks.sh" :::
[!button icon="terminal" iconAlign="right" corners="round" text="Executar script"](br:apt-hooks)