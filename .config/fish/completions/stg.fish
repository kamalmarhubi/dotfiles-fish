# These are cobbled together by looking at the supplied git.fish.
# TODO: add more commands.
# TODO: actually learn fish language (?) and fix control flow in functions

function __fish_stg_using_command
  set cmd (commandline --tokenize --current-process --cut-at-cursor)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_stg_patches
  stg series -a | cut -c 3-
end

function __fish_stg_needs_command
  set cmd (commandline --tokenize --current-process --cut-at-cursor)
  if [ (count $cmd) -eq 1 ]
    return 0
  end
  return 1
end


complete -f -c stg -n '__fish_stg_needs_command' -a "series uncommit push pop goto squash sink float rename show delete edit"
complete -f -c stg -n '__fish_stg_using_command goto' -a '(__fish_stg_patches)' --description 'Patch'
complete -f -c stg -n '__fish_stg_using_command sink' -a '(__fish_stg_patches)' --description 'Patch'
complete -f -c stg -n '__fish_stg_using_command squash' -a '(__fish_stg_patches)' --description 'Patch'
complete -f -c stg -n '__fish_stg_using_command rename' -a '(__fish_stg_patches)' --description 'Patch'
complete -f -c stg -n '__fish_stg_using_command float' -a '(__fish_stg_patches)' --description 'Patch'
complete -f -c stg -n '__fish_stg_using_command show' -a '(__fish_stg_patches)' --description 'Patch'
complete -f -c stg -n '__fish_stg_using_command edit' -a '(__fish_stg_patches)' --description 'Patch'
complete -f -c stg -n '__fish_stg_using_command delete' -a '(__fish_stg_patches)' --description 'Patch'
