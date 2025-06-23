/datum/outfit/mysteriousemployer
	name = "Mysterious Employer"

	uniform = /obj/item/clothing/under/suit/navy
	shoes = /obj/item/clothing/shoes/laceup

	l_hand = /obj/item/storage/briefcase

/datum/antagonist/mysteriousemployer
	name = "Mysterious Employer"
	roundend_category = "the mysterious employer"
	antagpanel_category = "The Mysterious Employer"
	antag_moodlet = /datum/mood_event/mysteriousemployer
	preview_outfit = /datum/outfit/mysteriousemployer_preview
	show_in_antagpanel = TRUE

/datum/antagonist/mysteriousemployer/greet()
	owner.current.playsound_local(get_turf(owner.current), 'hl13/sound/ambience/combineadvisory.ogg',45,0)
	to_chat(owner, "<B>Suddenly, your mind flashes as you realize your true mission...</B>")
	to_chat(owner, span_userdanger("You are the Mysterious Employer!"))
	to_chat(owner, span_boldnotice("You are of unknown origin, and have come here with similarly unknown interests."))
	to_chat(owner, span_notice("Cause \"nudges\" and complete your objectives."))
	to_chat(owner, span_notice("Note, you are not officially resistance OR combine aligned. You work for unseen forces..."))
	owner.announce_objectives()

/datum/antagonist/mysteriousemployer/on_gain()
	var/datum/objective/mysteriousemployer/mysteriousemployer_objective = new
	mysteriousemployer_objective.owner = owner
	objectives += mysteriousemployer_objective

	var/datum/objective/survive/survive_objective = new
	survive_objective.owner = owner
	objectives += survive_objective

	owner.current.cmode_music = 'hl13/sound/music/combat/notsupposedtobehere.ogg'

	return ..()

/datum/antagonist/mysteriousemployer/proc/equip_op()
	if(!ishuman(owner.current))
		return

	var/mob/living/carbon/human/employer = owner.current
	ADD_TRAIT(employer, TRAIT_NOFEAR_HOLDUPS, INNATE_TRAIT)

	employer.set_species(/datum/species/human)

	employer.delete_equipment()

	employer.equip_species_outfit(/datum/outfit/mysteriousemployer)

	return TRUE

/datum/objective/mysteriousemployer
	explanation_text = "Placeholder"

/datum/antagonist/mysteriousemployer/roundend_report()
	var/list/parts = list()
	parts += span_header("The Mysterious Employer:")

	switch(get_result())
		if(EMPLOYER_RESULT_WIN)
			parts += "<span class='greentext big'>STATUS: HIRED</span>"
			parts += "<B>The mysterious employer has completed their objectives. Awaiting assignment.</B>"
		if(EMPLOYER_RESULT_LOSE)
			parts += "<span class='redtext big'>STATUS: DETAINED</span>"
			parts += "<B>The mysterious employer has failed their objectives. Further evaluation pending.</B>"
		else
			parts += "<span class='neutraltext big'>STATUS: OUT OF RANGE</span>"
			parts += "<B>Mission aborted. No further comment.</B>"

	var/text = span_header("<br>The mysterious employer was:")

	text += printplayer(owner)
	parts += text

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"
