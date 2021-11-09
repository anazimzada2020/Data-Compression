[I, map] = imread('image.gif');
G = ind2gray(I, map);
imagesc(I);
colormap(map);
imagesc(G);
colormap(gray);

% Problem 2
% a
e = entropy(G);
disp(e);


% b
[row, col] = size(G);

minimum = 100000;
maximum = 0;
for i = 1:row
    for j = 1:col
        f = double(G(i, j));
        if f <= minimum
            minimum = f;
        end
        if f >= maximum
            maximum = f;
        end
    end
end

disp(minimum);
disp(maximum);
range = maximum - minimum;
disp(range);
interval_uniform = range/8;
disp(interval_uniform);

d0_uniform = minimum;
d1_uniform = minimum + 1 * interval_uniform;
d2_uniform = minimum + 2 * interval_uniform;
d3_uniform = minimum + 3 * interval_uniform;
d4_uniform = minimum + 4 * interval_uniform;
d5_uniform = minimum + 5 * interval_uniform;
d6_uniform = minimum + 6 * interval_uniform;
d7_uniform = minimum + 7 * interval_uniform;
d8_uniform = minimum + 8 * interval_uniform;

G_quant_uniform = G;
for i = 1:row
    for j = 1:col
        f = double(G(i, j));
        if f < d1_uniform
            G_quant_uniform(i, j) = 0;
        elseif f < d2_uniform
            G_quant_uniform(i, j) = 1;
        elseif f < d3_uniform
            G_quant_uniform(i, j) = 2;
        elseif f < d4_uniform
            G_quant_uniform(i, j) = 3;
        elseif f < d5_uniform
            G_quant_uniform(i, j) = 4;
        elseif f < d6_uniform
            G_quant_uniform(i, j) = 5;
        elseif f < d7_uniform
            G_quant_uniform(i, j) = 6;
        else
            G_quant_uniform(i, j) = 7;
        end
    end
end

e_quant_uniform = entropy(G_quant_uniform);
disp(e_quant_uniform);

r0_uniform = (d0_uniform + d1_uniform) / 2;
r1_uniform = (d1_uniform + d2_uniform) / 2;
r2_uniform = (d2_uniform + d3_uniform) / 2;
r3_uniform = (d3_uniform + d4_uniform) / 2;
r4_uniform = (d4_uniform + d5_uniform) / 2;
r5_uniform = (d5_uniform + d6_uniform) / 2;
r6_uniform = (d6_uniform + d7_uniform) / 2;
r7_uniform = (d7_uniform + d8_uniform) / 2;

G_dequant_uniform = G_quant_uniform;
for i = 1:row
    for j = 1:col
        f = double(G_quant_uniform(i, j));
        if f == 0
            G_dequant_uniform(i, j) = r0_uniform;
        elseif f == 1
            G_dequant_uniform(i, j) = r1_uniform;
        elseif f == 2
            G_dequant_uniform(i, j) = r2_uniform;
        elseif f == 3
            G_dequant_uniform(i, j) = r3_uniform;
        elseif f == 4
            G_dequant_uniform(i, j) = r4_uniform;
        elseif f == 5
            G_dequant_uniform(i, j) = r5_uniform;
        elseif f == 6
            G_dequant_uniform(i, j) = r6_uniform;
        else
            G_dequant_uniform(i, j) = r7_uniform;
        end
    end
end

imagesc(G_dequant_uniform);
colormap(gray);

snr_uniform = snr(im2double(G), im2double(G - G_dequant_uniform));
disp(snr_uniform);


% c
G_quant_semiuniform = G_quant_uniform;
e_quant_semiuniform = entropy(G_quant_semiuniform);
disp(e_quant_semiuniform);

r0_sum = 0;
r0_count = 0;
r1_sum = 0;
r1_count = 0;
r2_sum = 0;
r2_count = 0;
r3_sum = 0;
r3_count = 0;
r4_sum = 0;
r4_count = 0;
r5_sum = 0;
r5_count = 0;
r6_sum = 0;
r6_count = 0;
r7_sum = 0;
r7_count = 0;

for i = 1:row
    for j = 1:col
        f = double(G(i, j));
        if f < d1_uniform
            r0_sum = r0_sum + f;
            r0_count = r0_count + 1;
        elseif f < d2_uniform
            r1_sum = r1_sum + f;
            r1_count = r1_count + 1;
        elseif f < d3_uniform
            r2_sum = r2_sum + f;
            r2_count = r2_count + 1;
        elseif f < d4_uniform
            r3_sum = r3_sum + f;
            r3_count = r3_count + 1;
        elseif f < d5_uniform
            r4_sum = r4_sum + f;
            r4_count = r4_count + 1;
        elseif f < d6_uniform
            r5_sum = r5_sum + f;
            r5_count = r5_count + 1;
        elseif f < d7_uniform
            r6_sum = r6_sum + f;
            r6_count = r6_count + 1;
        else
            r7_sum = r7_sum + f;
            r7_count = r7_count + 1;
        end
    end
