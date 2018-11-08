  $ BAM=$TESTDIR/data/median.bam
  $ REF=$TESTDIR/data/ecoliK12_pbi_March2013.fasta

  $ samtools view ${BAM} | awk '{ print "@"$1"\n"$10"\n+\n"$11 }' > $CRAMTMP/median.fastq
  $ FASTQ=$CRAMTMP/median.fastq
  $ samtools view ${BAM} | awk '{ print ">"$1"\n"$10 }' > $CRAMTMP/median.fasta
  $ FASTA=$CRAMTMP/median.fasta

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsorted.bam 2>&1
  *Input is FASTA.* (glob)
  $ samtools view -H $CRAMTMP/fasta_unsorted.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsorted.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_unsorted.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_unsorted.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_sorted.bam --sort
  *Input is FASTA.* (glob)
  $ samtools view -H $CRAMTMP/fasta_sorted.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sorted.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_sorted.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_sorted.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsortedds.alignmentset.xml 2> $CRAMTMP/fasta_unsortedds.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fasta_unsortedds.err
  *Input is FASTA.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fasta_unsortedds.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedds.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedds.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedds.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_sortedds.alignmentset.xml --sort 2> $CRAMTMP/fasta_sortedds.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fasta_sortedds.err
  *Input is FASTA.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fasta_sortedds.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sortedds.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sortedds.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sortedds.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsortedjs.json
  *Input is FASTA.* (glob)
  ERROR: Unsupported input type (no-eol)
  [1]

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_sortedjs.json --sort
  *Input is FASTA.* (glob)
  ERROR: Unsupported input type (no-eol)
  [1]

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA > $CRAMTMP/fasta_unsortedoutstream.bam
  *Input is FASTA.* (glob)
  $ samtools view -H $CRAMTMP/fasta_unsortedoutstream.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedoutstream.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_unsortedoutstream.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_unsortedoutstream.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA > $CRAMTMP/fasta_sortedoutstream.bam --sort
  *Input is FASTA.* (glob)
  $ samtools view -H $CRAMTMP/fasta_sortedoutstream.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sortedoutstream.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_sortedoutstream.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_sortedoutstream.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsortedccs.consensusalignmentset.xml 2> $CRAMTMP/fasta_unsortedccs.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fasta_unsortedccs.err
  *Input is FASTA.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fasta_unsortedccs.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedccs.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedccs.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedccs.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsortedts.transcriptalignmentset.xml 2> $CRAMTMP/fasta_unsortedts.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fasta_unsortedts.err
  *Input is FASTA.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fasta_unsortedts.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedts.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedts.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedts.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/sorted_fasta_verbose.bam --sort -j 2 -J 2 -m 100M --log-level INFO 2>&1
  *Using 2 threads for alignments, 2 threads for sorting, and 200M bytes RAM for sorting. (glob)
  *Input is FASTA.* (glob)
  *READ input file: *median.fasta* (glob)
  *REF  input file: *ecoliK12_pbi_March2013.fasta* (glob)
  *Start reading/building index (glob)
  *Finished reading/building index (glob)
  *Merged sorted output from 0 files and 1 in-memory blocks (glob)
  *Mapped Reads: 52 (glob)
  *Alignments: 89 (glob)
  *Mapped Bases: 231213 (glob)
  *Mean Mapped Concordance: 91.5015% (glob)
  *Max Mapped Read Length* (glob)
  *Mean Mapped Read Length* (glob)
  *Index Build/Read Time: * (glob)
  *Alignment Time: * (glob)
  *Sort Merge Time: * (glob)
  *Run Time: * (glob)
  *CPU Time: * (glob)
  *Peak RSS: * (glob)

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsorted.bam 2>&1
  *Input is FASTQ.* (glob)
  $ samtools view -H $CRAMTMP/fastq_unsorted.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsorted.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_unsorted.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_unsorted.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_sorted.bam --sort
  *Input is FASTQ.* (glob)
  $ samtools view -H $CRAMTMP/fastq_sorted.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sorted.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_sorted.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_sorted.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsortedds.alignmentset.xml 2> $CRAMTMP/fastq_unsortedds.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fastq_unsortedds.err
  *Input is FASTQ.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fastq_unsortedds.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedds.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedds.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedds.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_sortedds.alignmentset.xml --sort 2> $CRAMTMP/fastq_sortedds.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fastq_sortedds.err
  *Input is FASTQ.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fastq_sortedds.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sortedds.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sortedds.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sortedds.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsortedjs.json
  *Input is FASTQ.* (glob)
  ERROR: Unsupported input type (no-eol)
  [1]

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_sortedjs.json --sort
  *Input is FASTQ.* (glob)
  ERROR: Unsupported input type (no-eol)
  [1]

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ > $CRAMTMP/fastq_unsortedoutstream.bam
  *Input is FASTQ.* (glob)
  $ samtools view -H $CRAMTMP/fastq_unsortedoutstream.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedoutstream.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_unsortedoutstream.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_unsortedoutstream.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ > $CRAMTMP/fastq_sortedoutstream.bam --sort
  *Input is FASTQ.* (glob)
  $ samtools view -H $CRAMTMP/fastq_sortedoutstream.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sortedoutstream.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_sortedoutstream.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_sortedoutstream.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsortedccs.consensusalignmentset.xml 2> $CRAMTMP/fastq_unsortedccs.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fastq_unsortedccs.err
  *Input is FASTQ.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fastq_unsortedccs.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedccs.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedccs.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedccs.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsortedts.transcriptalignmentset.xml 2> $CRAMTMP/fastq_unsortedts.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fastq_unsortedts.err
  *Input is FASTQ.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fastq_unsortedts.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedts.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedts.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedts.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/sorted_fastq_verbose.bam --sort -j 2 -J 2 -m 100M --log-level INFO 2>&1
  *Using 2 threads for alignments, 2 threads for sorting, and 200M bytes RAM for sorting. (glob)
  *Input is FASTQ.* (glob)
  *READ input file: *median.fastq* (glob)
  *REF  input file: *ecoliK12_pbi_March2013.fasta* (glob)
  *Start reading/building index (glob)
  *Finished reading/building index (glob)
  *Merged sorted output from 0 files and 1 in-memory blocks (glob)
  *Mapped Reads: 52 (glob)
  *Alignments: 89 (glob)
  *Mapped Bases: 231213 (glob)
  *Mean Mapped Concordance: 91.5015% (glob)
  *Max Mapped Read Length* (glob)
  *Mean Mapped Read Length* (glob)
  *Index Build/Read Time: * (glob)
  *Alignment Time: * (glob)
  *Sort Merge Time: * (glob)
  *Run Time: * (glob)
  *CPU Time: * (glob)
  *Peak RSS: * (glob)

  $ rm $CRAMTMP/*fasta* $CRAMTMP/*fastq*

  $ BAM=$TESTDIR/data/m54075_180905_225130.ccs.bam
  $ REF=$TESTDIR/data/ecoliK12_pbi_March2013.fasta

  $ samtools view ${BAM} | awk '{ print "@"$1"\n"$10"\n+\n"$11 }' > $CRAMTMP/m54075_180905_225130.fastq
  $ FASTQ=$CRAMTMP/m54075_180905_225130.fastq
  $ samtools view ${BAM} | awk '{ print ">"$1"\n"$10 }' > $CRAMTMP/m54075_180905_225130.fasta
  $ FASTA=$CRAMTMP/m54075_180905_225130.fasta

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsorted.bam 2>&1
  *Input is FASTA.* (glob)
  $ samtools view -H $CRAMTMP/fasta_unsorted.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsorted.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_unsorted.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_unsorted.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_sorted.bam --sort
  *Input is FASTA.* (glob)
  $ samtools view -H $CRAMTMP/fasta_sorted.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sorted.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_sorted.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_sorted.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsortedds.alignmentset.xml 2> $CRAMTMP/fasta_unsortedds.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fasta_unsortedds.err
  *Input is FASTA.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fasta_unsortedds.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedds.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedds.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedds.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_sortedds.alignmentset.xml --sort 2> $CRAMTMP/fasta_sortedds.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fasta_sortedds.err
  *Input is FASTA.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fasta_sortedds.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sortedds.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sortedds.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sortedds.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsortedjs.json
  *Input is FASTA.* (glob)
  ERROR: Unsupported input type (no-eol)
  [1]

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_sortedjs.json --sort
  *Input is FASTA.* (glob)
  ERROR: Unsupported input type (no-eol)
  [1]

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA > $CRAMTMP/fasta_unsortedoutstream.bam
  *Input is FASTA.* (glob)
  $ samtools view -H $CRAMTMP/fasta_unsortedoutstream.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedoutstream.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_unsortedoutstream.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_unsortedoutstream.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA > $CRAMTMP/fasta_sortedoutstream.bam --sort
  *Input is FASTA.* (glob)
  $ samtools view -H $CRAMTMP/fasta_sortedoutstream.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_sortedoutstream.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_sortedoutstream.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fasta_sortedoutstream.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsortedccs.consensusalignmentset.xml 2> $CRAMTMP/fasta_unsortedccs.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fasta_unsortedccs.err
  *Input is FASTA.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fasta_unsortedccs.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedccs.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedccs.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedccs.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/fasta_unsortedts.transcriptalignmentset.xml 2> $CRAMTMP/fasta_unsortedts.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fasta_unsortedts.err
  *Input is FASTA.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fasta_unsortedts.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedts.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedts.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fasta_unsortedts.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTA $CRAMTMP/sorted_fasta_verbose.bam --sort -j 2 -J 2 -m 100M --log-level INFO 2>&1
  *Using 2 threads for alignments, 2 threads for sorting, and 200M bytes RAM for sorting. (glob)
  *Input is FASTA.* (glob)
  *READ input file: *m54075_180905_225130.fasta* (glob)
  *REF  input file: *ecoliK12_pbi_March2013.fasta* (glob)
  *Start reading/building index (glob)
  *Finished reading/building index (glob)
  *Merged sorted output from 0 files and 1 in-memory blocks (glob)
  *Mapped Reads: 10 (glob)
  *Alignments: 10 (glob)
  *Mapped Bases: 15119 (glob)
  *Mean Mapped Concordance: 88.7123% (glob)
  *Max Mapped Read Length* (glob)
  *Mean Mapped Read Length* (glob)
  *Index Build/Read Time: * (glob)
  *Alignment Time: * (glob)
  *Sort Merge Time: * (glob)
  *Run Time: * (glob)
  *CPU Time: * (glob)
  *Peak RSS: * (glob)

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsorted.bam 2>&1
  *Input is FASTQ.* (glob)
  $ samtools view -H $CRAMTMP/fastq_unsorted.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsorted.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_unsorted.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_unsorted.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_sorted.bam --sort
  *Input is FASTQ.* (glob)
  $ samtools view -H $CRAMTMP/fastq_sorted.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sorted.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_sorted.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_sorted.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsortedds.alignmentset.xml 2> $CRAMTMP/fastq_unsortedds.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fastq_unsortedds.err
  *Input is FASTQ.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fastq_unsortedds.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedds.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedds.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedds.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_sortedds.alignmentset.xml --sort 2> $CRAMTMP/fastq_sortedds.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fastq_sortedds.err
  *Input is FASTQ.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fastq_sortedds.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sortedds.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sortedds.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sortedds.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsortedjs.json
  *Input is FASTQ.* (glob)
  ERROR: Unsupported input type (no-eol)
  [1]

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_sortedjs.json --sort
  *Input is FASTQ.* (glob)
  ERROR: Unsupported input type (no-eol)
  [1]

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ > $CRAMTMP/fastq_unsortedoutstream.bam
  *Input is FASTQ.* (glob)
  $ samtools view -H $CRAMTMP/fastq_unsortedoutstream.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedoutstream.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_unsortedoutstream.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_unsortedoutstream.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ > $CRAMTMP/fastq_sortedoutstream.bam --sort
  *Input is FASTQ.* (glob)
  $ samtools view -H $CRAMTMP/fastq_sortedoutstream.bam | grep "@HD" | grep "coordinate" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_sortedoutstream.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_sortedoutstream.*.xml 2> /dev/null | wc -l | tr -d ' '
  0
  $ ls -alh $CRAMTMP/fastq_sortedoutstream.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsortedccs.consensusalignmentset.xml 2> $CRAMTMP/fastq_unsortedccs.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fastq_unsortedccs.err
  *Input is FASTQ.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fastq_unsortedccs.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedccs.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedccs.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedccs.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/fastq_unsortedts.transcriptalignmentset.xml 2> $CRAMTMP/fastq_unsortedts.err || echo $?
  $ cut -f 8 -d '|' < $CRAMTMP/fastq_unsortedts.err
  *Input is FASTQ.* (glob)
  - Input is not a dataset, but output is. Please use dataset input for full SMRT Link compatibility!
  $ samtools view -H $CRAMTMP/fastq_unsortedts.bam | grep "@HD" | grep "unknown" | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedts.bam.pbi 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedts.*.xml 2> /dev/null | wc -l | tr -d ' '
  1
  $ ls -alh $CRAMTMP/fastq_unsortedts.json 2> /dev/null | wc -l | tr -d ' '
  0

  $ $__PBTEST_PBMM2_EXE align $REF $FASTQ $CRAMTMP/sorted_fastq_verbose.bam --sort -j 2 -J 2 -m 100M --log-level INFO 2>&1
  *Using 2 threads for alignments, 2 threads for sorting, and 200M bytes RAM for sorting. (glob)
  *Input is FASTQ.* (glob)
  *READ input file: *m54075_180905_225130.fastq* (glob)
  *REF  input file: *ecoliK12_pbi_March2013.fasta* (glob)
  *Start reading/building index (glob)
  *Finished reading/building index (glob)
  *Merged sorted output from 0 files and 1 in-memory blocks (glob)
  *Mapped Reads: 10 (glob)
  *Alignments: 10 (glob)
  *Mapped Bases: 15119 (glob)
  *Mean Mapped Concordance: 88.7123% (glob)
  *Max Mapped Read Length* (glob)
  *Mean Mapped Read Length* (glob)
  *Index Build/Read Time: * (glob)
  *Alignment Time: * (glob)
  *Sort Merge Time: * (glob)
  *Run Time: * (glob)
  *CPU Time: * (glob)
  *Peak RSS: * (glob)
