[I, map] = imread('image.gif');
G = ind2gray(I, map);
imagesc(I);
colormap(map);
imagesc(G);
colormap(gray);
G = double(G);


% TASK 1, 2, 3, 4

% 2

[dG2, dG2_row, dG2_col, C2] = dct2onBlocks(G, 2);
[C2_row, C2_col, DC2, DC2_size, DC2_min, DC2_max, DC2_range, DC2_interval, DC2_d0, DC2_d1, DC2_d2, DC2_d3, DC2_d4, DC2_d5, DC2_d6, DC2_d7, DC2_d8, DC2_quant_uniform] = quantizeDC(C2, 2);
[AC2] = zigzagAC(C2_row, C2_col, C2, 2);
[AC2_row, AC2_col, AC2_min, AC2_max, L2, H2] = LandH(AC2, 2);
[AC2_num, AC2_quant_uniform, AC2_range, AC2_1_interval, AC2_1_d0, AC2_1_d1, AC2_1_d2, AC2_1_d3, AC2_1_d4, AC2_2_interval, AC2_2_d0, AC2_2_d1, AC2_2_d2] = quantizeAC(2, AC2, AC2_row, AC2_col, H2, L2);
[DC2_r0, DC2_r1, DC2_r2, DC2_r3, DC2_r4, DC2_r5, DC2_r6, DC2_r7, DC2_dequant_uniform, AC2_1_r0, AC2_1_r1, AC2_1_r2, AC2_1_r3, AC2_dequant_uniform, AC2_2_r0, AC2_2_r1, C2_dequant_uniform, dG_C2_dequantized, G2_dequantized] = reconstruction(2, DC2_d0, DC2_d1, DC2_d2, DC2_d3, DC2_d4, DC2_d5, DC2_d6, DC2_d7, DC2_d8, DC2_quant_uniform, DC2_size, AC2_1_d0, AC2_1_d1, AC2_1_d2, AC2_1_d3, AC2_1_d4, AC2_quant_uniform, AC2_row, AC2_col, AC2_num, AC2_2_d0, AC2_2_d1, AC2_2_d2);
[Compression_ratio_2, SNR_G2] = CRandSNR(G, G2_dequantized, 2, DC2_size, C2_row, C2_col);

%4

[dG4, dG4_row, dG4_col, C4] = dct2onBlocks(G, 4);
[C4_row, C4_col, DC4, DC4_size, DC4_min, DC4_max, DC4_range, DC4_interval, DC4_d0, DC4_d1, DC4_d2, DC4_d3, DC4_d4, DC4_d5, DC4_d6, DC4_d7, DC4_d8, DC4_quant_uniform] = quantizeDC(C4, 4);
[AC4] = zigzagAC(C4_row, C4_col, C4, 4);
[AC4_row, AC4_col, AC4_min, AC4_max, L4, H4] = LandH(AC4, 4);
[AC4_num, AC4_quant_uniform, AC4_range, AC4_1_interval, AC4_1_d0, AC4_1_d1, AC4_1_d2, AC4_1_d3, AC4_1_d4, AC4_2_interval, AC4_2_d0, AC4_2_d1, AC4_2_d2] = quantizeAC(4, AC4, AC4_row, AC4_col, H4, L4);
[DC4_r0, DC4_r1, DC4_r2, DC4_r3, DC4_r4, DC4_r5, DC4_r6, DC4_r7, DC4_dequant_uniform, AC4_1_r0, AC4_1_r1, AC4_1_r2, AC4_1_r3, AC4_dequant_uniform, AC4_2_r0, AC4_2_r1, C4_dequant_uniform, dG_C4_dequantized, G4_dequantized] = reconstruction(4, DC4_d0, DC4_d1, DC4_d2, DC4_d3, DC4_d4, DC4_d5, DC4_d6, DC4_d7, DC4_d8, DC4_quant_uniform, DC4_size, AC4_1_d0, AC4_1_d1, AC4_1_d2, AC4_1_d3, AC4_1_d4, AC4_quant_uniform, AC4_row, AC4_col, AC4_num, AC4_2_d0, AC4_2_d1, AC4_2_d2);
[Compression_ratio_4, SNR_G4] = CRandSNR(G, G4_dequantized, 4, DC4_size, C4_row, C4_col);

% 8

[dG8, dG8_row, dG8_col, C8] = dct2onBlocks(G, 8);
[C8_row, C8_col, DC8, DC8_size, DC8_min, DC8_max, DC8_range, DC8_interval, DC8_d0, DC8_d1, DC8_d2, DC8_d3, DC8_d4, DC8_d5, DC8_d6, DC8_d7, DC8_d8, DC8_quant_uniform] = quantizeDC(C8, 8);
[AC8] = zigzagAC(C8_row, C8_col, C8, 8);
[AC8_row, AC8_col, AC8_min, AC8_max, L8, H8] = LandH(AC8, 8);
[AC8_num, AC8_quant_uniform, AC8_range, AC8_1_interval, AC8_1_d0, AC8_1_d1, AC8_1_d2, AC8_1_d3, AC8_1_d4, AC8_2_interval, AC8_2_d0, AC8_2_d1, AC8_2_d2] = quantizeAC(8, AC8, AC8_row, AC8_col, H8, L8);
[DC8_r0, DC8_r1, DC8_r2, DC8_r3, DC8_r4, DC8_r5, DC8_r6, DC8_r7, DC8_dequant_uniform, AC8_1_r0, AC8_1_r1, AC8_1_r2, AC8_1_r3, AC8_dequant_uniform, AC8_2_r0, AC8_2_r1, C8_dequant_uniform, dG_C8_dequantized, G8_dequantized] = reconstruction(8, DC8_d0, DC8_d1, DC8_d2, DC8_d3, DC8_d4, DC8_d5, DC8_d6, DC8_d7, DC8_d8, DC8_quant_uniform, DC8_size, AC8_1_d0, AC8_1_d1, AC8_1_d2, AC8_1_d3, AC8_1_d4, AC8_quant_uniform, AC8_row, AC8_col, AC8_num, AC8_2_d0, AC8_2_d1, AC8_2_d2);
[Compression_ratio_8, SNR_G8] = CRandSNR(G, G8_dequantized, 8, DC8_size, C8_row, C8_col);

% 16