end

r0_semiuniform = r0_sum / r0_count;
r1_semiuniform = r1_sum / r1_count;
r2_semiuniform = r2_sum / r2_count;
r3_semiuniform = r3_sum / r3_count;
r4_semiuniform = r4_sum / r4_count;
r5_semiuniform = r5_sum / r5_count;
r6_semiuniform = r6_sum / r6_count;
r7_semiuniform = r7_sum / r7_count;

G_dequant_semiuniform = G_quant_semiuniform;
for i = 1:row
    for j = 1:col
        f = double(G_quant_semiuniform(i, j));
        if f == 0
            G_dequant_semiuniform(i, j) = r0_semiuniform;
        elseif f == 1
            G_dequant_semiuniform(i, j) = r1_semiuniform;
        elseif f == 2
            G_dequant_semiuniform(i, j) = r2_semiuniform;
        elseif f == 3
            G_dequant_semiuniform(i, j) = r3_semiuniform;
        elseif f == 4
            G_dequant_semiuniform(i, j) = r4_semiuniform;
        elseif f == 5
            G_dequant_semiuniform(i, j) = r5_semiuniform;
        elseif f == 6
            G_dequant_semiuniform(i, j) = r6_semiuniform;
        else
            G_dequant_semiuniform(i, j) = r7_semiuniform;
        end
    end
end

imagesc(G_dequant_semiuniform);
colormap(gray);

snr_semiuniform = snr(im2double(G), im2double(G - G_dequant_semiuniform));
disp(snr_semiuniform);


% d
d0_nonuniform = d0_uniform;
d1_nonuniform = d1_uniform;
d2_nonuniform = d2_uniform;
d3_nonuniform = d3_uniform;
d4_nonuniform = d4_uniform;
d5_nonuniform = d5_uniform;
d6_nonuniform = d6_uniform;
d7_nonuniform = d7_uniform;
d8_nonuniform = d8_uniform;

iteration = 1;
while 1
    r0_sum = 0;
    r0_count = 0;
    r1_sum = 0;
    r1_count = 0;
    r2_sum = 0;
    r2_count = 0;
    r3_sum = 0;
    r3_count = 0;
    r4_sum = 0;
    r4_count = 0;
    r5_sum = 0;
    r5_count = 0;
    r6_sum = 0;
    r6_count = 0;
    r7_sum = 0;
    r7_count = 0;
    
    for i = 1:row
        for j = 1:col
            f = double(G(i, j));
            if f < d1_nonuniform
                r0_sum = r0_sum + f;
                r0_count = r0_count + 1;
            elseif f < d2_nonuniform
                r1_sum = r1_sum + f;
                r1_count = r1_count + 1;
            elseif f < d3_nonuniform
                r2_sum = r2_sum + f;
                r2_count = r2_count + 1;
            elseif f < d4_nonuniform
                r3_sum = r3_sum + f;
                r3_count = r3_count + 1;
            elseif f < d5_nonuniform
                r4_sum = r4_sum + f;
                r4_count = r4_count + 1;
            elseif f < d6_nonuniform
                r5_sum = r5_sum + f;
                r5_count = r5_count + 1;
            elseif f < d7_nonuniform
                r6_sum = r6_sum + f;
                r6_count = r6_count + 1;
            else
                r7_sum = r7_sum + f;
                r7_count = r7_count + 1;
            end
        end
    end
    
    r0_nonuniform = r0_sum / r0_count;
    r1_nonuniform = r1_sum / r1_count;
    r2_nonuniform = r2_sum / r2_count;
    r3_nonuniform = r3_sum / r3_count;
    r4_nonuniform = r4_sum / r4_count;
    r5_nonuniform = r5_sum / r5_count;
    r6_nonuniform = r6_sum / r6_count;
    r7_nonuniform = r7_sum / r7_count;
    
    d1_nonuniform_old = d1_nonuniform;
    d2_nonuniform_old = d2_nonuniform;
    d3_nonuniform_old = d3_nonuniform;
    d4_nonuniform_old = d4_nonuniform;
    d5_nonuniform_old = d5_nonuniform;
    d6_nonuniform_old = d6_nonuniform;
    d7_nonuniform_old = d7_nonuniform;
    
    d1_nonuniform = (r0_nonuniform + r1_nonuniform) / 2;
    d2_nonuniform = (r1_nonuniform + r2_nonuniform) / 2;
    d3_nonuniform = (r2_nonuniform + r3_nonuniform) / 2;
    d4_nonuniform = (r3_nonuniform + r4_nonuniform) / 2;
    d5_nonuniform = (r4_nonuniform + r5_nonuniform) / 2;
    d6_nonuniform = (r5_nonuniform + r6_nonuniform) / 2;
    d7_nonuniform = (r6_nonuniform + r7_nonuniform) / 2;
    
    d1_flag = d1_nonuniform_old == d1_nonuniform;
    d2_flag = d2_nonuniform_old == d2_nonuniform;
    d3_flag = d3_nonuniform_old == d3_nonuniform;
    d4_flag = d4_nonuniform_old == d4_nonuniform;
    d5_flag = d5_nonuniform_old == d5_nonuniform;
    d6_flag = d6_nonuniform_old == d6_nonuniform;
    d7_flag = d7_nonuniform_old == d7_nonuniform;
    
    if d1_flag && d2_flag && d3_flag && d4_flag && d5_flag && d6_flag && d7_flag
        break
    else
        iteration = iteration + 1;
    end
