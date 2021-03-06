Gem::Specification.new do |s|
  s.name        = "mutations_caller_pipeline"
  s.version     = "0.0.6"
  s.date        = "2012-01-20"
  s.authors     = ["Kaharina Hayer"]
  s.email       = ["katharinaehayer@gmail.com"]
  s.homepage    = "https://github.com/khayer/mutations_caller_pipeline"
  s.summary     = %q{Call Mutations for files.fq}
  s.description = %q{Using BWA to align and GATK to call the bases}

  s.rubyforge_project = "mutations_caller_pipeline"

  s.files         = `git ls-files -- {lib,bin}/*`.split("\n")
  #s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   << 'mutations_caller_pipeline'
  s.executables   << 'gatk_pipe_only'
  #s.require_paths =  ["lib"]
end
