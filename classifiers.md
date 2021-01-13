# QIIME2 Taxonomy classifier

Author: Siobhon L Egan
<siobhonegan@hotmail.com>

**Last updated** Jan 2021
**QIIME2 version** QIIME2-2020.11

Instructions for making feature classifiers using QIIME2.

- [Link to feature classifier tutoiral](https://docs.qiime2.org/2020.6/tutorials/feature-classifier/)
- [Link to data resources & inforamtion](https://docs.qiime2.org/2020.6/data-resources/)


## Overview of classifiers made

Trained classifiers have been done for the follow:

- Green genes [13_8 release](ftp://greengenes.microbio.me/greengenes_release/gg_13_5/gg_13_8_otus.tar.gz)
	- 16S rRNA V1-2 - primers 27F-Y and 338R
  		- 27F-Y `AGAGTTTGATCCTGGCTYAG` (Ref: Gofton et al. 2015, DOI: 10.1186/s13071-015-0958-3)
  		- 338R `TGCTGCCTCCCGTAGGAGT` (Ref: Turner et al. 1999, DOI: 10.1111/j.1550-7408.1999.tb04612.x)
	- 16S rRNA V4 - primers 515F and 806R
			- 515F `GTGBCAGCMGCCGCGGTAA` (Caporaso et al. 2011, DOI: 10.1073/pnas.1000080107)
			- 806R `GGACTACHVGGGTWTCTAAT` (Caporaso et al. 2011, DOI: 10.1073/pnas.1000080107)
	- 16S rRNA V3-4 - primers 338F and 806R
			- 338F `ACTCCTACGGGAGGCAGCAG` (Lopez et al. 2003, DOI: 10.1128/AEM.69.11.6801-6807.2003)
			- 806R `GGACTACHVGGGTWTCTAAT ` (Caporaso et al. 2011, DOI: 10.1073/pnas.1000080107)

- Silva [132 release](https://www.arb-silva.de/fileadmin/silva_databases/qiime/Silva_132_release.zip)
	- 16S rRNA V1-2 - primers 27F-Y and 338R
  		- 27F-Y `AGAGTTTGATCCTGGCTYAG` (Ref: Gofton et al. 2015, DOI: 10.1186/s13071-015-0958-3)
  		- 338R `TGCTGCCTCCCGTAGGAGT` (Ref: Turner et al. 1999, DOI: 10.1111/j.1550-7408.1999.tb04612.x)
	- 16S rRNA V4 - primers 515F and 806R
			- 515F `GTGBCAGCMGCCGCGGTAA` (Caporaso et al. 2011, DOI: 10.1073/pnas.1000080107)
			- 806R `GGACTACHVGGGTWTCTAAT` (Caporaso et al. 2011, DOI: 10.1073/pnas.1000080107)
	- 16S rRNA V3-4 - primers 338F and 806R
			- 338F `ACTCCTACGGGAGGCAGCAG` (Lopez et al. 2003, DOI: 10.1128/AEM.69.11.6801-6807.2003)
			- 806R `GGACTACHVGGGTWTCTAAT ` (Caporaso et al. 2011, DOI: 10.1073/pnas.1000080107)

## 1. Extract required files

**Greengenes**

Download the latest Greengenes release, [currently 13_8 release](ftp://greengenes.microbio.me/greengenes_release/gg_13_5/gg_13_8_otus.tar.gz)

Once you unzip the file `gg_13_8_otus` it should contain the following:
```
otus/
rep_set/
rep_set_aligned/
taxonomy/
trees/
notes
```

Files you will need for this tutorial are

- `rep_set/99_otus.fasta`
- `taxonomy/99_otu_taxonomy`

**SILVA**

Download the latest Silva release, [currently 132](https://www.arb-silva.de/fileadmin/silva_databases/qiime/Silva_132_release.zip).

Once you unzip the file `SILVA_132_QIIME_release` it should contain the following:
```
core_alignment/
raw_data/
rep_set/
rep_set_aligned/
taxonomy/
Silva_132_notes.txt
```

Files you will need for this tutorial are

- `rep_set/rep_set_16S_only/99/silva_132_99_16S.fna`
- `taxonomy/16S_only/99/consensus_taxonomy_7_levels.txt`


***

## 3. Activate QIIME2 environment

**Activate session**

```
conda activate qiime2-2020.11
```

## 4. Greengenes classifier

**4.1. Make QIIME2 artifacts**
```
qiime tools import \
  --type 'FeatureData[Sequence]' \
  --input-path 99_otus.fasta \
  --output-path 99_otus_16S.qza

	qiime tools import \
	  --type 'FeatureData[Taxonomy]' \
	  --input-format HeaderlessTSVTaxonomyFormat \
	  --input-path 99_otu_taxonomy.txt \
	  --output-path ref-taxonomy.qza
```

**4.2. Extract reference sequences**

*A. For 16S rRNA v1-2 and v4 amplicons*
```
qiime feature-classifier extract-reads \
  --i-sequences 99_otus_16S.qza \
  --p-f-primer {SEQUENCE} \
  --p-r-primer {SEQUENCE} \
  --p-trunc-len 120 \
  --p-min-length 100 \
  --p-max-length 400 \
  --o-reads ref-seqs.qza
```

Output artifacts: `ref-seqs.qza`

*B. For 16S rRNA v3-4 amplicons*
```
qiime feature-classifier extract-reads \
  --i-sequences 99_otus_16S.qza \
	--p-f-primer ACTCCTACGGGAGGCAGCAG \
  --p-r-primer GGACTACHVGGGTWTCTAAT \
  --p-min-length 100 \
  --p-max-length 500 \
  --o-reads ref-seqs.qza
```

Output artifacts: `ref-seqs.qza`

**4.3. Train the classifier**

```
qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads ref-seqs.qza \
  --i-reference-taxonomy ref-taxonomy.qza \
  --o-classifier classifier.qza
```
Output artifacts: `classifier.qza`

## 5. Silva classifier

**5.1. Make QIIME2 artifacts**
```
qiime tools import \
  --type 'FeatureData[Sequence]' \
  --input-path silva_132_99_16S.fna \
  --output-path 99_otus_16S.qza

	qiime tools import \
	  --type 'FeatureData[Taxonomy]' \
	  --input-format HeaderlessTSVTaxonomyFormat \
	  --input-path consensus_taxonomy_7_levels.txt \
	  --output-path ref-taxonomy.qza
```

**5.2. Extract reference sequences**

*A. For 16S rRNA v1-2 and v4 amplicons*
```
qiime feature-classifier extract-reads \
  --i-sequences 99_otus_16S.qza \
  --p-f-primer {SEQUENCE} \
  --p-r-primer {SEQUENCE} \
  --p-trunc-len 120 \
  --p-min-length 100 \
  --p-max-length 400 \
  --o-reads ref-seqs.qza
```

Output artifacts: `ref-seqs.qza`

*B. For 16S rRNA v3-4 amplicons*
```
qiime feature-classifier extract-reads \
  --i-sequences 99_otus_16S.qza \
  --p-f-primer ACTCCTACGGGAGGCAGCAG \
  --p-r-primer GGACTACHVGGGTWTCTAAT \
  --p-min-length 100 \
  --p-max-length 500 \
  --o-reads ref-seqs.qza
```

Output artifacts: `ref-seqs.qza`

**5.3. Train the classifier**

```
qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads ref-seqs.qza \
  --i-reference-taxonomy ref-taxonomy.qza \
  --o-classifier classifier.qza
```
Output artifacts: `classifier.qza`