end

disp(iteration);

G_quant_nonuniform = G;
for i = 1:row
    for j = 1:col
        f = double(G(i, j));
        if f < d1_nonuniform
            G_quant_nonuniform(i, j) = 0;
        elseif f < d2_nonuniform
            G_quant_nonuniform(i, j) = 1;
        elseif f < d3_nonuniform
            G_quant_nonuniform(i, j) = 2;
        elseif f < d4_nonuniform
            G_quant_nonuniform(i, j) = 3;
        elseif f < d5_nonuniform
            G_quant_nonuniform(i, j) = 4;
        elseif f < d6_nonuniform
            G_quant_nonuniform(i, j) = 5;
        elseif f < d7_nonuniform
            G_quant_nonuniform(i, j) = 6;
        else
            G_quant_nonuniform(i, j) = 7;
        end
    end
end

e_quant_nonuniform = entropy(G_quant_nonuniform);
disp(e_quant_nonuniform);

G_dequant_nonuniform = G_quant_nonuniform;
for i = 1:row
    for j = 1:col
        f = double(G_quant_nonuniform(i, j));
        if f == 0
            G_dequant_nonuniform(i, j) = r0_nonuniform;
        elseif f == 1
            G_dequant_nonuniform(i, j) = r1_nonuniform;
        elseif f == 2
            G_dequant_nonuniform(i, j) = r2_nonuniform;
        elseif f == 3
            G_dequant_nonuniform(i, j) = r3_nonuniform;
        elseif f == 4
            G_dequant_nonuniform(i, j) = r4_nonuniform;
        elseif f == 5
            G_dequant_nonuniform(i, j) = r5_nonuniform;
        elseif f == 6
            G_dequant_nonuniform(i, j) = r6_nonuniform;
        else
            G_dequant_nonuniform(i, j) = r7_nonuniform;
        end
    end
end

imagesc(G_dequant_nonuniform);
colormap(gray);

snr_nonuniform = snr(im2double(G), im2double(G - G_dequant_nonuniform));
disp(snr_nonuniform);


% Problem 3
% b

n = 8;
G_unique = unique(G);
d = floor(length(G_unique)/n);
r0_clustering = double(G_unique(1 * d));
r1_clustering = double(G_unique(2 * d));
r2_clustering = double(G_unique(3 * d));
r3_clustering = double(G_unique(4 * d));
r4_clustering = double(G_unique(5 * d));
r5_clustering = double(G_unique(6 * d));
r6_clustering = double(G_unique(7 * d));
r7_clustering = double(G_unique(8 * d));