[dG16, dG16_row, dG16_col, C16] = dct2onBlocks(G, 16);
[C16_row, C16_col, DC16, DC16_size, DC16_min, DC16_max, DC16_range, DC16_interval, DC16_d0, DC16_d1, DC16_d2, DC16_d3, DC16_d4, DC16_d5, DC16_d6, DC16_d7, DC16_d8, DC16_quant_uniform] = quantizeDC(C16, 16);
[AC16] = zigzagAC(C16_row, C16_col, C16, 16);
[AC16_row, AC16_col, AC16_min, AC16_max, L16, H16] = LandH(AC16, 16);
[AC16_num, AC16_quant_uniform, AC16_range, AC16_1_interval, AC16_1_d0, AC16_1_d1, AC16_1_d2, AC16_1_d3, AC16_1_d4, AC16_2_interval, AC16_2_d0, AC16_2_d1, AC16_2_d2] = quantizeAC(16, AC16, AC16_row, AC16_col, H16, L16);
[DC16_r0, DC16_r1, DC16_r2, DC16_r3, DC16_r4, DC16_r5, DC16_r6, DC16_r7, DC16_dequant_uniform, AC16_1_r0, AC16_1_r1, AC16_1_r2, AC16_1_r3, AC16_dequant_uniform, AC16_2_r0, AC16_2_r1, C16_dequant_uniform, dG_C16_dequantized, G16_dequantized] = reconstruction(16, DC16_d0, DC16_d1, DC16_d2, DC16_d3, DC16_d4, DC16_d5, DC16_d6, DC16_d7, DC16_d8, DC16_quant_uniform, DC16_size, AC16_1_d0, AC16_1_d1, AC16_1_d2, AC16_1_d3, AC16_1_d4, AC16_quant_uniform, AC16_row, AC16_col, AC16_num, AC16_2_d0, AC16_2_d1, AC16_2_d2);
[Compression_ratio_16, SNR_G16] = CRandSNR(G, G16_dequantized, 16, DC16_size, C16_row, C16_col);

% 32

[dG32, dG32_row, dG32_col, C32] = dct2onBlocks(G, 32);
[C32_row, C32_col, DC32, DC32_size, DC32_min, DC32_max, DC32_range, DC32_interval, DC32_d0, DC32_d1, DC32_d2, DC32_d3, DC32_d4, DC32_d5, DC32_d6, DC32_d7, DC32_d8, DC32_quant_uniform] = quantizeDC(C32, 32);
[AC32] = zigzagAC(C32_row, C32_col, C32, 32);
[AC32_row, AC32_col, AC32_min, AC32_max, L32, H32] = LandH(AC32, 32);
[AC32_num, AC32_quant_uniform, AC32_range, AC32_1_interval, AC32_1_d0, AC32_1_d1, AC32_1_d2, AC32_1_d3, AC32_1_d4, AC32_2_interval, AC32_2_d0, AC32_2_d1, AC32_2_d2] = quantizeAC(32, AC32, AC32_row, AC32_col, H32, L32);
[DC32_r0, DC32_r1, DC32_r2, DC32_r3, DC32_r4, DC32_r5, DC32_r6, DC32_r7, DC32_dequant_uniform, AC32_1_r0, AC32_1_r1, AC32_1_r2, AC32_1_r3, AC32_dequant_uniform, AC32_2_r0, AC32_2_r1, C32_dequant_uniform, dG_C32_dequantized, G32_dequantized] = reconstruction(32, DC32_d0, DC32_d1, DC32_d2, DC32_d3, DC32_d4, DC32_d5, DC32_d6, DC32_d7, DC32_d8, DC32_quant_uniform, DC32_size, AC32_1_d0, AC32_1_d1, AC32_1_d2, AC32_1_d3, AC32_1_d4, AC32_quant_uniform, AC32_row, AC32_col, AC32_num, AC32_2_d0, AC32_2_d1, AC32_2_d2);
[Compression_ratio_32, SNR_G32] = CRandSNR(G, G32_dequantized, 32, DC32_size, C32_row, C32_col);

% 64

[dG64, dG64_row, dG64_col, C64] = dct2onBlocks(G, 64);
[C64_row, C64_col, DC64, DC64_size, DC64_min, DC64_max, DC64_range, DC64_interval, DC64_d0, DC64_d1, DC64_d2, DC64_d3, DC64_d4, DC64_d5, DC64_d6, DC64_d7, DC64_d8, DC64_quant_uniform] = quantizeDC(C64, 64);
[AC64] = zigzagAC(C64_row, C64_col, C64, 64);
[AC64_row, AC64_col, AC64_min, AC64_max, L64, H64] = LandH(AC64, 64);
[AC64_num, AC64_quant_uniform, AC64_range, AC64_1_interval, AC64_1_d0, AC64_1_d1, AC64_1_d2, AC64_1_d3, AC64_1_d4, AC64_2_interval, AC64_2_d0, AC64_2_d1, AC64_2_d2] = quantizeAC(64, AC64, AC64_row, AC64_col, H64, L64);
[DC64_r0, DC64_r1, DC64_r2, DC64_r3, DC64_r4, DC64_r5, DC64_r6, DC64_r7, DC64_dequant_uniform, AC64_1_r0, AC64_1_r1, AC64_1_r2, AC64_1_r3, AC64_dequant_uniform, AC64_2_r0, AC64_2_r1, C64_dequant_uniform, dG_C64_dequantized, G64_dequantized] = reconstruction(64, DC64_d0, DC64_d1, DC64_d2, DC64_d3, DC64_d4, DC64_d5, DC64_d6, DC64_d7, DC64_d8, DC64_quant_uniform, DC64_size, AC64_1_d0, AC64_1_d1, AC64_1_d2, AC64_1_d3, AC64_1_d4, AC64_quant_uniform, AC64_row, AC64_col, AC64_num, AC64_2_d0, AC64_2_d1, AC64_2_d2);
[Compression_ratio_64, SNR_G64] = CRandSNR(G, G64_dequantized, 64, DC64_size, C64_row, C64_col);

% Graph
Block_size = [2 4 8 16 32 64];
SNR_list = [SNR_G2 SNR_G4 SNR_G8 SNR_G16 SNR_G32 SNR_G64];
plot(Block_size, SNR_list, '-ro');
axis([0 70 -5 20])
xticks([2 4 8 16 32 64]);
xlabel("Block size");
ylabel("Signal-to-noise ratio");
title("'n' VS SNR");


% TASK 5

% 2

