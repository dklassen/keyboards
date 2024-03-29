require 'fileutils'

USERNAME  = 'dklassen'
KEYBOARDS = {
  'ergodox_ez'  => [nil],
  'planck'      => ['rev6'],
  'keebio/iris'   => ['rev4'],
  'whitefox'    => [nil],
}

QMK_DIR   = "#{__dir__}/qmk_firmware"
USER_DIR  = "#{QMK_DIR}/users/#{USERNAME}"

def keymap_dir(keyboard)
  "#{QMK_DIR}/keyboards/#{keyboard}/keymaps/#{USERNAME}"
end

task default: :install

desc 'Symlink keymap files into QMK source tree'
task :install do
  next if File.symlink?(USER_DIR) || File.exist?(USER_DIR)

  FileUtils.ln_s(File.expand_path('user', __dir__), USER_DIR, verbose: true)
  KEYBOARDS.each_key do |keyboard|
    dest = keymap_dir(keyboard)

    next if File.symlink?(dest) || File.exist?(dest)

    FileUtils.ln_s(File.expand_path(keyboard, __dir__), dest, verbose: true)
  end
end

desc 'Remove symlinks from QMK source tree'
task :uninstall do
  FileUtils.rm_r USER_DIR, verbose: true, force: true

  KEYBOARDS.each_key do |keyboard|
    FileUtils.rm_r keymap_dir(keyboard), verbose: true, force: true
  end
end

desc 'Remove build artifacts'
task :clean do
  Dir.chdir(QMK_DIR) { sh 'make clean' }
end

namespace :qmk do
  desc 'Install QMK dependencies'
  task :install do
    Dir.chdir(QMK_DIR) { sh 'util/qmk_install.sh' }
  end

  desc 'Update QMK firmware'
  task :update do
    Dir.chdir(QMK_DIR) do
      sh 'git pull --ff-only'
      sh 'make git-submodule'
    end
  end
end
