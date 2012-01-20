class SamtoolsIndexing
  def self.call(bam_file)
    system("samtools index #{bam_file}")
  end
end