[dG2_DPCM, dG2_row_DPCM, dG2_col_DPCM, C2_DPCM] = dct2onBlocks(G, 2);
[C2_row_DPCM, C2_col_DPCM, DC2_DPCM, DC2_size_DPCM, DC2_min_DPCM, DC2_max_DPCM, DC2_range_DPCM, DC2_interval_DPCM, DC2_d0_DPCM, DC2_d1_DPCM, DC2_d2_DPCM, DC2_d3_DPCM, DC2_d4_DPCM, DC2_d5_DPCM, DC2_d6_DPCM, DC2_d7_DPCM, DC2_d8_DPCM, DC2_quant_uniform_DPCM] = quantizeDC_DPCM(C2_DPCM, 2);
[AC2_DPCM] = zigzagAC(C2_row_DPCM, C2_col_DPCM, C2_DPCM, 2);
[AC2_row_DPCM, AC2_col_DPCM, AC2_min_DPCM, AC2_max_DPCM, L2_DPCM, H2_DPCM] = LandH(AC2_DPCM, 2);
[AC2_num_DPCM, AC2_quant_uniform_DPCM, AC2_range_DPCM, AC2_1_interval_DPCM, AC2_1_d0_DPCM, AC2_1_d1_DPCM, AC2_1_d2_DPCM, AC2_1_d3_DPCM, AC2_1_d4_DPCM, AC2_2_interval_DPCM, AC2_2_d0_DPCM, AC2_2_d1_DPCM, AC2_2_d2_DPCM] = quantizeAC(2, AC2_DPCM, AC2_row_DPCM, AC2_col_DPCM, H2_DPCM, L2_DPCM);
[DC2_r0_DPCM, DC2_r1_DPCM, DC2_r2_DPCM, DC2_r3_DPCM, DC2_r4_DPCM, DC2_r5_DPCM, DC2_r6_DPCM, DC2_r7_DPCM, DC2_dequant_uniform_DPCM, AC2_1_r0_DPCM, AC2_1_r1_DPCM, AC2_1_r2_DPCM, AC2_1_r3_DPCM, AC2_dequant_uniform_DPCM, AC2_2_r0_DPCM, AC2_2_r1_DPCM, C2_dequant_uniform_DPCM, dG_C2_dequantized_DPCM, G2_dequantized_DPCM] = reconstruction_DPCM(2, DC2_d0_DPCM, DC2_d1_DPCM, DC2_d2_DPCM, DC2_d3_DPCM, DC2_d4_DPCM, DC2_d5_DPCM, DC2_d6_DPCM, DC2_d7_DPCM, DC2_d8_DPCM, DC2_quant_uniform_DPCM, DC2_size_DPCM, AC2_1_d0_DPCM, AC2_1_d1_DPCM, AC2_1_d2_DPCM, AC2_1_d3_DPCM, AC2_1_d4_DPCM, AC2_quant_uniform_DPCM, AC2_row_DPCM, AC2_col_DPCM, AC2_num_DPCM, AC2_2_d0_DPCM, AC2_2_d1_DPCM, AC2_2_d2_DPCM, C2_col_DPCM);
[Compression_ratio_2_DPCM, SNR_G2_DPCM] = CRandSNR(G, G2_dequantized_DPCM, 2, DC2_size_DPCM, C2_row_DPCM, C2_col_DPCM);

%4

[dG4_DPCM, dG4_row_DPCM, dG4_col_DPCM, C4_DPCM] = dct2onBlocks(G, 4);
[C4_row_DPCM, C4_col_DPCM, DC4_DPCM, DC4_size_DPCM, DC4_min_DPCM, DC4_max_DPCM, DC4_range_DPCM, DC4_interval_DPCM, DC4_d0_DPCM, DC4_d1_DPCM, DC4_d2_DPCM, DC4_d3_DPCM, DC4_d4_DPCM, DC4_d5_DPCM, DC4_d6_DPCM, DC4_d7_DPCM, DC4_d8_DPCM, DC4_quant_uniform_DPCM] = quantizeDC_DPCM(C4_DPCM, 4);
[AC4_DPCM] = zigzagAC(C4_row_DPCM, C4_col_DPCM, C4_DPCM, 4);
[AC4_row_DPCM, AC4_col_DPCM, AC4_min_DPCM, AC4_max_DPCM, L4_DPCM, H4_DPCM] = LandH(AC4_DPCM, 4);
[AC4_num_DPCM, AC4_quant_uniform_DPCM, AC4_range_DPCM, AC4_1_interval_DPCM, AC4_1_d0_DPCM, AC4_1_d1_DPCM, AC4_1_d2_DPCM, AC4_1_d3_DPCM, AC4_1_d4_DPCM, AC4_2_interval_DPCM, AC4_2_d0_DPCM, AC4_2_d1_DPCM, AC4_2_d2_DPCM] = quantizeAC(4, AC4_DPCM, AC4_row_DPCM, AC4_col_DPCM, H4_DPCM, L4_DPCM);
[DC4_r0_DPCM, DC4_r1_DPCM, DC4_r2_DPCM, DC4_r3_DPCM, DC4_r4_DPCM, DC4_r5_DPCM, DC4_r6_DPCM, DC4_r7_DPCM, DC4_dequant_uniform_DPCM, AC4_1_r0_DPCM, AC4_1_r1_DPCM, AC4_1_r2_DPCM, AC4_1_r3_DPCM, AC4_dequant_uniform_DPCM, AC4_2_r0_DPCM, AC4_2_r1_DPCM, C4_dequant_uniform_DPCM, dG_C4_dequantized_DPCM, G4_dequantized_DPCM] = reconstruction_DPCM(4, DC4_d0_DPCM, DC4_d1_DPCM, DC4_d2_DPCM, DC4_d3_DPCM, DC4_d4_DPCM, DC4_d5_DPCM, DC4_d6_DPCM, DC4_d7_DPCM, DC4_d8_DPCM, DC4_quant_uniform_DPCM, DC4_size_DPCM, AC4_1_d0_DPCM, AC4_1_d1_DPCM, AC4_1_d2_DPCM, AC4_1_d3_DPCM, AC4_1_d4_DPCM, AC4_quant_uniform_DPCM, AC4_row_DPCM, AC4_col_DPCM, AC4_num_DPCM, AC4_2_d0_DPCM, AC4_2_d1_DPCM, AC4_2_d2_DPCM, C4_col_DPCM);
[Compression_ratio_4_DPCM, SNR_G4_DPCM] = CRandSNR(G, G4_dequantized_DPCM, 4, DC4_size_DPCM, C4_row_DPCM, C4_col_DPCM);

% 8

