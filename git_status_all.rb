def git_status_all(dir)
  all_entries = dir.entries
  only_dirs = all_entries.select do |entry|
    File.directory?(File.join(dir.path, entry)) &&
                    !(entry == '.' || entry == '..')
  end
  only_dirs.each do |child_dir|
    puts child_dir
    system("git -C #{child_dir} status")
    puts
  end
end


git_status_all(Dir.new('.'))
