class GatkCaller
  # INDEX is normal genom.fa
  def self.call(log_dir, gatk, index_fa, read_bam, read_vcf)
    cmd = "echo 'starting GATK for mutant at ' `date` >> #{log_dir}
      java -Xmx4g -jar  #{gatk} -l INFO -R #{index_fa} -T UnifiedGenotyper \
      -I #{read_bam} \
      -o #{read_vcf} \
      --genotype_likelihoods_model BOTH \
      >> #{log_dir} 2>&1 || exit 1"
    puts cmd
    system(cmd)
  end

  def self.recalibrate_bam(log_dir ,gatk, index_fa, index_vcf, read_bam, recal_file )
    cmd = "echo 'starting GATK for mutant at ' `date` >> #{log_dir}
      java -Xmx4g -jar #{gatk} -knownSites #{index_vcf} -I #{read_bam} \
      -R #{index_fa} -T CountCovariates \
      -cov ReadGroupCovariate -cov QualityScoreCovariate -cov DinucCovariate \
      -cov CycleCovariate \
      -recalFile #{recal_file} >> #{log_dir} 2>&1 || exit 1 "
    puts cmd
    system(cmd)
  end

  def self.table_calibration(log_dir, gatk, index_fa, read_bam, recal_bam, recal_file)
    cmd = "java -Xmx4g -jar #{gatk} \
      -R #{index_fa} \
      -I #{read_bam} \
      -T TableRecalibration \
      -o #{recal_bam} \
      -recalFile #{recal_file} >> #{log_dir} 2>&1 || exit 1"
    puts cmd
    system(cmd)
  end

  def self.prepare_realigne(log_dir, gatk, read_bam, index_fa, target_intervals)
    cmd = "java -Xmx2g -jar #{gatk} \
      -I #{read_bam} \
      -R #{index_fa} \
      -T RealignerTargetCreator \
      -o #{target_intervals}"
    puts cmd
    system(cmd)
  end

  def self.realigne(log_dir, gatk, read_bam, index_fa, target_intervals, realigned_bam)
    cmd = "java -Xmx4g -jar #{gatk} \
      -I #{read_bam} \
      -R #{index_fa} \
      -T IndelRealigner \
      -targetIntervals #{target_intervals} \
      -o #{realigned_bam} >> #{log_dir} 2>&1 || exit 1"
    puts cmd
    system(cmd)
  end

end