[dG8_DPCM, dG8_row_DPCM, dG8_col_DPCM, C8_DPCM] = dct2onBlocks(G, 8);
[C8_row_DPCM, C8_col_DPCM, DC8_DPCM, DC8_size_DPCM, DC8_min_DPCM, DC8_max_DPCM, DC8_range_DPCM, DC8_interval_DPCM, DC8_d0_DPCM, DC8_d1_DPCM, DC8_d2_DPCM, DC8_d3_DPCM, DC8_d4_DPCM, DC8_d5_DPCM, DC8_d6_DPCM, DC8_d7_DPCM, DC8_d8_DPCM, DC8_quant_uniform_DPCM] = quantizeDC_DPCM(C8_DPCM, 8);
[AC8_DPCM] = zigzagAC(C8_row_DPCM, C8_col_DPCM, C8_DPCM, 8);
[AC8_row_DPCM, AC8_col_DPCM, AC8_min_DPCM, AC8_max_DPCM, L8_DPCM, H8_DPCM] = LandH(AC8_DPCM, 8);
[AC8_num_DPCM, AC8_quant_uniform_DPCM, AC8_range_DPCM, AC8_1_interval_DPCM, AC8_1_d0_DPCM, AC8_1_d1_DPCM, AC8_1_d2_DPCM, AC8_1_d3_DPCM, AC8_1_d4_DPCM, AC8_2_interval_DPCM, AC8_2_d0_DPCM, AC8_2_d1_DPCM, AC8_2_d2_DPCM] = quantizeAC(8, AC8_DPCM, AC8_row_DPCM, AC8_col_DPCM, H8_DPCM, L8_DPCM);
[DC8_r0_DPCM, DC8_r1_DPCM, DC8_r2_DPCM, DC8_r3_DPCM, DC8_r4_DPCM, DC8_r5_DPCM, DC8_r6_DPCM, DC8_r7_DPCM, DC8_dequant_uniform_DPCM, AC8_1_r0_DPCM, AC8_1_r1_DPCM, AC8_1_r2_DPCM, AC8_1_r3_DPCM, AC8_dequant_uniform_DPCM, AC8_2_r0_DPCM, AC8_2_r1_DPCM, C8_dequant_uniform_DPCM, dG_C8_dequantized_DPCM, G8_dequantized_DPCM] = reconstruction_DPCM(8, DC8_d0_DPCM, DC8_d1_DPCM, DC8_d2_DPCM, DC8_d3_DPCM, DC8_d4_DPCM, DC8_d5_DPCM, DC8_d6_DPCM, DC8_d7_DPCM, DC8_d8_DPCM, DC8_quant_uniform_DPCM, DC8_size_DPCM, AC8_1_d0_DPCM, AC8_1_d1_DPCM, AC8_1_d2_DPCM, AC8_1_d3_DPCM, AC8_1_d4_DPCM, AC8_quant_uniform_DPCM, AC8_row_DPCM, AC8_col_DPCM, AC8_num_DPCM, AC8_2_d0_DPCM, AC8_2_d1_DPCM, AC8_2_d2_DPCM, C8_col_DPCM);
[Compression_ratio_8_DPCM, SNR_G8_DPCM] = CRandSNR(G, G8_dequantized_DPCM, 8, DC8_size_DPCM, C8_row_DPCM, C8_col_DPCM);

% 16

[dG16_DPCM, dG16_row_DPCM, dG16_col_DPCM, C16_DPCM] = dct2onBlocks(G, 16);
[C16_row_DPCM, C16_col_DPCM, DC16_DPCM, DC16_size_DPCM, DC16_min_DPCM, DC16_max_DPCM, DC16_range_DPCM, DC16_interval_DPCM, DC16_d0_DPCM, DC16_d1_DPCM, DC16_d2_DPCM, DC16_d3_DPCM, DC16_d4_DPCM, DC16_d5_DPCM, DC16_d6_DPCM, DC16_d7_DPCM, DC16_d8_DPCM, DC16_quant_uniform_DPCM] = quantizeDC_DPCM(C16_DPCM, 16);
[AC16_DPCM] = zigzagAC(C16_row_DPCM, C16_col_DPCM, C16_DPCM, 16);
[AC16_row_DPCM, AC16_col_DPCM, AC16_min_DPCM, AC16_max_DPCM, L16_DPCM, H16_DPCM] = LandH(AC16_DPCM, 16);
[AC16_num_DPCM, AC16_quant_uniform_DPCM, AC16_range_DPCM, AC16_1_interval_DPCM, AC16_1_d0_DPCM, AC16_1_d1_DPCM, AC16_1_d2_DPCM, AC16_1_d3_DPCM, AC16_1_d4_DPCM, AC16_2_interval_DPCM, AC16_2_d0_DPCM, AC16_2_d1_DPCM, AC16_2_d2_DPCM] = quantizeAC(16, AC16_DPCM, AC16_row_DPCM, AC16_col_DPCM, H16_DPCM, L16_DPCM);
[DC16_r0_DPCM, DC16_r1_DPCM, DC16_r2_DPCM, DC16_r3_DPCM, DC16_r4_DPCM, DC16_r5_DPCM, DC16_r6_DPCM, DC16_r7_DPCM, DC16_dequant_uniform_DPCM, AC16_1_r0_DPCM, AC16_1_r1_DPCM, AC16_1_r2_DPCM, AC16_1_r3_DPCM, AC16_dequant_uniform_DPCM, AC16_2_r0_DPCM, AC16_2_r1_DPCM, C16_dequant_uniform_DPCM, dG_C16_dequantized_DPCM, G16_dequantized_DPCM] = reconstruction_DPCM(16, DC16_d0_DPCM, DC16_d1_DPCM, DC16_d2_DPCM, DC16_d3_DPCM, DC16_d4_DPCM, DC16_d5_DPCM, DC16_d6_DPCM, DC16_d7_DPCM, DC16_d8_DPCM, DC16_quant_uniform_DPCM, DC16_size_DPCM, AC16_1_d0_DPCM, AC16_1_d1_DPCM, AC16_1_d2_DPCM, AC16_1_d3_DPCM, AC16_1_d4_DPCM, AC16_quant_uniform_DPCM, AC16_row_DPCM, AC16_col_DPCM, AC16_num_DPCM, AC16_2_d0_DPCM, AC16_2_d1_DPCM, AC16_2_d2_DPCM, C16_col_DPCM);
[Compression_ratio_16_DPCM, SNR_G16_DPCM] = CRandSNR(G, G16_dequantized_DPCM, 16, DC16_size_DPCM, C16_row_DPCM, C16_col_DPCM);

% 32

