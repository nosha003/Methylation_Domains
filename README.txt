- distribution of methylation domains
    - proportion of genome with data (pie chart of prop mappable vs unmappable)
        - whole genome 
        - genes
        - TEs
        - intergenic
    - classify into 5 groups for each subset of mappable data (bargraph)
    
- run for B73v4 WGBS and SeqCap

- prop mappable
    - whole genome --> determine prop of all tiles with data
    - genes --> intersect bed file with gene annotation file --> pull out all bins that overlap (calculate prop of tiles)
    - TEs --> intersect bed file (with gene overlapping bins removed) with TE annotation file --> pull out bins that overlap (calculate prop of tiles)
    - intergenic --> all bins that have data and are not overlapping genes or TEs 
    
- classify
    - take each bed file of bins for subset
        - CHH > 15% methylation
        - CG and CHG > 40% methylation
        - CG > 40% methylation
        - all < 10% remaining_unmethylated
        - remaining_methylated 
