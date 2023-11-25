function fish_user_key_bindings
  fish_default_key_bindings -M insert
  fish_vi_key_bindings --no-erase insert
  bind \cfg fzf_ghq
  bind \cfh fzf_history
  bind \cfz fzf_z
  bind \cff fzf_file
end
