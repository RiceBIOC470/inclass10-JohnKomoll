%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points

%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.

struct_ex = load('example_dat.mat');
gene_data = struct_ex.dat;
[coeff, sc, eig] = pca(gene_data);
% coeff is transformation matrix
% sc is the transformed data

%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data? 

dims = sum(eig > 0.1);
disp(' ')
fprintf('The data is explained by %d dimensions. \n', dims)
disp(' ')

%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 

% Perform kmeans clustering
k_ids = kmeans(gene_data, 3);

% Iterate through each gene
for point = 1:length(k_ids)
    
    % Plot raw coordinates with color depending on cluster
    if k_ids(point) == 1
        plot(gene_data(point,2), gene_data(point,1), 'or')
        hold on
        
    elseif k_ids(point) == 2
        plot(gene_data(point,2), gene_data(point,1), 'og')
        hold on
        
    elseif k_ids(point) == 3
        plot(gene_data(point,2), gene_data(point,1), 'ob')
        hold on
        
    end
    
end
title('Raw Data - Point-To-Point Comparison (3 Clusters)')
xlabel('Second Coordinate')
ylabel('First Coordinate')

% Start a new figure and again iterate through each gene
figure
for point = 1:length(k_ids)
    
    % Plot principle component coordinates with color depending on cluster
    if k_ids(point) == 1
        plot(sc(point,2), sc(point,1), 'or')
        hold on
        
    elseif k_ids(point) == 2
        plot(sc(point,2), sc(point,1), 'og')
        hold on
        
    elseif k_ids(point) == 3
        plot(sc(point,2), sc(point,1), 'ob')
        hold on
        
    end
    
end
title('Principle Components - Point-To-Point Comparison (3 Clusters')
xlabel('Second Coordinate')
ylabel('First Coordinate')

% Principle components clearly organize the data into three sensible,
% uniformly shaped clusters.

%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?

k_ids2 = kmeans(gene_data, 7);

% Iterate through each gene
figure
for point = 1:length(k_ids2)
    
    % Plot raw coordinates with color depending on cluster
    if k_ids2(point) == 1
        plot(gene_data(point,2), gene_data(point,1), 'or')
        hold on
        
    elseif k_ids2(point) == 2
        plot(gene_data(point,2), gene_data(point,1), 'og')
        hold on
        
    elseif k_ids2(point) == 3
        plot(gene_data(point,2), gene_data(point,1), 'ob')
        hold on
        
    elseif k_ids2(point) == 4
        plot(gene_data(point,2), gene_data(point,1), 'ok')
        hold on
        
    elseif k_ids2(point) == 5
        plot(gene_data(point,2), gene_data(point,1), 'oy')
        hold on

    elseif k_ids2(point) == 6
        plot(gene_data(point,2), gene_data(point,1), 'oc')
        hold on

    elseif k_ids2(point) == 7
        plot(gene_data(point,2), gene_data(point,1), 'om')
        hold on
        
    end
    
end
title('Raw Data - Point-To-Point Comparison (7 Clusters)')
xlabel('Second Coordinate')
ylabel('First Coordinate')

% Start a new figure and again iterate through each gene
figure
for point = 1:length(k_ids)
    
    % Plot principle component coordinates with color depending on cluster
    if k_ids2(point) == 1
        plot(sc(point,2), sc(point,1), 'or')
        hold on
        
    elseif k_ids2(point) == 2
        plot(sc(point,2), sc(point,1), 'og')
        hold on
        
    elseif k_ids2(point) == 3
        plot(sc(point,2), sc(point,1), 'ob')
        hold on
        
    elseif k_ids2(point) == 4
        plot(sc(point,2), sc(point,1), 'ok')
        hold on
        
    elseif k_ids2(point) == 5
        plot(sc(point,2), sc(point,1), 'oy')
        hold on

    elseif k_ids2(point) == 6
        plot(sc(point,2), sc(point,1), 'oc')
        hold on

    elseif k_ids2(point) == 7
        plot(sc(point,2), sc(point,1), 'om')
        hold on
        
    end
    
end
title('Principle Components - Point-To-Point Comparison (7 Clusters)')
xlabel('Second Coordinate')
ylabel('First Coordinate')

% 3 is the more appropriate number of clusters. The color coded plots of
% principle components show that 3 clusters better groups the data into the
% main expression groups obvious to the naked eye in the plots. Using 7
% clusters subdivides the data into too many groups of gene expression
% patters, and creates insignificant distinctions within groups that should
% remain undivided.

