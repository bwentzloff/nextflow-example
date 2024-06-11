#!/bin/sh

bwa index reference/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna

bwa mem reference/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna sample/GCA_029775495.1_ASM2977549v1_genomic.fna > output/aln.sam