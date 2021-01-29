# QIIME2 data analysis

Author: Siobhon L Egan

>**Last updated** Jan 2021
**QIIME2 version** QIIME2-2020.11

Set of workflows for analysis of amplicon next-generation sequencing data in [QIIME2](https://qiime2.org/).

To view `.qza` and `.qzv` files go to [QIIME2 view](https://view.qiime2.org/)

## 1. Amplicon analysis


Comprehensive documenation for analysis for analysis of raw paired end reads using QIIME2 pipeline. Input is raw `.fastq.gz` files to produce denoised ASVs and taxonomy assignment. See [**2.Classifiers**](https://github.com/siobhon-egan/qiime2_analysis/blob/master/2.classifiers.md) for how to build classifer. This also contains instruction on installation, data formats and useful links.

## 2. Classifiers

This goes through steps to produce trained feature classifiers for 16S and 18S data using Greengenes and SILVA databases.

## 3. Import of data from USEARCH

Importation of OTUs/ZOTUs (or similar) and related data from the USEARCH pipeline. Use of the qiime2 feature classifier for taxonomy assignment as per [**2.Classifiers**](https://github.com/siobhon-egan/qiime2_analysis/blob/master/2.classifiers.md).


------------------------------


## Links

Just some space to leave links for useful information and tutorials I find.

- [QIIME2 Introductory Workshop by Robert W. Murdoch](https://rstudio-pubs-static.s3.amazonaws.com/489645_5fff8a6a02d84084a55e3b5b6ff960a4.html#)
- [Tutorial: Integrating QIIME2 and R for data visualization and analysis using qiime2R (v0.99.4)](https://github.com/jbisanz/qiime2R)
- [Phyloseq webpage](https://joey711.github.io/phyloseq/index.html)
- [Phyloseq tutorial](https://vaulot.github.io/tutorials/Phyloseq_tutorial.html#content)
- [Bioinformatics for metagenome data analysis by Nirmal Babu](http://14.139.189.27/ngsdat19/downloads/NGSDAT_2019_TRANING%20MANUAL.pdf)
- [QIIME2 workflow - determining Amplicon Sequence Variants by Sarah Hu](https://github.com/shu251/qiime2_ASVworkflow_v8/blob/master/README.md)
- [micca (MICrobial Community Analysis)](https://micca.readthedocs.io/en/latest/index.html)
- [Denoising Amplicon Sequence Variants Using DADA2, DeBlur, and UNOISE3 with QIIME2 by Nicholas Ollberding](https://www.nicholas-ollberding.com/post/denoising-amplicon-sequence-variants-using-dada2-deblur-and-unoise3-with-qiime2/)
- [Amplicon analysis with QIIME2 Adam Rivers](https://bioinformaticsworkbook.org/dataAnalysis/Metagenomics/Qiime2.html#gsc.tab=0)
- [Amplicon analysis with QIIME2 by Rachael Lappan](https://rachaellappan.github.io/VL-QIIME2-analysis/)