clustering_iteration = 1;
while 1
    G_quant_clustering = G;
    for i = 1:row
        for j = 1:col
            f = double(G(i, j));
            temp = 100000;
            if abs(f - r7_clustering) < temp
                temp = abs(f - r7_clustering);
                G_quant_clustering(i, j) = 7;
            end
            if abs(f - r6_clustering) < temp
                temp = abs(f - r6_clustering);
                G_quant_clustering(i, j) = 6;
            end
            if abs(f - r5_clustering) < temp
                temp = abs(f - r5_clustering);
                G_quant_clustering(i, j) = 5;
            end
            if abs(f - r4_clustering) < temp
                temp = abs(f - r4_clustering);
                G_quant_clustering(i, j) = 4;
            end
            if abs(f - r3_clustering) < temp
                temp = abs(f - r3_clustering);
                G_quant_clustering(i, j) = 3;
            end
            if abs(f - r2_clustering) < temp
                temp = abs(f - r2_clustering);
                G_quant_clustering(i, j) = 2;
            end
            if abs(f - r1_clustering) < temp
                temp = abs(f - r1_clustering);
                G_quant_clustering(i, j) = 1;
            end
            if abs(f - r0_clustering) < temp
                temp = abs(f - r0_clustering);
                G_quant_clustering(i, j) = 0;
            end
        end
    end
    
    r0_sum = 0;
    r0_count = 0;
    r1_sum = 0;
    r1_count = 0;
    r2_sum = 0;
    r2_count = 0;
    r3_sum = 0;
    r3_count = 0;
    r4_sum = 0;
    r4_count = 0;
    r5_sum = 0;
    r5_count = 0;
    r6_sum = 0;
    r6_count = 0;
    r7_sum = 0;
    r7_count = 0;
    
    for i = 1:row
        for j = 1:col
            f = double(G_quant_clustering(i, j));
            if f == 0
                r0_sum = r0_sum + double(G(i, j));
                r0_count = r0_count + 1;
            elseif f == 1
                r1_sum = r1_sum + double(G(i, j));
                r1_count = r1_count + 1;
            elseif f == 2
                r2_sum = r2_sum + double(G(i, j));
                r2_count = r2_count + 1;
            elseif f == 3
                r3_sum = r3_sum + double(G(i, j));
                r3_count = r3_count + 1;
            elseif f == 4
                r4_sum = r4_sum + double(G(i, j));
                r4_count = r4_count + 1;
            elseif f == 5
                r5_sum = r5_sum + double(G(i, j));
                r5_count = r5_count + 1;
            elseif f == 6
                r6_sum = r6_sum + double(G(i, j));
                r6_count = r6_count + 1;
            else
                r7_sum = r7_sum + double(G(i, j));
                r7_count = r7_count + 1;
            end
        end
    end
    
    r0_old = r0_clustering;
    r1_old = r1_clustering;
    r2_old = r2_clustering;
    r3_old = r3_clustering;
    r4_old = r4_clustering;
    r5_old = r5_clustering;
    r6_old = r6_clustering;
    r7_old = r7_clustering;
    
    r0_clustering = r0_sum / r0_count;
    r1_clustering = r1_sum / r1_count;
    r2_clustering = r2_sum / r2_count;
    r3_clustering = r3_sum / r3_count;
    r4_clustering = r4_sum / r4_count;
    r5_clustering = r5_sum / r5_count;
    r6_clustering = r6_sum / r6_count;
    r7_clustering = r7_sum / r7_count;

    r0_flag = r0_old == r0_clustering;
    r1_flag = r1_old == r1_clustering;
    r2_flag = r2_old == r2_clustering;
    r3_flag = r3_old == r3_clustering;
    r4_flag = r4_old == r4_clustering;
    r5_flag = r5_old == r5_clustering;
    r6_flag = r6_old == r6_clustering;
    r7_flag = r7_old == r7_clustering;
    
    if r0_flag && r1_flag && r2_flag && r3_flag && r4_flag && r5_flag && r6_flag && r7_flag
        break
    else
        clustering_iteration = clustering_iteration + 1;
    end
end

disp(clustering_iteration);

e_quant_clustering = entropy(G_quant_clustering);
disp(e_quant_clustering);

G_dequant_clustering = G_quant_clustering;
for i = 1:row
    for j = 1:col
        f = double(G_quant_clustering(i, j));
        if f == 0
            G_dequant_clustering(i, j) = r0_clustering;
        elseif f == 1
            G_dequant_clustering(i, j) = r1_clustering;
        elseif f == 2
            G_dequant_clustering(i, j) = r2_clustering;
        elseif f == 3
            G_dequant_clustering(i, j) = r3_clustering;
        elseif f == 4
            G_dequant_clustering(i, j) = r4_clustering;
        elseif f == 5
            G_dequant_clustering(i, j) = r5_clustering;
        elseif f == 6
            G_dequant_clustering(i, j) = r6_clustering;
        else
            G_dequant_clustering(i, j) = r7_clustering;
        end
    end
end

imagesc(G_dequant_clustering);
colormap(gray);

snr_clustering = snr(im2double(G), im2double(G - G_dequant_clustering));
disp(snr_clustering);


% Problem 4
% a

dG = blockproc(G, [8 8], @(blkStruct) dct2(blkStruct.data));
[dG_row, dG_col] = size(dG);

dim1 = [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8];
dim2 = [8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8];

C = mat2cell(dG, dim1, dim2);

