function fish_prompt
	set exit_status $status

	if test "$exit_status" -eq 0
		set exit_status_color green
	else
		set exit_status_color red
	end

	set usr_bg_color blue
	set usr_tx_color brwhite

	set pwd_bg_color yellow
	set pwd_tx_color red

	set_color brblack
	echo -n "["(date "+%H:%M")"]"
	
	set_color $exit_status_color
	set_color -b black
	echo -ne \uE0B6

	set_color -b $exit_status_color
	set_color brwhite
	echo -ns $exit_status

	set_color $exit_status_color
	set_color -b $usr_bg_color
	echo -ne \uE0B4

	set_color $usr_tx_color
	echo -ns (whoami) "@" (prompt_hostname)

	set_color $usr_bg_color
	set_color -b $pwd_bg_color
	echo -ne \uE0B4

	set_color $pwd_tx_color
	set_color -b $pwd_bg_color
	echo -ns (prompt_pwd) 

	set_color $pwd_bg_color
	set_color -b black
	echo -ne \uE0B4

	set_color red
	echo -n '|'
	set_color normal
end
