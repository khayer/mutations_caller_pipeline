class BwaCaller
  def self.call_single_end(r1,out_file,index, log_file, bwa, samtools)
    system('bash','-c',"#{bwa} samse -r '@RG\tID:foo\tSM:bar\tPL:Illumina' #{index} \
        <(#{bwa} aln #{index} #{r1} 2>>#{log_file})  \
        #{r1} 2>>#{log_file} | #{samtools} view -Su - 2>>#{log_file} | #{samtools} sort - #{out_file} 2>>#{log_file}")
  end

  def self.call_paired_end(r1, r2, out_file, index, log_file, bwa, samtools)
    system('bash','-c',"#{bwa} sampe -r '@RG\tID:foo\tSM:bar\tPL:Illumina' #{index} \
        <(#{bwa} aln #{index} #{r1} 2>>#{log_file} || exit 1) <(#{bwa} aln #{index} #{r2} 2>>#{log_file} ) \
        #{r1} #{r2} 2>>#{log_file} | #{samtools} view -Su - 2>>#{log_file} | #{samtools} sort - #{out_file} 2>>#{log_file}")
  end
end