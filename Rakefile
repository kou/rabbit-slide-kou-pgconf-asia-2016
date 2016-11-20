require "rabbit/task/slide"

# Edit ./config.yaml to customize meta data

spec = nil
Rabbit::Task::Slide.new do |task|
  spec = task.spec
  spec.files += Dir.glob("data/**/*.*")
  spec.files += Dir.glob("images/**/*.*")
  # spec.files -= Dir.glob("private/**/*.*")
  spec.add_runtime_dependency("rabbit-theme-groonga")
end

desc "Tag #{spec.version}"
task :tag do
  sh("git", "tag", "-a", spec.version.to_s, "-m", "Publish #{spec.version}")
  sh("git", "push", "--tags")
end

key_graphs = []
plots = Pathname.glob("data/**/*.gnuplot")
plots.each do |plot|
  output_base_dir = plot.dirname.to_s.gsub(/\Adata/, "images")
  loaded_plots = []
  graphs = []
  data = []

  plot.open do |plot_file|
    plot_file.each_line do |line|
      case line.chomp
      when /\Aload "(.*?)"\z/
        loaded_plots << "#{plot.dirname}/#{$1}"
      when /"(.*?\.tsv)"/
        data << "#{plot.dirname}/#{$1}"
      when /\Aset output "(.*?)"\z/
        graphs << "#{output_base_dir}/#{$1}"
      end
    end
  end

  key_graph = graphs.first
  key_graphs << key_graph
  file key_graph => [plot.to_s, *loaded_plots, *data] do
    cd(plot.dirname) do
      sh("gnuplot", plot.basename.to_s)
    end
    graphs.each do |graph|
      mkdir_p(File.dirname(graph))
      mv("#{plot.dirname}/#{File.basename(graph)}",
         graph)
    end
  end
end

desc "Generate graphs"
task :graph => key_graphs

task :run => :graph
task :pdf => :graph
