GLOBAL_VAR_INIT(number_of_freemen, 0)

/obj/machinery/vs_freeman_time_counter
	name = "time counter"
	desc = "it be countin' and stuff"
	icon = 'hl13/icons/obj/miscellaneous.dmi'
	icon_state = "stationclock"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

	var/grace_time = 15 SECONDS

	var/time_ticking = FALSE

	var/number_of_freemen = 1

	var/pick_retries = 0

	var/candidates_left = 0

	var/combine_players = 65 //freeman has to take out an entire sector to win we'll figure out if this is balanced later

	var/hunter_time = 5 MINUTES

	var/hunters_give = 1

/obj/machinery/vs_freeman_time_counter/Initialize(mapload)
	..()
	GLOB.deployment_flag_grace_period = 3 MINUTES //arbitrary, there just needs to be a grace period right now. It'll get changed later on to the correct one.
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/vs_freeman_time_counter/LateInitialize()
	while(!SSticker.HasRoundStarted())
		sleep(1 SECONDS)
	candidates_left = number_of_freemen
	sleep(12 SECONDS)
	to_chat(world, span_danger(span_slightly_larger(span_bold("Freeman will be selected in 10 Seconds."))))
	sleep(10 SECONDS)
	attempt_pick_freeman(number_of_freemen)

/obj/machinery/vs_freeman_time_counter/proc/start_countdown()
	to_chat(world, span_danger(span_slightly_larger(span_bold("The hunt for Freeman will begin in 15 Seconds."))))
	GLOB.deployment_flag_grace_period = grace_time
	START_PROCESSING(SSprocessing, src)

/obj/machinery/vs_freeman_time_counter/proc/attempt_pick_freeman()
	if(candidates_left == 0 || 99 < pick_retries)
		start_countdown()
		return

	pick_retries++
	var/chosen_candidate = null
	if(combine_players > 0)
		chosen_candidate = pick(GLOB.deployment_combine_players)
	var/client/candidate_client = chosen_candidate
	if(ishuman(candidate_client.mob))
		var/mob/living/carbon/human/human_user = candidate_client.mob

		if(human_user.deployment_faction == FREEMAN_DEPLOYMENT_FACTION)
			attempt_pick_freeman()
			return

		for(var/obj/item/item in human_user.get_all_gear())
			qdel(item)
		human_user.STASTR = 10
		human_user.STAINT = 10
		human_user.STADEX = 10
		for(var/datum/action/cooldown/buttons in human_user.actions)
			qdel(buttons)
		human_user.equipOutfit(/datum/outfit/deployment_loadout/freeman/the_freeman)
		human_user.regenerate_icons()
		to_chat(human_user, span_notice("You were chosen to be Freeman!"))
		candidates_left--

	if(candidates_left == 0 || 99 < pick_retries)
		start_countdown()
		return
	else
		attempt_pick_freeman()

/obj/machinery/vs_freeman_time_counter/process()
	if(GLOB.deployment_flag_grace_period < 1 SECONDS)
		if(!time_ticking)
			time_ticking = TRUE
			to_chat(world, span_danger(span_slightly_larger(span_bold("Grace period up, it's time to hunt down the Freeman."))))
			for(var/X in GLOB.deployment_hidden_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/hidden_start_round.ogg')
			for(var/X in GLOB.deployment_combine_players)
				var/mob/living/carbon/human/H = X
				SEND_SOUND(H, 'hl13/sound/effects/hidden_start_round.ogg')

		if(hunter_time < 1 SECONDS)
			to_chat(world, span_danger(span_slightly_larger(span_bold("Combine have received [hunters_given] hunter unit[hunters_given == 1 ? "" : "s"]."))))
			GLOB.freeman_tiers += hunters_given
			hunters_given++
			hunter_time = 5 MINUTES
		else
			hunter_time -= 1 SECONDS

		if(combine_players <= SSticker.tdm_combine_deaths && SSticker.IsRoundInProgress())
			priority_announce("All delegate biosignals lost. Mission failure detected.", "Overwatch Priority Alert")
			GLOB.deployment_win_team = FREEMAN_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("SUBJECT: FREEMAN. STATUS: HIRED. AWAITING ASSIGNMENT."))))
			STOP_PROCESSING(SSprocessing, src)

		if(GLOB.number_of_freemen < 1 && SSticker.IsRoundInProgress())
			priority_announce("Anticitizen One amputated. Mission complete.", "Overwatch Priority Alert")
			GLOB.deployment_win_team = COMBINE_DEPLOYMENT_FACTION
			SSticker.force_ending = FORCE_END_ROUND
			to_chat(world, span_infoplain(span_slightly_larger(span_bold("ASSIGNMENT: TERMINATED. SUBJECT: FREEMAN. REASON: DEMONSTRATION OF EXCEEDINGLY POOR JUDGMENT."))))
			STOP_PROCESSING(SSprocessing, src)


	else
		GLOB.deployment_flag_grace_period -= 1 SECONDS
		return
