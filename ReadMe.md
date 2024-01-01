This is a project of simple Face-Recognition based on PCA, developed in `MATLAB`.

## Short Introduction to PCA

Principal Component Analysis (PCA) is a statistical technique used for dimensionality reduction and feature extraction in data analysis and machine learning. Its primary goal is to transform a high-dimensional dataset into a lower-dimensional space while retaining as much variance as possible.

Here's a brief overview of the key concepts in PCA:

1. **High-Dimensional Data:**
   - PCA is often applied to datasets with a large number of variables or features. These features could represent different measurements or characteristics of the data.

2. **Variance:**
   - PCA aims to capture the directions in the data where the variability is maximum. In other words, it identifies the principal components, which are linear combinations of the original features.

3. **Principal Components (PCs):**
   - These are the new axes in the transformed space. The first principal component explains the most variance, the second explains the second most, and so on. Each principal component is orthogonal to the others.

4. **Eigenvalues and Eigenvectors:**
   - PCA involves the computation of eigenvalues and eigenvectors from the covariance matrix of the original data. Eigenvectors represent the directions of maximum variance, and eigenvalues indicate the magnitude of the variance along those directions.

5. **Dimensionality Reduction:**
   - After computing the principal components, one can choose to retain only the top N components, effectively reducing the dimensionality of the dataset. This is particularly useful for visualizing and analyzing high-dimensional data.

6. **Data Reconstruction:**
   - While reducing dimensionality, PCA also allows for the reconstruction of the original data from the lower-dimensional representation. Although some information is lost during dimensionality reduction, the reconstruction can be useful for various applications.

7. **Applications:**
   - PCA is widely used in fields such as image processing, bioinformatics, finance, and pattern recognition. It is also a valuable tool for preprocessing data before applying machine learning algorithms, as it can improve algorithm performance and interpretability.

In summary, PCA is a powerful technique for transforming and summarizing high-dimensional data, helping to reveal the underlying patterns and relationships within the dataset.

## Structure

Let's have quick overview of this project.

```bash
.
├── att_faces # orginal dataset
│   ├── s1
│   ├── ...
│   ├── s40
│   │   ├── 1.pgm
│   │   ├── ...
│   │   └── 10.pgm
│   └── README
├── code
│   ├── train_data
│   │   ├── s1
│   │   ├── ...
│   │   └── s40
│   │       ├── 1.pgm
│   │       ├── ...
│   │       └── 5.pgm
│   ├── test_data
│   │   ├── s1
│   │   ├── ...
│   │   └── s40
│   │       ├── 1.pgm
│   │       ├── ...
│   │       └── 5.pgm
│   ├── model # PCA vectors and coefficients of eigenfaces of each class
│   │   ├── direct_model.mat
│   │   └── mean_model.mat
│   ├── main.m # enterance
│   ├── divide_data.m
│   ├── direct_train.m # directly use PCA
│   ├── mean_train.m # PCA with `mean` process
│   └── test.m
└── visualization
    ├── direct_eigenface (k=10).png
    ├── direct_eigenface (k=25).png
    ├── direct_eigenface (k=35).png
    ├── direct_eigenface (k=75).png
    ├── direct_eigen_vector (all-200).png
    ├── direct_eigen_vector (100).png
    ├── mean_eigenface (k=10).png
    ├── mean_eigenface (k=35).png
    └── mean_eigen_vector (all-40).png

```

## Reference

[Digital Image Process of SYSU Undergraduate](https://github.com/KONZEM/SYSU_Undergraduate/tree/main/%E6%95%B0%E5%AD%97%E5%9B%BE%E5%83%8F%E5%A4%84%E7%90%86%EF%BC%88%E5%80%AA%E6%B1%9F%E7%BE%A4%EF%BC%89)