[dG32_DPCM, dG32_row_DPCM, dG32_col_DPCM, C32_DPCM] = dct2onBlocks(G, 32);
[C32_row_DPCM, C32_col_DPCM, DC32_DPCM, DC32_size_DPCM, DC32_min_DPCM, DC32_max_DPCM, DC32_range_DPCM, DC32_interval_DPCM, DC32_d0_DPCM, DC32_d1_DPCM, DC32_d2_DPCM, DC32_d3_DPCM, DC32_d4_DPCM, DC32_d5_DPCM, DC32_d6_DPCM, DC32_d7_DPCM, DC32_d8_DPCM, DC32_quant_uniform_DPCM] = quantizeDC_DPCM(C32_DPCM, 32);
[AC32_DPCM] = zigzagAC(C32_row_DPCM, C32_col_DPCM, C32_DPCM, 32);
[AC32_row_DPCM, AC32_col_DPCM, AC32_min_DPCM, AC32_max_DPCM, L32_DPCM, H32_DPCM] = LandH(AC32_DPCM, 32);
[AC32_num_DPCM, AC32_quant_uniform_DPCM, AC32_range_DPCM, AC32_1_interval_DPCM, AC32_1_d0_DPCM, AC32_1_d1_DPCM, AC32_1_d2_DPCM, AC32_1_d3_DPCM, AC32_1_d4_DPCM, AC32_2_interval_DPCM, AC32_2_d0_DPCM, AC32_2_d1_DPCM, AC32_2_d2_DPCM] = quantizeAC(32, AC32_DPCM, AC32_row_DPCM, AC32_col_DPCM, H32_DPCM, L32_DPCM);
[DC32_r0_DPCM, DC32_r1_DPCM, DC32_r2_DPCM, DC32_r3_DPCM, DC32_r4_DPCM, DC32_r5_DPCM, DC32_r6_DPCM, DC32_r7_DPCM, DC32_dequant_uniform_DPCM, AC32_1_r0_DPCM, AC32_1_r1_DPCM, AC32_1_r2_DPCM, AC32_1_r3_DPCM, AC32_dequant_uniform_DPCM, AC32_2_r0_DPCM, AC32_2_r1_DPCM, C32_dequant_uniform_DPCM, dG_C32_dequantized_DPCM, G32_dequantized_DPCM] = reconstruction_DPCM(32, DC32_d0_DPCM, DC32_d1_DPCM, DC32_d2_DPCM, DC32_d3_DPCM, DC32_d4_DPCM, DC32_d5_DPCM, DC32_d6_DPCM, DC32_d7_DPCM, DC32_d8_DPCM, DC32_quant_uniform_DPCM, DC32_size_DPCM, AC32_1_d0_DPCM, AC32_1_d1_DPCM, AC32_1_d2_DPCM, AC32_1_d3_DPCM, AC32_1_d4_DPCM, AC32_quant_uniform_DPCM, AC32_row_DPCM, AC32_col_DPCM, AC32_num_DPCM, AC32_2_d0_DPCM, AC32_2_d1_DPCM, AC32_2_d2_DPCM, C32_col_DPCM);
[Compression_ratio_32_DPCM, SNR_G32_DPCM] = CRandSNR(G, G32_dequantized_DPCM, 32, DC32_size_DPCM, C32_row_DPCM, C32_col_DPCM);

% 64

[dG64_DPCM, dG64_row_DPCM, dG64_col_DPCM, C64_DPCM] = dct2onBlocks(G, 64);
[C64_row_DPCM, C64_col_DPCM, DC64_DPCM, DC64_size_DPCM, DC64_min_DPCM, DC64_max_DPCM, DC64_range_DPCM, DC64_interval_DPCM, DC64_d0_DPCM, DC64_d1_DPCM, DC64_d2_DPCM, DC64_d3_DPCM, DC64_d4_DPCM, DC64_d5_DPCM, DC64_d6_DPCM, DC64_d7_DPCM, DC64_d8_DPCM, DC64_quant_uniform_DPCM] = quantizeDC_DPCM(C64_DPCM, 64);
[AC64_DPCM] = zigzagAC(C64_row_DPCM, C64_col_DPCM, C64_DPCM, 64);
[AC64_row_DPCM, AC64_col_DPCM, AC64_min_DPCM, AC64_max_DPCM, L64_DPCM, H64_DPCM] = LandH(AC64_DPCM, 64);
[AC64_num_DPCM, AC64_quant_uniform_DPCM, AC64_range_DPCM, AC64_1_interval_DPCM, AC64_1_d0_DPCM, AC64_1_d1_DPCM, AC64_1_d2_DPCM, AC64_1_d3_DPCM, AC64_1_d4_DPCM, AC64_2_interval_DPCM, AC64_2_d0_DPCM, AC64_2_d1_DPCM, AC64_2_d2_DPCM] = quantizeAC(64, AC64_DPCM, AC64_row_DPCM, AC64_col_DPCM, H64_DPCM, L64_DPCM);
[DC64_r0_DPCM, DC64_r1_DPCM, DC64_r2_DPCM, DC64_r3_DPCM, DC64_r4_DPCM, DC64_r5_DPCM, DC64_r6_DPCM, DC64_r7_DPCM, DC64_dequant_uniform_DPCM, AC64_1_r0_DPCM, AC64_1_r1_DPCM, AC64_1_r2_DPCM, AC64_1_r3_DPCM, AC64_dequant_uniform_DPCM, AC64_2_r0_DPCM, AC64_2_r1_DPCM, C64_dequant_uniform_DPCM, dG_C64_dequantized_DPCM, G64_dequantized_DPCM] = reconstruction_DPCM(64, DC64_d0_DPCM, DC64_d1_DPCM, DC64_d2_DPCM, DC64_d3_DPCM, DC64_d4_DPCM, DC64_d5_DPCM, DC64_d6_DPCM, DC64_d7_DPCM, DC64_d8_DPCM, DC64_quant_uniform_DPCM, DC64_size_DPCM, AC64_1_d0_DPCM, AC64_1_d1_DPCM, AC64_1_d2_DPCM, AC64_1_d3_DPCM, AC64_1_d4_DPCM, AC64_quant_uniform_DPCM, AC64_row_DPCM, AC64_col_DPCM, AC64_num_DPCM, AC64_2_d0_DPCM, AC64_2_d1_DPCM, AC64_2_d2_DPCM, C64_col_DPCM);
[Compression_ratio_64_DPCM, SNR_G64_DPCM] = CRandSNR(G, G64_dequantized_DPCM, 64, DC64_size_DPCM, C64_row_DPCM, C64_col_DPCM);

% Graph
Block_size_DPCM = [2 4 8 16 32 64];
SNR_list_DPCM = [SNR_G2_DPCM SNR_G4_DPCM SNR_G8_DPCM SNR_G16_DPCM SNR_G32_DPCM SNR_G64_DPCM];
plot(Block_size_DPCM, SNR_list_DPCM, '-ro');
axis([0 70 -5 5])
xticks([2 4 8 16 32 64]);
xlabel("Block size");
ylabel("Signal-to-noise ratio");
title("'n' VS SNR");

function [dGn, dGn_row, dGn_col, Cn] = dct2onBlocks(G, n)
    dGn = blockproc(G, [n n], @(blkStruct) dct2(blkStruct.data));
    [dGn_row, dGn_col] = size(dGn);
    
    if n == 2
        dim1 = [n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n];
        dim2 = [n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n];
    end
    
    if n == 4
        dim1 = [n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n];
        dim2 = [n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n];
    end

    if n == 8
        dim1 = [n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n];
        dim2 = [n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n];
    end

    if n == 16
        dim1 = [n n n n n n n n n n n n n n n n n n n n n n n n n n n n];
        dim2 = [n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n n];
    end

    if n == 32
        dim1 = [n n n n n n n n n n n n n n];
        dim2 = [n n n n n n n n n n n n n n n n n n n n];
    end

    if n == 64
        dim1 = [n n n n n n n];
        dim2 = [n n n n n n n n n n];
    end
    
    Cn = mat2cell(dGn, dim1, dim2);
end


