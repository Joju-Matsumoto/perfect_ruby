require 'pathname'

module CheckModule
  refine Kernel do
    def check(instance, *method_names)
      method_names.each do |method_name|
        puts "#{method_name}: #{instance.send(method_name).inspect}"
      end
    end
  end
end

using CheckModule

p home = Pathname.new("~")

p foo = home.join("foo.txt")
p foo.dirname
p foo.basename
p foo.expand_path
p foo.expand_path.parent
p foo.expand_path.parent.parent

p foo.to_path
p foo.to_s

tmp = Pathname.new("/tmp")

p tmp.ftype
p tmp.file?
p tmp.directory?
p tmp.pipe?

check tmp, :atime, :ctime, :mtime
check tmp, :owned?, :executable?, :readable?, :writable?
check tmp, :ftype, :file?, :directory?, :pipe?, :socket?, :symlink?
check tmp, :size, :zero?
check tmp, :stat, :lstat