[C_row, C_col] = size(C);
DC = [];
for i = 1:C_row
    for j = 1:C_col
        DC = [DC, C{i, j}(1, 1)];
    end
end

DC_size = length(DC);
DC_min = min(DC);
disp(DC_min);
DC_max = max(DC);
disp(DC_max);
DC_range = ceil(DC_max + 0.000001)  - floor(DC_min);
disp(DC_range);
DC_interval = DC_range/8;
disp(DC_interval);

DC_d0 = floor(DC_min);
DC_d1 = floor(DC_min) + 1 * DC_interval;
DC_d2 = floor(DC_min) + 2 * DC_interval;
DC_d3 = floor(DC_min) + 3 * DC_interval;
DC_d4 = floor(DC_min) + 4 * DC_interval;
DC_d5 = floor(DC_min) + 5 * DC_interval;
DC_d6 = floor(DC_min) + 6 * DC_interval;
DC_d7 = floor(DC_min) + 7 * DC_interval;
DC_d8 = floor(DC_min) + 8 * DC_interval;

DC_quant_uniform = DC;
for i = 1:DC_size
    f = double(DC(i));
    if f < DC_d1
        DC_quant_uniform(i) = 0;
    elseif f < DC_d2
        DC_quant_uniform(i) = 1;
    elseif f < DC_d3
        DC_quant_uniform(i) = 2;
    elseif f < DC_d4
        DC_quant_uniform(i) = 3;
    elseif f < DC_d5
        DC_quant_uniform(i) = 4;
    elseif f < DC_d6
        DC_quant_uniform(i) = 5;
    elseif f < DC_d7
        DC_quant_uniform(i) = 6;
    else
        DC_quant_uniform(i) = 7;
    end
end

for r = 1:C_row
    for c = 1:C_col
        for i = 1:8
            for j = 1:8
                if ~(((i == 1) && (j == 1 || j == 2 || j == 3 || j == 4)) || ((i == 2) && (j  == 1 || j == 2 || j ==3)) || ((i == 3) && (j  == 1 || j == 2)) || ((i == 4) && (j  == 1)))
                    C{r, c}(i, j) = 0;
                end
            end
        end
    end
end

C9 = {};
for r = 1:C_row
    for c = 1:C_col
        C9{r, c}(1, 1) = C{r, c}(1, 2);
        C9{r, c}(1, 2) = C{r, c}(2, 1);
        C9{r, c}(1, 3) = C{r, c}(3, 1);
        C9{r, c}(1, 4) = C{r, c}(2, 2);
        C9{r, c}(1, 5) = C{r, c}(1, 3);
        C9{r, c}(1, 6) = C{r, c}(1, 4);
        C9{r, c}(1, 7) = C{r, c}(2, 3);
        C9{r, c}(1, 8) = C{r, c}(3, 2);
        C9{r, c}(1, 9) = C{r, c}(4, 1);
    end
end

C9_max = 0;
C9_min = 100000;
[C9_row, C9_col] = size(C9);
for r = 1:C9_row
    for c = 1:C9_col
        for i = 1:9
            if C9{r, c}(1, i) > C9_max
                C9_max = C9{r, c}(1, i);
            end
            if C9{r, c}(1, i) < C9_min
                C9_min = C9{r, c}(1, i);
            end
        end
    end
end

disp(C9_min);
disp(C9_max);
C9_range = ceil(C9_max + 0.000001)  - floor(C9_min);
disp(C9_range);
C9_interval = C9_range/4;
disp(C9_interval);

C9_d0 = floor(C9_min);
C9_d1 = floor(C9_min) + 1 * C9_interval;
C9_d2 = floor(C9_min) + 2 * C9_interval;
C9_d3 = floor(C9_min) + 3 * C9_interval;
C9_d4 = floor(C9_min) + 4 * C9_interval;

C9_quant_uniform = C9;
for r = 1:C9_row
    for c = 1:C9_col
        for i = 1:9
            f = C9{r, c}(1, i);
            if f < C9_d1
                C9_quant_uniform{r, c}(1, i) = 0;
            elseif f < C9_d2
                C9_quant_uniform{r, c}(1, i) = 1;
            elseif f < C9_d3
                C9_quant_uniform{r, c}(1, i) = 2;
            else
                C9_quant_uniform{r, c}(1, i) = 3;
            end
        end
    end
end

dG_bit = dG_row * dG_col * 64;
DC_bit = DC_size * 3;
C9_bit = C_row * C_col * 9 * 2;
C9_compressed_size = DC_bit + C9_bit;

C9_bitrate = C9_compressed_size / (dG_row * dG_col);
disp(C9_bitrate);
C9_compression_ratio = dG_bit / C9_compressed_size;
disp(C9_compression_ratio);