function [Cn_row, Cn_col, DCn, DCn_size, DCn_min, DCn_max, DCn_range, DCn_interval, DCn_d0, DCn_d1, DCn_d2, DCn_d3, DCn_d4, DCn_d5, DCn_d6, DCn_d7, DCn_d8, DCn_quant_uniform] = quantizeDC(Cn, n)
    [Cn_row, Cn_col] = size(Cn);
    DCn = [];
    for i = 1:Cn_row
        for j = 1:Cn_col
            DCn = [DCn, Cn{i, j}(1, 1)];
        end
    end
    
    DCn_size = length(DCn);
    DCn_min = min(DCn);
    DCn_max = max(DCn);
    DCn_range = ceil(DCn_max + 0.000001)  - floor(DCn_min);
    DCn_interval = DCn_range/n;
    
    DCn_d0 = floor(DCn_min);
    DCn_d1 = floor(DCn_min) + 1 * DCn_interval;
    DCn_d2 = floor(DCn_min) + 2 * DCn_interval;
    DCn_d3 = floor(DCn_min) + 3 * DCn_interval;
    DCn_d4 = floor(DCn_min) + 4 * DCn_interval;
    DCn_d5 = floor(DCn_min) + 5 * DCn_interval;
    DCn_d6 = floor(DCn_min) + 6 * DCn_interval;
    DCn_d7 = floor(DCn_min) + 7 * DCn_interval;
    DCn_d8 = floor(DCn_min) + 8 * DCn_interval;
    
    DCn_quant_uniform = DCn;
    for i = 1:DCn_size
        f = DCn(i);
        if f < DCn_d1
            DCn_quant_uniform(i) = 0;
        elseif f < DCn_d2
            DCn_quant_uniform(i) = 1;
        elseif f < DCn_d3
            DCn_quant_uniform(i) = 2;
        elseif f < DCn_d4
            DCn_quant_uniform(i) = 3;
        elseif f < DCn_d5
            DCn_quant_uniform(i) = 4;
        elseif f < DCn_d6
            DCn_quant_uniform(i) = 5;
        elseif f < DCn_d7
            DCn_quant_uniform(i) = 6;
        else
            DCn_quant_uniform(i) = 7;
        end
    end
end


function [Cn_row, Cn_col, DCn, DCn_size, DCn_min, DCn_max, DCn_range, DCn_interval, DCn_d0, DCn_d1, DCn_d2, DCn_d3, DCn_d4, DCn_d5, DCn_d6, DCn_d7, DCn_d8, DCn_quant_uniform] = quantizeDC_DPCM(Cn, n)
    [Cn_row, Cn_col] = size(Cn);
    DCn = [];
    for i = 1:Cn_row
        for j = 1:Cn_col
            DCn = [DCn, Cn{i, j}(1, 1)];
        end
    end
    
    DCn_size = length(DCn);
    temp = DCn;
    for i = 1:DCn_size
        if mod(i, Cn_col) ~= 1
            DCn(i) = temp(i) - temp(i - 1);
        end
    end
    
    DCn_min = min(DCn);
    DCn_max = max(DCn);
    DCn_range = ceil(DCn_max + 0.000001)  - floor(DCn_min);
    DCn_interval = DCn_range/n;
    
    DCn_d0 = floor(DCn_min);
    DCn_d1 = floor(DCn_min) + 1 * DCn_interval;
    DCn_d2 = floor(DCn_min) + 2 * DCn_interval;
    DCn_d3 = floor(DCn_min) + 3 * DCn_interval;
    DCn_d4 = floor(DCn_min) + 4 * DCn_interval;
    DCn_d5 = floor(DCn_min) + 5 * DCn_interval;
    DCn_d6 = floor(DCn_min) + 6 * DCn_interval;
    DCn_d7 = floor(DCn_min) + 7 * DCn_interval;
    DCn_d8 = floor(DCn_min) + 8 * DCn_interval;
    
    DCn_quant_uniform = DCn;
    for i = 1:DCn_size
        f = DCn(i);
        if f < DCn_d1
            DCn_quant_uniform(i) = 0;
        elseif f < DCn_d2
            DCn_quant_uniform(i) = 1;
        elseif f < DCn_d3
            DCn_quant_uniform(i) = 2;
        elseif f < DCn_d4
            DCn_quant_uniform(i) = 3;
        elseif f < DCn_d5
            DCn_quant_uniform(i) = 4;
        elseif f < DCn_d6
            DCn_quant_uniform(i) = 5;
        elseif f < DCn_d7
            DCn_quant_uniform(i) = 6;
        else
            DCn_quant_uniform(i) = 7;
        end
    end
end


function [ACn] = zigzagAC(Cn_row, Cn_col, Cn, n)
    ACn = [];
    for r = 1:Cn_row
        for c = 1:Cn_col
            temp = zigzag(Cn{r, c});
            i = 1;
            for j = 2:n*n
                ACn{r, c}(i) = temp(j);
                i = i + 1;
            end
        end
    end
end


function [ACn_row, ACn_col, ACn_min, ACn_max, Ln, Hn] = LandH(ACn, n)
    [ACn_row, ACn_col] = size(ACn);
    ACn_min = 1000000;
    ACn_max = -1000000;
    
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = 1:(n*n - 1)
                if ACn{r, c}(i) > ACn_max
                    ACn_max = ACn{r, c}(i);
                end
                if ACn{r, c}(i) < ACn_min
                    ACn_min = ACn{r, c}(i);
                end
            end
        end
    end
    
    Ln = floor(ACn_min);
    Hn = ceil(ACn_max + 0.000001);
end


function [ACn_num, ACn_quant_uniform, ACn_range, ACn_1_interval, ACn_1_d0, ACn_1_d1, ACn_1_d2, ACn_1_d3, ACn_1_d4, ACn_2_interval, ACn_2_d0, ACn_2_d1, ACn_2_d2] = quantizeAC(n, ACn, ACn_row, ACn_col, Hn, Ln)
    ACn_num = floor((n*n - 1) / 10);
    
    ACn_quant_uniform = ACn;
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = (2*ACn_num + 1):(n*n - 1)
                ACn_quant_uniform{r, c}(i) = 0;
            end
        end
    end
    
    ACn_range = Hn - Ln;
    ACn_1_interval = ACn_range/4;
    
    ACn_1_d0 = Ln;
    ACn_1_d1 = Ln + 1 * ACn_1_interval;
    ACn_1_d2 = Ln + 2 * ACn_1_interval;
    ACn_1_d3 = Ln + 3 * ACn_1_interval;
    ACn_1_d4 = Ln + 4 * ACn_1_interval;
    
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = 1:ACn_num
                f = ACn_quant_uniform{r, c}(i);
                if f < ACn_1_d1
                    ACn_quant_uniform{r, c}(i) = 0;
                elseif f < ACn_1_d2
                    ACn_quant_uniform{r, c}(i) = 1;
                elseif f < ACn_1_d3
                    ACn_quant_uniform{r, c}(i) = 2;
                else
                    ACn_quant_uniform{r, c}(i) = 3;
                end
            end
        end
    end
    
    ACn_2_interval = ACn_range/2;
    
    ACn_2_d0 = Ln;
    ACn_2_d1 = Ln + 1 * ACn_2_interval;
    ACn_2_d2 = Ln + 2 * ACn_2_interval;
    
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = (ACn_num + 1):(2 * ACn_num)
                f = ACn_quant_uniform{r, c}(i);
                if f < ACn_2_d1
                    ACn_quant_uniform{r, c}(i) = 0;
                else
                    ACn_quant_uniform{r, c}(i) = 1;
                end
            end
        end
    end
