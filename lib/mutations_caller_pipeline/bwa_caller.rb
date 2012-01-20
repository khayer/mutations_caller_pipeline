class BwaCaller
  def self.call_single_end(r1,out_file,index)
    system('bash','-c',"bwa samse -r '@RG\tID:foo\tSM:bar\tPL:Illumina' #{index} \
        <(bwa aln #{index} #{r1}) \
        #{r1}  | samtools view -Su - | samtools sort - #{out_file}")
  end

  def self.call_paired_end(r1, r2, out_file, index)
    system('bash','-c',"bwa sampe -r '@RG\tID:foo\tSM:bar\tPL:Illumina' #{index} \
        <(bwa aln #{index} #{r1}) <(bwa aln #{index} #{r2}) \
        #{r1} #{r2} | samtools view -Su - | samtools sort - #{out_file}")
  end
end