% b

DC_r0 = (DC_d0 + DC_d1) / 2;
DC_r1 = (DC_d1 + DC_d2) / 2;
DC_r2 = (DC_d2 + DC_d3) / 2;
DC_r3 = (DC_d3 + DC_d4) / 2;
DC_r4 = (DC_d4 + DC_d5) / 2;
DC_r5 = (DC_d5 + DC_d6) / 2;
DC_r6 = (DC_d6 + DC_d7) / 2;
DC_r7 = (DC_d7 + DC_d8) / 2;

DC_dequant_uniform = DC_quant_uniform;
for i = 1:DC_size
    f = double(DC_quant_uniform(i));
    if f == 0
        DC_dequant_uniform(i) = DC_r0;
    elseif f == 1
        DC_dequant_uniform(i) = DC_r1;
    elseif f == 2
        DC_dequant_uniform(i) = DC_r2;
    elseif f == 3
        DC_dequant_uniform(i) = DC_r3;
    elseif f == 4
        DC_dequant_uniform(i) = DC_r4;
    elseif f == 5
        DC_dequant_uniform(i) = DC_r5;
    elseif f == 6
        DC_dequant_uniform(i) = DC_r6;
    else
        DC_dequant_uniform(i) = DC_r7;
    end
end

C9_r0 = (C9_d0 + C9_d1) / 2;
C9_r1 = (C9_d1 + C9_d2) / 2;
C9_r2 = (C9_d2 + C9_d3) / 2;
C9_r3 = (C9_d3 + C9_d4) / 2;

C9_dequant_uniform = C9_quant_uniform;
for r = 1:C9_row
    for c = 1:C9_col
        for i = 1:9
            f = C9_quant_uniform{r, c}(1, i);
            if f == 0
                C9_dequant_uniform{r, c}(1, i) = C9_r0;
            elseif f == 1
                C9_dequant_uniform{r, c}(1, i) = C9_r1;
            elseif f == 2
                C9_dequant_uniform{r, c}(1, i) = C9_r2;
            else
                C9_dequant_uniform{r, c}(1, i) = C9_r3;
            end
        end
    end
end

C9_DC_dequantized_uniform = C;
for r = 1:C_row
    for c = 1:C_col
        C9_DC_dequantized_uniform{r, c}(1, 2) = C9_dequant_uniform{r, c}(1, 1);
        C9_DC_dequantized_uniform{r, c}(2, 1) = C9_dequant_uniform{r, c}(1, 2);
        C9_DC_dequantized_uniform{r, c}(3, 1) = C9_dequant_uniform{r, c}(1, 3);
        C9_DC_dequantized_uniform{r, c}(2, 2) = C9_dequant_uniform{r, c}(1, 4);
        C9_DC_dequantized_uniform{r, c}(1, 3) = C9_dequant_uniform{r, c}(1, 5);
        C9_DC_dequantized_uniform{r, c}(1, 4) = C9_dequant_uniform{r, c}(1, 6);
        C9_DC_dequantized_uniform{r, c}(2, 3) = C9_dequant_uniform{r, c}(1, 7);
        C9_DC_dequantized_uniform{r, c}(3, 2) = C9_dequant_uniform{r, c}(1, 8);
        C9_DC_dequantized_uniform{r, c}(4, 1) = C9_dequant_uniform{r, c}(1, 9);
    end
end

i = 1;
for r = 1:C_row
    for c = 1:C_col
        C9_DC_dequantized_uniform{r, c}(1, 1) = DC_dequant_uniform(i);
        i = i + 1;
    end
end

dG_C9_dequantized = cell2mat(C9_DC_dequantized_uniform);
G10_dequantized = blockproc(dG_C9_dequantized, [8 8], @(blkStruct) idct2(blkStruct.data));

imagesc(G10_dequantized);
colormap(gray);

snr_G10 = snr(im2double(G), im2double(double(G) - G10_dequantized));
disp(snr_G10);


% c

for r = 1:C_row
    for c = 1:C_col
        for i = 1:8
            for j = 1:8
                if ~(((i == 1) && (j == 1 || j == 2 || j == 3)) || ((i == 2) && (j  == 1 || j == 2)) || ((i == 3) && (j  == 1)))
                    C{r, c}(i, j) = 0;
                end
            end
        end
    end
end

C5 = {};
for r = 1:C_row
    for c = 1:C_col
        C5{r, c}(1, 1) = C{r, c}(1, 2);
        C5{r, c}(1, 2) = C{r, c}(2, 1);
        C5{r, c}(1, 3) = C{r, c}(3, 1);
        C5{r, c}(1, 4) = C{r, c}(2, 2);
        C5{r, c}(1, 5) = C{r, c}(1, 3);
    end