end


function [DCn_r0, DCn_r1, DCn_r2, DCn_r3, DCn_r4, DCn_r5, DCn_r6, DCn_r7, DCn_dequant_uniform, ACn_1_r0, ACn_1_r1, ACn_1_r2, ACn_1_r3, ACn_dequant_uniform, ACn_2_r0, ACn_2_r1, Cn_dequant_uniform, dG_Cn_dequantized, Gn_dequantized] = reconstruction(n, DCn_d0, DCn_d1, DCn_d2, DCn_d3, DCn_d4, DCn_d5, DCn_d6, DCn_d7, DCn_d8, DCn_quant_uniform, DCn_size, ACn_1_d0, ACn_1_d1, ACn_1_d2, ACn_1_d3, ACn_1_d4, ACn_quant_uniform, ACn_row, ACn_col, ACn_num, ACn_2_d0, ACn_2_d1, ACn_2_d2)
    DCn_r0 = (DCn_d0 + DCn_d1) / 2;
    DCn_r1 = (DCn_d1 + DCn_d2) / 2;
    DCn_r2 = (DCn_d2 + DCn_d3) / 2;
    DCn_r3 = (DCn_d3 + DCn_d4) / 2;
    DCn_r4 = (DCn_d4 + DCn_d5) / 2;
    DCn_r5 = (DCn_d5 + DCn_d6) / 2;
    DCn_r6 = (DCn_d6 + DCn_d7) / 2;
    DCn_r7 = (DCn_d7 + DCn_d8) / 2;
    
    DCn_dequant_uniform = DCn_quant_uniform;
    for i = 1:DCn_size
        f = DCn_quant_uniform(i);
        if f == 0
            DCn_dequant_uniform(i) = DCn_r0;
        elseif f == 1
            DCn_dequant_uniform(i) = DCn_r1;
        elseif f == 2
            DCn_dequant_uniform(i) = DCn_r2;
        elseif f == 3
            DCn_dequant_uniform(i) = DCn_r3;
        elseif f == 4
            DCn_dequant_uniform(i) = DCn_r4;
        elseif f == 5
            DCn_dequant_uniform(i) = DCn_r5;
        elseif f == 6
            DCn_dequant_uniform(i) = DCn_r6;
        else
            DCn_dequant_uniform(i) = DCn_r7;
        end
    end
    
    ACn_1_r0 = (ACn_1_d0 + ACn_1_d1) / 2;
    ACn_1_r1 = (ACn_1_d1 + ACn_1_d2) / 2;
    ACn_1_r2 = (ACn_1_d2 + ACn_1_d3) / 2;
    ACn_1_r3 = (ACn_1_d3 + ACn_1_d4) / 2;
    
    ACn_dequant_uniform = ACn_quant_uniform;
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = 1:ACn_num
                f = ACn_quant_uniform{r, c}(i);
                if f == 0
                    ACn_dequant_uniform{r, c}(i) = ACn_1_r0;
                elseif f == 1
                    ACn_dequant_uniform{r, c}(i) = ACn_1_r1;
                elseif f == 2
                    ACn_dequant_uniform{r, c}(i) = ACn_1_r2;
                else
                    ACn_dequant_uniform{r, c}(i) = ACn_1_r3;
                end
            end
        end
    end
    
    ACn_2_r0 = (ACn_2_d0 + ACn_2_d1) / 2;
    ACn_2_r1 = (ACn_2_d1 + ACn_2_d2) / 2;
    
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = (ACn_num + 1):(2 * ACn_num)
                f = ACn_quant_uniform{r, c}(i);
                if f == 0
                    ACn_dequant_uniform{r, c}(i) = ACn_2_r0;
                else
                    ACn_dequant_uniform{r, c}(i) = ACn_2_r1;
                end
            end
        end
    end
    
    i = 1;
    Cn_dequant_uniform = ACn_dequant_uniform;
    for r = 1:ACn_row
        for c = 1:ACn_col
            Cn_dequant_uniform{r, c}(1) = DCn_dequant_uniform(i);
            i = i + 1;
        end
    end
    
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = 2:(n * n)
                Cn_dequant_uniform{r, c}(i) = ACn_dequant_uniform{r, c}(i-1);
            end
        end
    end
    
    for r = 1:ACn_row
        for c = 1:ACn_col
            Cn_dequant_uniform{r, c} = izigzag(Cn_dequant_uniform{r, c}, n, n);
        end
    end
    
    
    
    dG_Cn_dequantized = cell2mat(Cn_dequant_uniform);
    Gn_dequantized = blockproc(dG_Cn_dequantized, [n n], @(blkStruct) idct2(blkStruct.data));
    
    imagesc(Gn_dequantized);
    colormap(gray);
end

