class GatkCaller
  def self.call(log_dir, gatk, index, read_bam, read_vcf)
    system(" echo 'starting GATK for mutant at ' `date` >> #{log_dir}
      java -jar  #{gatk} -l INFO -R #{index} -T UnifiedGenotyper \
      -I #{read_bam} \
      -o #{read_vcf} \
      --genotype_likelihoods_model BOTH \
      >> #{log_dir} || exit 1 " )
  end
end