end

C5_max = 0;
C5_min = 100000;
[C5_row, C5_col] = size(C5);
for r = 1:C5_row
    for c = 1:C5_col
        for i = 1:5
            if C5{r, c}(1, i) > C5_max
                C5_max = C5{r, c}(1, i);
            end
            if C5{r, c}(1, i) < C5_min
                C5_min = C5{r, c}(1, i);
            end
        end
    end
end

disp(C5_min);
disp(C5_max);
C5_range = ceil(C5_max + 0.000001)  - floor(C5_min);
disp(C5_range);
C5_interval = C5_range/4;
disp(C5_interval);

C5_d0 = floor(C5_min);
C5_d1 = floor(C5_min) + 1 * C5_interval;
C5_d2 = floor(C5_min) + 2 * C5_interval;
C5_d3 = floor(C5_min) + 3 * C5_interval;
C5_d4 = floor(C5_min) + 4 * C5_interval;

C5_quant_uniform = C5;
for r = 1:C5_row
    for c = 1:C5_col
        for i = 1:5
            f = C5{r, c}(1, i);
            if f < C5_d1
                C5_quant_uniform{r, c}(1, i) = 0;
            elseif f < C5_d2
                C5_quant_uniform{r, c}(1, i) = 1;
            elseif f < C5_d3
                C5_quant_uniform{r, c}(1, i) = 2;
            else
                C5_quant_uniform{r, c}(1, i) = 3;
            end
        end
    end
end

C5_bit = C_row * C_col * 5 * 2;
C5_compressed_size = DC_bit + C5_bit;

C5_bitrate = C5_compressed_size / (dG_row * dG_col);
disp(C9_bitrate);
C5_compression_ratio = dG_bit / C5_compressed_size;
disp(C5_compression_ratio);

C5_r0 = (C5_d0 + C5_d1) / 2;
C5_r1 = (C5_d1 + C5_d2) / 2;
C5_r2 = (C5_d2 + C5_d3) / 2;
C5_r3 = (C5_d3 + C5_d4) / 2;

C5_dequant_uniform = C5_quant_uniform;
for r = 1:C5_row
    for c = 1:C5_col
        for i = 1:5
            f = C5_quant_uniform{r, c}(1, i);
            if f == 0
                C5_dequant_uniform{r, c}(1, i) = C5_r0;
            elseif f == 1
                C5_dequant_uniform{r, c}(1, i) = C5_r1;
            elseif f == 2
                C5_dequant_uniform{r, c}(1, i) = C5_r2;
            else
                C5_dequant_uniform{r, c}(1, i) = C5_r3;
            end
        end
    end
end

C5_DC_dequantized_uniform = C;
for r = 1:C_row
    for c = 1:C_col
        C5_DC_dequantized_uniform{r, c}(1, 2) = C5_dequant_uniform{r, c}(1, 1);
        C5_DC_dequantized_uniform{r, c}(2, 1) = C5_dequant_uniform{r, c}(1, 2);
        C5_DC_dequantized_uniform{r, c}(3, 1) = C5_dequant_uniform{r, c}(1, 3);
        C5_DC_dequantized_uniform{r, c}(2, 2) = C5_dequant_uniform{r, c}(1, 4);
        C5_DC_dequantized_uniform{r, c}(1, 3) = C5_dequant_uniform{r, c}(1, 5);
    end
end

i = 1;
for r = 1:C_row
    for c = 1:C_col
        C5_DC_dequantized_uniform{r, c}(1, 1) = DC_dequant_uniform(i);
        i = i + 1;
    end
end

dG_C5_dequantized = cell2mat(C5_DC_dequantized_uniform);
G6_dequantized = blockproc(dG_C5_dequantized, [8 8], @(blkStruct) idct2(blkStruct.data));

imagesc(G6_dequantized);
colormap(gray);

snr_G6 = snr(im2double(G), im2double(double(G) - G6_dequantized));
disp(snr_G6);


% d

for r = 1:C_row
    for c = 1:C_col
        for i = 1:8
            for j = 1:8
                if ~(((i == 1) && (j == 1 || j == 2) || ((i == 2) && (j  == 1))))
                    C{r, c}(i, j) = 0;
                end
            end
        end
    end
end

C2 = {};
for r = 1:C_row
    for c = 1:C_col
        C2{r, c}(1, 1) = C{r, c}(1, 2);
        C2{r, c}(1, 2) = C{r, c}(2, 1);
    end
end

