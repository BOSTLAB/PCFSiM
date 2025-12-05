 # PCFSiM Tutorial

This tutorial provides a step-by-step guide on how to use the PCFSiM library for analyzing spatial point patterns in single-cell data. We have provided as Example data a [CosMx Human Frontal Cortex dataset](https://nanostring.com/products/cosmx-spatial-molecular-imager/ffpe-dataset/human-frontal-cortex-ffpe-dataset/).

## Step 1: Load Metadata

First, we need to load the metadata containing for each observation (here cells), information about the location on both axis and the label associated (here the cluster of each cell).

```R
Meta_data = read.csv('Example_data/Frontal_cortex_data.csv')
```

## Step 2: Create SCE Object

Next, we create a SingleCellExperiment (SCE) object using the loaded metadata. We specify the columns for cell centroids and clustering.

```R
sce = Create_sce_object(Meta_data,cell_centroid_x = "cell_centroid_x",cell_centroid_y = "cell_centroid_y",Clustering = "Clustering")
```

## Step 3: Compute Pair Correlation Function (PCF)

Now, we compute the pair correlation function (PCF) using the SCE object. We define a range of distances according to the size of the tissue and specify the computation method. 

```R
List_pcf = Compute_pcf(sce, r_vector = seq(0, 10000, length.out = 50), computation_method = "direct", verbose = TRUE)
```

## Step 4: Fit Models for a Specific Cluster

We can fit different models to the PCF data for a specific cluster. In this example, we will fit models for cluster `k = 3`.

```R
k = 3
x = List_pcf$List_r[[k]]
y = List_pcf$List_pcf[[k]]

# Fit exponential model
m_expo = try(Fit_exponential(x, y, show_plot = TRUE))

# Fit sigmoid model
m_sigmoid = try(Fit_sigmoid(x, y, show_plot = TRUE))
```

## Step 5: Retrieve Fitting Results for All Clusters

We can retrieve fitting results for all clusters using different parametric models.

```R
Results_sigmoid = Fit_parametric_pcf_model(List_pcf, model = "Sigmoid")
Results_gamma = Fit_parametric_pcf_model(List_pcf, model = "Gamma")
Results_exponential = Fit_parametric_pcf_model(List_pcf, model = "Exponential")
```

## Step 6: Compare Models with Boxplots

To compare the performance of the fitted models, we can create boxplots.

```R
Model_comparison_boxplot(list_results = list(Model_Sigmoid = Results_sigmoid,Model_Gamma = Results_gamma,Model_exponential = Results_exponential))
```

## Step 7: Plot Selected Cluster

Finally, we can visualize a specific cluster. In this example, we will plot cluster `2`.

```R
Plot_selected_cluster(Meta_data = Meta_data, selected_cluster = 2, title_show = "Cluster 2")
```

