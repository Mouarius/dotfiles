function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color yellow
      echo 'N '
    case insert
      set_color green
      echo 'I '
    case replace_one
      set_color red
      echo 'R '
    case visual
      set_color brmagenta
      echo 'V '
    case '*'
      set_color normal
      echo '? '
  end
  set_color normal
end