C2_max = 0;
C2_min = 100000;
[C2_row, C2_col] = size(C2);
for r = 1:C2_row
    for c = 1:C2_col
        for i = 1:2
            if C2{r, c}(1, i) > C2_max
                C2_max = C2{r, c}(1, i);
            end
            if C2{r, c}(1, i) < C2_min
                C2_min = C2{r, c}(1, i);
            end
        end
    end
end

disp(C2_min);
disp(C2_max);
C2_range = ceil(C2_max + 0.000001)  - floor(C2_min);
disp(C2_range);
C2_interval = C2_range/4;
disp(C2_interval);

C2_d0 = floor(C2_min);
C2_d1 = floor(C2_min) + 1 * C2_interval;
C2_d2 = floor(C2_min) + 2 * C2_interval;
C2_d3 = floor(C2_min) + 3 * C2_interval;
C2_d4 = floor(C2_min) + 4 * C2_interval;

C2_quant_uniform = C2;
for r = 1:C2_row
    for c = 1:C2_col
        for i = 1:2
            f = C2{r, c}(1, i);
            if f < C2_d1
                C2_quant_uniform{r, c}(1, i) = 0;
            elseif f < C2_d2
                C2_quant_uniform{r, c}(1, i) = 1;
            elseif f < C2_d3
                C2_quant_uniform{r, c}(1, i) = 2;
            else
                C2_quant_uniform{r, c}(1, i) = 3;
            end
        end
    end
end

C2_bit = C_row * C_col * 2 * 2;
C2_compressed_size = DC_bit + C2_bit;

C2_bitrate = C2_compressed_size / (dG_row * dG_col);
disp(C2_bitrate);
C2_compression_ratio = dG_bit / C2_compressed_size;
disp(C2_compression_ratio);

C2_r0 = (C2_d0 + C2_d1) / 2;
C2_r1 = (C2_d1 + C2_d2) / 2;
C2_r2 = (C2_d2 + C2_d3) / 2;
C2_r3 = (C2_d3 + C2_d4) / 2;

C2_dequant_uniform = C2_quant_uniform;
for r = 1:C2_row
    for c = 1:C2_col
        for i = 1:2
            f = C2_quant_uniform{r, c}(1, i);
            if f == 0
                C2_dequant_uniform{r, c}(1, i) = C2_r0;
            elseif f == 1
                C2_dequant_uniform{r, c}(1, i) = C2_r1;
            elseif f == 2
                C2_dequant_uniform{r, c}(1, i) = C2_r2;
            else
                C2_dequant_uniform{r, c}(1, i) = C2_r3;
            end
        end
    end
end

C2_DC_dequantized_uniform = C;
for r = 1:C_row
    for c = 1:C_col
        C2_DC_dequantized_uniform{r, c}(1, 2) = C2_dequant_uniform{r, c}(1, 1);
        C2_DC_dequantized_uniform{r, c}(2, 1) = C2_dequant_uniform{r, c}(1, 2);
    end
end

i = 1;
for r = 1:C_row
    for c = 1:C_col
        C2_DC_dequantized_uniform{r, c}(1, 1) = DC_dequant_uniform(i);
        i = i + 1;
    end
end

dG_C2_dequantized = cell2mat(C2_DC_dequantized_uniform);
G3_dequantized = blockproc(dG_C2_dequantized, [8 8], @(blkStruct) idct2(blkStruct.data));

imagesc(G3_dequantized);
colormap(gray);

snr_G3 = snr(im2double(G), im2double(double(G) - G3_dequantized));
disp(snr_G3);


% e

for r = 1:C_row
    for c = 1:C_col
        for i = 1:8
            for j = 1:8
                if ~(i == 1 && j == 1)
                    C{r, c}(i, j) = 0;
                end
            end
        end
    end
end

C0_compressed_size = DC_bit;

C0_bitrate = C0_compressed_size / (dG_row * dG_col);
disp(C0_bitrate);
C0_compression_ratio = dG_bit / C0_compressed_size;
disp(C0_compression_ratio);

C0_DC_dequantized_uniform = C;
i = 1;
for r = 1:C_row
    for c = 1:C_col
        C0_DC_dequantized_uniform{r, c}(1, 1) = DC_dequant_uniform(i);
        i = i + 1;
    end
end

dG_C0_dequantized = cell2mat(C0_DC_dequantized_uniform);
G1_dequantized = blockproc(dG_C0_dequantized, [8 8], @(blkStruct) idct2(blkStruct.data));

imagesc(G1_dequantized);
colormap(gray);

snr_G1 = snr(im2double(G), im2double(double(G) - G1_dequantized));
disp(snr_G1);

% END