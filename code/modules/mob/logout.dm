/mob/Logout()
	SEND_SIGNAL(src, COMSIG_MOB_LOGOUT)
	log_message("[key_name(src)] is no longer owning mob [src]([src.type])", LOG_OWNERSHIP)
	SStgui.on_logout(src)
	remove_from_player_list()
	update_ambience_area(null) // Unset ambience vars so it plays again on login
	//hl13 edit - vapour
	if(client)
		client.images.Remove(vapour_alpha_mask)
	vapour_alpha_mask = null
	//hl13 EDIT - Vapour
	..()

	if(loc)
		loc.on_log(FALSE)

	become_uncliented()

	return TRUE
