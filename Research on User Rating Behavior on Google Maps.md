

# Abstract

This report studies European users' rating behaviors on Google Maps to analyze people's general preferences in places in the Travel cluster. Twenty-four categories in tourism are being analyzed to generate interest groups on one or more specific types of places. Using a modified K-mean Clustering Algorithm, we will try to extract all possible useful information from the data.

The evaluation will use variance to see how well they are being clustered; And pick important details for output.

This project explores rare aspects of rating relationship in different tourism sectors.  The results generated will allow stakeholders like the tourism board of a city/a country or a local restaurant union to analyze the performance related to other sectors.

+++

# Introduction

People travel to a lot of different places. With modern technology, we can now rate different places we visited via different platforms like TripAdvisor or Google Maps. Of course, different people have different views and preferences on the places they visited. However, it is infrequent to see people's general preference for different places and their relationship with different locations. For example, people who are interested in visiting parks are possibly not interested in visiting the museum. However, we usually do not have sufficient information to show their relationship between different tourism sectors. Do they have opinions on other places? 

Researches on such topics are not uncommon; one of the closest example is the recommended system used in travel-related platforms like TripAdvisor. However, it is rare for people to bring up the relationships between the datasets and the 

This data set is originally used for a project[1] to compare and evaluate different types to clustering algorithm, the data set is referrring to "Social Media Data in Tourism" which have little actual envolvment of my topic.

# Model

## Raw Data
The raw data is in the following format:

```
Attribute 1 : Unique user id 
Attribute 2 : Average ratings on churches 
Attribute 3 : Average ratings on resorts 
Attribute 4 : Average ratings on beaches 
Attribute 5 : Average ratings on parks 
Attribute 6 : Average ratings on theatres 
Attribute 7 : Average ratings on museums 
Attribute 8 : Average ratings on malls 
Attribute 9 : Average ratings on zoo 
Attribute 10 : Average ratings on restaurants 
Attribute 11 : Average ratings on pubs/bars 
Attribute 12 : Average ratings on local services 
Attribute 13 : Average ratings on burger/pizza shops 
Attribute 14 : Average ratings on hotels/other lodgings 
Attribute 15 : Average ratings on juice bars 
Attribute 16 : Average ratings on art galleries 
Attribute 17 : Average ratings on dance clubs 
Attribute 18 : Average ratings on swimming pools 
Attribute 19 : Average ratings on gyms 
Attribute 20 : Average ratings on bakeries 
Attribute 21 : Average ratings on beauty & spas 
Attribute 22 : Average ratings on cafes 
Attribute 23 : Average ratings on view points 
Attribute 24 : Average ratings on monuments 
Attribute 25 : Average ratings on gardens
```


Attrbute 1 is the unique ID and rest of the attributes are 
The Arribute 1 is the unique user id "User xxx"; the rest of the attributes are in `float64` format in a range of $0\le x<1$(no rating and ratings with no rating with comment, since there is no rating below 1 in Google Maps), and $1\le x \le 5$.

The processed data for Attribute 1  is coverted into number only for identify a certain user.

## K-Means Clustering

The algorithm we use as generally is called K-means Clustering, and more specifically, Sequential K-Means Clustering.

K-means clustering is one of the method to perform vector quantization. It aims to partition $n$ observations into $k$ clusters in which each pieces of information belongs to the cluster with the nearest mean (In our algorithm, it's cluster centroid), acting as a prototype of the cluster. The algorithm Sequential K-Means Clustering Went like following:

> - Make initial guesses for the means $m_1, m_2,\ldots, m_k$
> - Set the counts $n_1, n_2,\ldots, n_k$ to zero 
> - Until no sgnificant change
>     - Acquire the next example, $x$
>     - If $m_i$ is closest to $x$
>         - Increment $n_i$
>         - Replace $m_i$ by $m_i+ \frac 1 {n_i} ( x–m_i )$
>     - end if 
> - end until 


## PCA

PCA will be also used in the algorithm to use as a way to reduce the feature in order to visualize the output.

PCA, short for Principal Components Analysis, is an algorithm that allows you to transform the columns of a dataset into a new set of features(Principal Components). This allows compressing a large chunk of the information across the full dataset into fewer feature columns(In this case, 24 features reduced into 2). This enables dimensionality reduction and ability to visualize the separation of classes or clusters if any.



# Algorithm

The alorithm will be a modified version of K-means clustering algorithm, in order to "predict" without a set of samples. The model here we are introducing is called **Greedy K-means clustering**, targeting a multi-featured data set. It is achieved by greedily exploring all possible clusters selection of clusters (up to the count of all features) and selecting the most optimal one; the minimal amount of the clustering will be 3 since it is a clustering algorithm targeted at the multi-feature data set.

The general algorithm goes like the following:

> - for a amount of cluster $k \in \{3, f\}$ as f in number of features 
>     - Make initial guesses for the means $m_1, m_2,\ldots, m_k$
>     - Set the counts $n_1, n_2,\ldots, n_k$ to zero 
>     - Until no sgnificant change
>         - Acquire the next example, $x$
>         - If $m_i$ is closest to $x$
>             - Increment $n_i$
>             - Replace $m_i$ by $m_i+ \frac 1 {n_i} ( x–m_i )$
>         - end if 
>     - end until
>     - for each cluster $i \in \{1, k\}$ 
>         - generate mean $M_{i, c=k}$ and variance $\sigma^2_{i, c=k}$
> - end for
> - selecting best cluster set with optimal $\sigma^2$


# Evaluation


As from the data, we will be evaluating the value using the optimal variance $\hat{\sigma}^2$:

|   c |    $\hat{\sigma}^2$    |
|-----|----------|
|  25 | 0.69358  |
|  24 | 0.707861 |
|  23 | 0.724883 |
|  21 | 0.73339  |
|  22 | 0.735398 |
|  19 | 0.747117 |
|  20 | 0.748348 |
|  18 | 0.773284 |
|  17 | 0.788496 |
|  16 | 0.803223 |
|  15 | 0.826222 |
|  14 | 0.834439 |
|  13 | 0.851727 |
|  12 | 0.854033 |
|  11 | 0.892368 |
|  10 | 0.914183 |
|   9 | 0.931482 |
|   8 | 0.949316 |
|   7 | 0.975929 |
|   6 | 1.02136  |
|   5 | 1.09182  |
|   4 | 1.1588   |
|   3 | 1.2703   |

From the table shown, we can see that when $c=25$, it has the best performance overall.

An interesting to be noted is that in general, when there is more clusters ($c$), the optimal variance is lower, but it is not necessarily the case; for exmaple, $c=19$ have a better performance compared to $c=20$.


# Result

Full data generated will not be shown here due to that it's over 100 pages, but will be available in Appendix 1; we will use the one with the optimal variance to extract the useful data; the data can be referenced in the Appendix 1.

![fig.23 Greedy K-Mean Clustering Graph with c=25](./img/23.png)





# Conclusion

+++

# References

1: S. Renjith, A. Sreekumar and M. Jathavedan, "Evaluation of Partitioning Clustering Algorithms for Processing Social Media Data in Tourism Domain," 2018 IEEE Recent Advances in Intelligent Computational Systems (RAICS), Thiruvananthapuram, India, 2018, pp. 127-131, doi: 10.1109/RAICS.2018.8635080.

+++

# Appendix 1: Full Data Generated
