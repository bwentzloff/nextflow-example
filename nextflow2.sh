#!/usr/bin/env nextflow

params.in = "$baseDir/sample/GCA_029775495.1_ASM2977549v1_genomic.fna"

/*
 * Index a reference file
 */
process indexReference {
    debug true
    input:
    path 'reference/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna'

    output:
    path 'reference/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic*'

    """
    #echo 'hello'
    bwa index reference/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna
    """
}

process sampleAlign {
    debug true
    input:
    path 'reference/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna'

    output:
    path 'output/aln.sam'

    """
    bwa mem reference/GCF_000001215.4_Release_6_plus_ISO1_MT_genomic.fna sample/GCA_029775495.1_ASM2977549v1_genomic.fna > output/aln.sam
    """
}

/*
 * Define the workflow
 */
workflow {
    indexReference(params.in) | sampleAlign
}