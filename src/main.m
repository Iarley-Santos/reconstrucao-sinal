%% Reconstrução de um sinal utilizando o critério de Nyquist e a função sinc(x)
clear; clc;

fn = 3.3;    % Fator de Nyquist: usado para calcular a frequência de amostragem
Wo = 35;     % Frequência angular fundamental do sinal (rad/s)
Fs = Wo * fn;    % Frequência de amostragem de acordo com o critério de Nyquist
Ts = 1/Fs;    % Período de amostragem: inverso da frequência de amostragem
t = 0: 1e-4 :1/Wo;    % Vetor de tempo do sinal original, amostrado em intervalos finos

% Definição do sinal original
y = 4 * cos(70 * pi * t + pi/6);  % Sinal original (uma onda cossenoidal com frequência 70pi rad/s)

% Definição do vetor de tempo discreto (com a frequência de amostragem calculada)
td = 0: 1/Fs :1/Wo;    % Vetor de tempo discreto para o sinal amostrado
yd = 4 * cos(70 * pi * td + pi/6);  % Sinal discretizado, correspondente às amostras do sinal original

% Definição da faixa de tempo para a reconstrução do sinal utilizando sinc
range = 5;
tsinc = -range * t(end) : t(2) : range * t(end);  % Vetor de tempo para a função sinc, centralizado no tempo de amostra

% Inicialização do sinal reconstruído
y_rec = 0;

% Figura 1: Plota a função sinc para cada amostra do sinal discretizado
figure(1)
for n = 1:length(yd)
    % Soma as contribuições de cada amostra (yd(n)) multiplicada pela
    % função sinc, que realiza a interpolação entre os pontos
    y_rec = y_rec + yd(n) * my_sinc((pi / Ts) * (t - td(n))); 
    % Plota a função sinc correspondente a cada amostra yd(n) em relação ao tempo tsinc
    plot(tsinc, yd(n) * my_sinc((pi / Ts) * (tsinc - td(n))), 'LineWidth', 1.5) 
    hold on
end
grid on
% Título e rótulos dos eixos
title('Contribuições das Funções Sinc para a Reconstrução do Sinal')
xlabel('Tempo (s)')  
ylabel('Amplitude')
xlim([tsinc(1), tsinc(end)])
ylim([-5 5])

% Figura 2: Comparação do sinal original, discretizado e reconstruído
figure(2)
plot(t, y, 'b', 'LineWidth', 1.5)   % Plota o sinal original com uma linha azul
hold on
plot(t, y_rec, 'g--', 'LineWidth', 1.5)   % Plota o sinal reconstruído com uma linha tracejada verde
hold on
stem(td, yd, 'r', 'LineWidth', 1.5)   % Plota as amostras discretas com marcadores verticais vermelhos
grid on
legend('Sinal Original', 'Sinal Reconstruído', 'Amostras Discretas')
title('Reconstrução do Sinal')
xlabel('Tempo (s)')
ylabel('Amplitude')