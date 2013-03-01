desc 'Install vim configuration'
task :install do
  root = File.expand_path(File.dirname(__FILE__))

  puts 'Installing Bundles'
  system "vim -c BundleInstall! -c q -c q -u bundles.vim"

  puts '*' * 79
  puts
  puts 'All done!'
  puts 'Be sure to checkout the helpful links in the README'
  puts 'Issues/Wiki: https://github.com/episko/vim_files'
  puts
  puts '*' * 79

  puts 'Linking ~/vimrc to ~/vim/vimrc'
  system "ln -s ~/.vim/vimrc ~/.vimrc"
end

desc 'Update bundles'
task :update do
  system "git pull origin master"

  puts 'Updating Bundles'
  system "vim -c BundleInstall! -c BundleClean! -c q -c q"

  puts '*' * 79
  puts
  puts 'Finished'
  puts
  puts '*' * 79
end
