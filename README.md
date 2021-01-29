# QIIME2 data analysis

Author: Siobhon L Egan
<siobhonegan@hotmail.com>

**Last updated** Jan 2021
**QIIME2 version** QIIME2-2020.11

Set of workflows for analysis of amplicon next-generation sequencing data in [QIIME2](https://qiime2.org/).

To view `.qza` and `.qzv` files go to [QIIME2 view](https://view.qiime2.org/)

## 1. Amplicon analysis

Pipeline for analysis for analysis of raw paired end reads. Input is raw `.fastq.gz` files to produce denoised ASVs and taxonomy assignment. See `2.Classifiers` for how to build classifer.

## 2. Classifiers

This goes through steps to produce trained feature classifiers for 16S and 18S data using Greengenes and SILVA databases.

## 3. Import of data from USEARCH

Importation of OTUs/ZOTUs (or similar) and related data from the USEARCH pipeline. Use of the qiime2 feature classifier for taxonomy assignment
