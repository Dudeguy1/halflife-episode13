/obj/machinery/computer/shuttle/ferry
	name = "overwatch transport train console"
	desc = "A console that controls the Overwatch transport train."
	circuit = /obj/item/circuitboard/computer/ferry
	shuttleId = "ferry"
	possible_destinations = "ferry_home;ferry_away"
	req_access = list(ACCESS_CENT_GENERAL)
	var/allow_silicons = FALSE
	var/allow_emag = FALSE

/obj/machinery/computer/shuttle/ferry/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(!allow_emag)
		balloon_alert(user, "firewall too powerful!")
		return FALSE
	return ..()

/obj/machinery/computer/shuttle/ferry/attack_ai()
	return allow_silicons ? ..() : FALSE

/obj/machinery/computer/shuttle/ferry/attack_robot()
	return allow_silicons ? ..() : FALSE

/obj/machinery/computer/shuttle/ferry/request
	name = "overwatch transport train console"
	circuit = /obj/item/circuitboard/computer/ferry/request
	possible_destinations = "ferry_home;ferry_away"
	req_access = list(ACCESS_CENT_GENERAL)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
