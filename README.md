## 🔄Reconstrução de um sinal utilizando o critério de Nyquist
Este projeto implementa a reconstrução de um sinal contínuo a partir de suas amostras discretas, utilizando o critério de Nyquist e a função sinc para interpolação. O código é escrito em MATLAB e demonstra o processo de amostragem, discretização e reconstrução de sinais, como parte do estudo de Teoria de Comunicação e Processamento de Sinais.📡

## 🎯 Objetivo

Este projeto tem como objetivo ilustrar:

- 📏 Como realizar a **amostragem de um sinal** de acordo com o critério de Nyquist.
- 🧩 Como utilizar a **função sinc** para interpolar amostras e recriar o sinal original contínuo.

## 🗂 Estrutura do Código

- **`my_sinc.m`**: Função customizada para calcular a função sinc, usada para interpolação.
- **`main.m`**: Script principal que executa o processo de amostragem e reconstrução do sinal, gerando gráficos para análise.

## 📌 Por que criar uma `sinc` customizada?

A função `my_sinc` foi criada para demonstrar explicitamente o cálculo `sin(x)/x`, em vez de usar a `sinc` embutida do MATLAB. Isso permite controlar diretamente a definição da função, ajudando na compreensão do processo de reconstrução do sinal.

Essa abordagem ajuda a:

- **Visualizar o processo:** Implementar a `sinc` do zero oferece uma visão mais profunda do comportamento da função para os valores desejados, reforçando o entendimento teórico sobre a reconstrução.
- **Evitar diferenças na definição:** A função `sinc` no MATLAB usa uma definição específica, enquanto a função `my_sinc` aqui segue a definição sinc comum em processamento de sinais, onde `sinc(x) = sin(x) / x`.
- **Simplificar para aprendizagem:** Focar na criação de uma `sinc` manualmente permite que o código seja independente de configurações ou versões específicas do MATLAB, tornando-o mais acessível para quem estuda a teoria por trás de sinais e sistemas.

## 🔍 Detalhes da Implementação

1. **Parâmetros Principais**:
   - **Fator de Nyquist** (`fn`) e **frequência angular** (`Wo`) usados para calcular a frequência de amostragem.
   - **Frequência de amostragem** (`Fs`) e **período de amostragem** (`Ts`), essenciais para capturar o sinal sem perda de informação.

2. **Amostragem**:
   - O sinal original é uma onda cossenoidal com frequência angular de 70π rad/s.
   - O sinal é amostrado em intervalos discretos com uma frequência que satisfaz o critério de Nyquist.

3. **Reconstrução do Sinal**:
   - O sinal é reconstruído a partir das amostras usando uma série de funções sinc centradas nas amostras, permitindo a recomposição do sinal contínuo.

## 📊 Visualização

O script gera duas figuras principais:

1. **Contribuições das Funções Sinc**: Mostra a contribuição de cada função sinc centrada em uma amostra, formando o sinal reconstruído.
2. **Comparação Visual**: Apresenta o sinal original, o sinal amostrado e o sinal reconstruído, destacando a precisão da reconstrução.
