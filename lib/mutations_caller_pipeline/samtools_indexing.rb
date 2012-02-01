class SamtoolsIndexing
  def self.call(bam_file)
    cmd = "samtools index #{bam_file}"
    puts cmd
    system(cmd)
  end
end