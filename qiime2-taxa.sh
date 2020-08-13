#!/bin/bash

####################################

# Taxonomy on uparse OTUs

cd 8.cluster/8a.otus/

source activate qiime2-2018.11

biom convert -i uparse_otu_tab.txt -o table.from_txt_json.biom --table-type="OTU table" --to-json

qiime tools import \
--input-path table.from_txt_json.biom \
--type 'FeatureTable[Frequency]' \
--input-format BIOMV100Format \
--output-path feature-table-1.qza

qiime tools import \
--input-path uparse_otus.fasta \
--output-path sequences.qza \
--type 'FeatureData[Sequence]'

qiime feature-table summarize \
--i-table feature-table-1.qza \
--o-visualization table.qzv

qiime feature-table tabulate-seqs \
--i-data sequences.qza \
--o-visualization sequences.qzv

# silva taxonomy

mkdir qiime2-taxa-silva

qiime feature-classifier classify-sklearn \
--i-classifier ../classifier_silva16S_99otus_v4_515-806.qza \
--i-reads sequences.qza \
--o-classification qiime2-taxa-silva/SILVAtaxonomy.qza

qiime metadata tabulate \
--m-input-file qiime2-taxa-silva/SILVAtaxonomy.qza \
--o-visualization qiime2-taxa-silva/SILVAtaxonomy.qzv

# green genes taxonomy

mkdir qiime2-taxa-GG

qiime feature-classifier classify-sklearn \
--i-classifier ../classifier_GG16S_99otus_v4_515-806.qza \
--i-reads sequences.qza \
--o-classification qiime2-taxa-GG/taxonomy.qza

qiime metadata tabulate \
--m-input-file qiime2-taxa-GG/taxonomy.qza \
--o-visualization qiime2-taxa-GG/taxonomy.qzv

cd ..

###################################

# Taxonomy on ZOTUs

cd 8b.zotus/

biom convert -i unoise_otu_tab.txt -o table.from_txt_json.biom --table-type="OTU table" --to-json

qiime tools import \
--input-path table.from_txt_json.biom \
--type 'FeatureTable[Frequency]' \
--input-format BIOMV100Format \
--output-path feature-table-1.qza

qiime tools import \
--input-path unoise_zotus_relabeled.fasta \
--output-path sequences.qza \
--type 'FeatureData[Sequence]'

qiime feature-table summarize \
--i-table feature-table-1.qza \
--o-visualization table.qzv

qiime feature-table tabulate-seqs \
--i-data sequences.qza \
--o-visualization sequences.qzv

# silva taxonomy

mkdir qiime2-taxa-silva

qiime feature-classifier classify-sklearn \
--i-classifier ../classifier_silva16S_99otus_v4_515-806.qza \
--i-reads sequences.qza \
--o-classification qiime2-taxa-silva/taxonomy.qza

qiime metadata tabulate \
--m-input-file qiime2-taxa-silva/taxonomy.qza \
--o-visualization qiime2-taxa-silva/taxonomy.qzv

# green genes taxonomy

mkdir qiime2-taxa-GG

qiime feature-classifier classify-sklearn \
--i-classifier ../classifier_GG16S_99otus_v4_515-806.qza \
--i-reads sequences.qza \
--o-classification qiime2-taxa-GG/taxonomy.qza

qiime metadata tabulate \
--m-input-file qiime2-taxa-GG/taxonomy.qza \
--o-visualization qiime2-taxa-GG/taxonomy.qzv


cd ../../