function [DCn_r0, DCn_r1, DCn_r2, DCn_r3, DCn_r4, DCn_r5, DCn_r6, DCn_r7, DCn_dequant_uniform, ACn_1_r0, ACn_1_r1, ACn_1_r2, ACn_1_r3, ACn_dequant_uniform, ACn_2_r0, ACn_2_r1, Cn_dequant_uniform, dG_Cn_dequantized, Gn_dequantized] = reconstruction_DPCM(n, DCn_d0, DCn_d1, DCn_d2, DCn_d3, DCn_d4, DCn_d5, DCn_d6, DCn_d7, DCn_d8, DCn_quant_uniform, DCn_size, ACn_1_d0, ACn_1_d1, ACn_1_d2, ACn_1_d3, ACn_1_d4, ACn_quant_uniform, ACn_row, ACn_col, ACn_num, ACn_2_d0, ACn_2_d1, ACn_2_d2, Cn_col)
    DCn_r0 = (DCn_d0 + DCn_d1) / 2;
    DCn_r1 = (DCn_d1 + DCn_d2) / 2;
    DCn_r2 = (DCn_d2 + DCn_d3) / 2;
    DCn_r3 = (DCn_d3 + DCn_d4) / 2;
    DCn_r4 = (DCn_d4 + DCn_d5) / 2;
    DCn_r5 = (DCn_d5 + DCn_d6) / 2;
    DCn_r6 = (DCn_d6 + DCn_d7) / 2;
    DCn_r7 = (DCn_d7 + DCn_d8) / 2;
    
    DCn_dequant_uniform = DCn_quant_uniform;
    for i = 1:DCn_size
        f = DCn_quant_uniform(i);
        if f == 0
            DCn_dequant_uniform(i) = DCn_r0;
        elseif f == 1
            DCn_dequant_uniform(i) = DCn_r1;
        elseif f == 2
            DCn_dequant_uniform(i) = DCn_r2;
        elseif f == 3
            DCn_dequant_uniform(i) = DCn_r3;
        elseif f == 4
            DCn_dequant_uniform(i) = DCn_r4;
        elseif f == 5
            DCn_dequant_uniform(i) = DCn_r5;
        elseif f == 6
            DCn_dequant_uniform(i) = DCn_r6;
        else
            DCn_dequant_uniform(i) = DCn_r7;
        end
    end

    temp = DCn_dequant_uniform;
    for i = 1:DCn_size
        if mod(i, Cn_col) ~= 1
            DCn_dequant_uniform(i) = temp(i) + temp(i - 1);
        end
    end
    
    ACn_1_r0 = (ACn_1_d0 + ACn_1_d1) / 2;
    ACn_1_r1 = (ACn_1_d1 + ACn_1_d2) / 2;
    ACn_1_r2 = (ACn_1_d2 + ACn_1_d3) / 2;
    ACn_1_r3 = (ACn_1_d3 + ACn_1_d4) / 2;
    
    ACn_dequant_uniform = ACn_quant_uniform;
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = 1:ACn_num
                f = ACn_quant_uniform{r, c}(i);
                if f == 0
                    ACn_dequant_uniform{r, c}(i) = ACn_1_r0;
                elseif f == 1
                    ACn_dequant_uniform{r, c}(i) = ACn_1_r1;
                elseif f == 2
                    ACn_dequant_uniform{r, c}(i) = ACn_1_r2;
                else
                    ACn_dequant_uniform{r, c}(i) = ACn_1_r3;
                end
            end
        end
    end
    
    ACn_2_r0 = (ACn_2_d0 + ACn_2_d1) / 2;
    ACn_2_r1 = (ACn_2_d1 + ACn_2_d2) / 2;
    
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = (ACn_num + 1):(2 * ACn_num)
                f = ACn_quant_uniform{r, c}(i);
                if f == 0
                    ACn_dequant_uniform{r, c}(i) = ACn_2_r0;
                else
                    ACn_dequant_uniform{r, c}(i) = ACn_2_r1;
                end
            end
        end
    end
    
    i = 1;
    Cn_dequant_uniform = ACn_dequant_uniform;
    for r = 1:ACn_row
        for c = 1:ACn_col
            Cn_dequant_uniform{r, c}(1) = DCn_dequant_uniform(i);
            i = i + 1;
        end
    end
    
    for r = 1:ACn_row
        for c = 1:ACn_col
            for i = 2:(n * n)
                Cn_dequant_uniform{r, c}(i) = ACn_dequant_uniform{r, c}(i-1);
            end
        end
    end
    
    for r = 1:ACn_row
        for c = 1:ACn_col
            Cn_dequant_uniform{r, c} = izigzag(Cn_dequant_uniform{r, c}, n, n);
        end
    end
    
    
    
    dG_Cn_dequantized = cell2mat(Cn_dequant_uniform);
    Gn_dequantized = blockproc(dG_Cn_dequantized, [n n], @(blkStruct) idct2(blkStruct.data));
    
    imagesc(Gn_dequantized);
    colormap(gray);
end

function [Compression_ratio_n, SNR_Gn] = CRandSNR(G, Gn_dequantized, n, DCn_size, Cn_row, Cn_col)
    disp("n = " + n);
    DC_size = DCn_size * log2(8);
    ACn_num = floor((n*n - 1) / 10);
    AC_size = Cn_row * Cn_col * (ACn_num * log2(4) + ACn_num * log2(2));
    Compressed_size_n = DC_size + AC_size;
    [G_row, G_col] = size(G);
    G_size = G_row * G_col * 8;
    Compression_ratio_n = G_size / Compressed_size_n;
    disp("CR = " + Compression_ratio_n);
    SNR_Gn = snr(G, G - Gn_dequantized);
    disp("SNR = " + SNR_Gn);
    fprintf("\n");
end


function output = zigzag(in)

    h = 1;
    v = 1;
    
    vmin = 1;
    hmin = 1;
    
    vmax = size(in, 1);
    hmax = size(in, 2);
    
    i = 1;
    
    output = zeros(1, vmax * hmax);
    
    while ((v <= vmax) && (h <= hmax))
        
        if (mod(h + v, 2) == 0)
    
            if (v == vmin)       
                output(i) = in(v, h);
    
                if (h == hmax)
	          v = v + 1;
	        else
                  h = h + 1;
                end
    
                i = i + 1;
    
            elseif ((h == hmax) && (v < vmax))
                output(i) = in(v, h);
                v = v + 1;
                i = i + 1;
    
            elseif ((v > vmin) && (h < hmax))
                output(i) = in(v, h);
                v = v - 1;
                h = h + 1;
                i = i + 1;
            end
            
        else
    
           if ((v == vmax) && (h <= hmax))
                output(i) = in(v, h);
                h = h + 1;
                i = i + 1;
            
           elseif (h == hmin)
                output(i) = in(v, h);
    
                if (v == vmax)
	          h = h + 1;
	        else
                  v = v + 1;
                end
    
                i = i + 1;
    
           elseif ((v < vmax) && (h > hmin))
                output(i) = in(v, h);
                v = v + 1;
                h = h - 1;
                i = i + 1;
           end
    
        end
    
        if ((v == vmax) && (h == hmax))
            output(i) = in(v, h);
            break
        end
    
    end
end

function output = izigzag(in, vmax, hmax)

    h = 1;
    v = 1;
    
    vmin = 1;
    hmin = 1;
    
    output = zeros(vmax, hmax);
    
    i = 1;
    
    while ((v <= vmax) && (h <= hmax))
    
        if (mod(h + v, 2) == 0)
    
            if (v == vmin)
                output(v, h) = in(i);
    
                if (h == hmax)
	          v = v + 1;
	        else
                  h = h + 1;
                end
    
                i = i + 1;
    
            elseif ((h == hmax) && (v < vmax))
                output(v, h) = in(i);
                v = v + 1;
                i = i + 1;
    
            elseif ((v > vmin) && (h < hmax))
                output(v, h) = in(i);
                v = v - 1;
                h = h + 1;
                i = i + 1;
            end
            
        else
    
           if ((v == vmax) && (h <= hmax))
                output(v, h) = in(i);
                h = h + 1;
                i = i + 1;
            
           elseif (h == hmin)
                output(v, h) = in(i);
    
                if (v == vmax)
	          h = h + 1;
	        else
                  v = v + 1;
                end
    
                i = i + 1;
    
           elseif ((v < vmax) && (h > hmin))
                output(v, h) = in(i);
                v = v + 1;
                h = h - 1;
                i = i + 1;
           end
    
        end
    
        if ((v == vmax) && (h == hmax))
            output(v, h) = in(i);
            break
        end
    
    end
end