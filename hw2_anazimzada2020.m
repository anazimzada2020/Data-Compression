% TASK 1

x1 = ["ababcbacb"];
A1 = bwt1(x1);
B1 = bwt2(A1);
[y1, L1] = bwt3(B1, x1);

x2 = ["The cat with that hat"];
A2 = bwt1(x2);
B2 = bwt2(A2);
[y2, L2] = bwt3(B2, x2);

B1_rec = bwt4(y1, L1);
x1_rec = bwt5(y1, L1);



% TASK 2

for i = 0:15
    x(i+1) = ((i-8)^(3)) / 8;
    y(i+1) = cos((3 * i + 1) * pi/16 + 1) + sin((5 * i + 1) * pi/16);
end

X_fft = fft(x);
Y_fft = fft(y);

X_fft_mag = abs(X_fft);
Y_fft_mag = abs(Y_fft);

[X_fft_10smallest, X_fft_indices] = mink(X_fft_mag, 10, 'ComparisonMethod', 'abs');
[Y_fft_10smallest, Y_fft_indices] = mink(Y_fft_mag, 10, 'ComparisonMethod', 'abs');
X_fft_hat = X_fft;
X_fft_hat(X_fft_indices) = 0;
Y_fft_hat = Y_fft;
Y_fft_hat(Y_fft_indices) = 0;

x_fft_hat = ifft(X_fft_hat);
y_fft_hat = ifft(Y_fft_hat);

table1_fft = [X_fft; X_fft_mag; X_fft_hat].';
table2_fft = [Y_fft; Y_fft_mag; Y_fft_hat].';
table3_fft = [x; x_fft_hat].';
table4_fft = [y; y_fft_hat].';

plot(x);
hold on;
plot(x_fft_hat);
xlabel("'n'");
ylabel("Values");
title("Fourier transform");
legend("x", "x̂");
hold off;

plot(y);
hold on;
plot(y_fft_hat);
xlabel("'n'");
ylabel("Values");
title("Fourier transform");
legend("y", "ŷ");
hold off;

x_fft_mse = immse(x, x_fft_hat);
y_fft_mse = immse(y, y_fft_hat);

x_fft_snr = snr(x, x - x_fft_hat);
y_fft_snr = snr(y, y - y_fft_hat);



% TASK 3

X_dct = dct(x);
Y_dct = dct(y);

X_dct_hat = X_dct;
X_dct_hat(end-9:end) = 0;
Y_dct_hat = Y_dct;
Y_dct_hat(end-9:end) = 0;

x_dct_hat = idct(X_dct_hat);
y_dct_hat = idct(Y_dct_hat);

table1_dct = [X_dct; X_dct_hat].';
table2_dct = [Y_dct; Y_dct_hat].';
table3_dct = [x; x_dct_hat].';
table4_dct = [y; y_dct_hat].';

plot(x);
hold on;
plot(x_dct_hat);
xlabel("'n'");
ylabel("Values");
title("Discrete Cosine transform");
legend("x", "x̂");
hold off;

plot(y);
hold on;
plot(y_dct_hat);
xlabel("'n'");
ylabel("Values");
title("Discrete Cosine transform");
legend("y", "ŷ");
hold off;

x_dct_mse = immse(x, x_dct_hat);
y_dct_mse = immse(y, y_dct_hat);

x_dct_snr = snr(x, x - x_dct_hat);
y_dct_snr = snr(y, y - y_dct_hat);



% TASK 4

H16 = sqrt(1/16) * hadamard(16);
X_hadamard = x * H16;
Y_hadamard = y * H16;

X_hadamard_mag = abs(X_hadamard);
Y_hadamard_mag = abs(Y_hadamard);

[X_hadamard_10smallest, X_hadamard_indices] = mink(X_hadamard_mag, 10, 'ComparisonMethod', 'abs');
[Y_hadamard_10smallest, Y_hadamard_indices] = mink(Y_hadamard_mag, 10, 'ComparisonMethod', 'abs');
X_hadamard_hat = X_hadamard;
X_hadamard_hat(X_hadamard_indices) = 0;
Y_hadamard_hat = Y_hadamard;
Y_hadamard_hat(Y_hadamard_indices) = 0;

x_hadamard_hat = X_hadamard_hat * H16.';
y_hadamard_hat = Y_hadamard_hat * H16.';

table1_hadamard = [X_hadamard; X_hadamard_mag; X_hadamard_hat].';
table2_hadamard = [Y_hadamard; Y_hadamard_mag; Y_hadamard_hat].';
table3_hadamard = [x; x_hadamard_hat].';
table4_hadamard = [y; y_hadamard_hat].';

x_hadamard_mse = immse(x, x_hadamard_hat);
y_hadamard_mse = immse(y, y_hadamard_hat);

plot(x);
hold on;
plot(x_fft_hat);
plot(x_dct_hat);
plot(x_hadamard_hat);
xlabel("'n'");
ylabel("Values");
title("Comparison");
legend("x", "x̂ (FFT)", "x̂ (DCT)", "x̂ (Hadamard)");
hold off;

plot(y);
hold on;
plot(y_fft_hat);
plot(y_dct_hat);
plot(y_hadamard_hat);
xlabel("'n'");
ylabel("Values");
title("Comparison");
legend("y", "ŷ (FFT)", "ŷ (DCT)", "ŷ (Hadamard)");
hold off;

disp("x VS x̂");
disp("------");
disp("MSE of Fourier transform");
disp(x_fft_mse);
disp("MSE of Discrete Cosine transform");
disp(x_dct_mse);
disp("MSE of Hadamard transform");
disp(x_hadamard_mse);

disp("y VS ŷ");
disp("------");
disp("MSE of Fourier transform");
disp(y_fft_mse);
disp("MSE of Discrete Cosine transform");
disp(y_dct_mse);
disp("MSE of Hadamard transform");
disp(y_hadamard_mse);
disp("Best transform for (x, x̂) is Discrete Cosine transform");
disp("Best transform for (y, ŷ) is Fourier transform");



% TASK 5

X_dct_hat_list = [];

for i = 1:15
    temp = X_dct;
    temp(end-i+1:end) = 0;
    X_dct_hat_list = [X_dct_hat_list; temp];
end

x_dct_hat_list = [];

for i = 1:15
    x_dct_hat_list = [x_dct_hat_list; idct(X_dct_hat_list(i, :))];
end

x_dct_snr_list = [];

for i = 1:15
    x_dct_snr_list = [x_dct_snr_list; snr(x, x - x_dct_hat_list(i, :))];
end

plot(x_dct_snr_list);
xlabel("'n'");
ylabel("Signal-to-noise ratio");
title("'n' VS SNR");

disp("It is not surprise that as ‘n’ is increasing Signal-to-Noise Ratio is decreasing.");
disp("For higher ‘n’, we have less original value and more ‘0’s which leads to inverse transformation (x̂) to be less accurate, noise to be large, hence SNR to be smaller.");



% Functions used in TASK 1

function A = bwt1(x)
    input = convertStringsToChars(x);
    A = input;
    step = -1;
    for i = 1:length(input)-1
        temp = circshift(input, step);
        step = step - 1;
        A = [A; temp];
    end
end

function B = bwt2(A)
    B = sortrows(A);
end

function [y, L] = bwt3(B, x)
    y = B(:, end);
    L = find(ismember(B, x));
end

function B = bwt4(y, L)
    B = [];
    for i = 1:length(y)
        B = [y B];
        B = sortrows(B);
    end
end

function x = bwt5(y, L)
    B = bwt4(y, L);
    x = B(L, :);
end