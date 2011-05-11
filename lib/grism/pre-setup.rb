# Copyright (C) 2004-2005 Masao Mutoh, Laurent Sansonetti 

edit_warning = <<EOS
# This file is automatically generated by the installer.
# Do not edit by hands.
EOS

File.open('config.rb', 'w') do |file|
    file.print <<EOS
#{edit_warning}

module GRISM
    FPATH = '#{config('data-dir')}/grism'
end
EOS
end

File.open('version.rb', 'w') do |file|
    begin
        version = IO.readlines('../../VERSION').join.chomp
    rescue Errno::ENOENT
        version = "CVS"
    end
    file.print <<EOS
#{edit_warning}

module GRISM
    $VERSION = "#{version}"
end
EOS
end
