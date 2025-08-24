---
icon: https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps/utilities-log-viewer.svg
---
# ![](https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/48x48/apps/utilities-log-viewer.svg) rtcqs

O [rtcqs](https://codeberg.org/rtcqs/rtcqs) é um _checador_ de configurações.

Com ele é possível saber se o seu sistema está apto pra trabalhar com áudio em baixa latência, por exemplo, ele exibe uma série de checagens que garantem isso.

O único ítem dele que este script não _sana_ são as mitigações de segurança do _spectre e meltdown_.

Por ser um ítem de segurança, é preferível deixar a cargo de casa usuário.

![rtcqs](/static/rtcqs.png)

:::code source="rtcqs.sh" :::
[!button icon="terminal" iconAlign="right" corners="round" text="Executar script"](br:rtcqs)