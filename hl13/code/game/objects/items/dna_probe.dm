#define DNA_PROBE_SCAN_PLANTS (1<<0)
#define DNA_PROBE_SCAN_ANIMALS (1<<1)
#define DNA_PROBE_SCAN_HUMANS (1<<2)

/**
 * DNA Probe
 *
 * Used for scanning DNA, and can be uploaded to a DNA vault.
 */

/obj/item/halflife/dna_probe
	name = "DNA Sampler"
	desc = "Can be used to take chemical and genetic samples of pretty much anything. Needs to be linked with a combine DNA analyzing vault first."
	icon = 'icons/obj/medical/syringe.dmi'
	inhand_icon_state = "sampler"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	icon_state = "sampler"
	item_flags = NOBLUDGEON
	///What sources of DNA this sampler can extract from.
	var/allowed_scans = DNA_PROBE_SCAN_PLANTS | DNA_PROBE_SCAN_ANIMALS | DNA_PROBE_SCAN_HUMANS
	///List of all Animal DNA scanned with this sampler.
	var/list/stored_dna_animal = list()
	///List of all Plant DNA scanned with this sampler.
	var/list/stored_dna_plants = list()
	///List of all Human DNA scanned with this sampler.
	var/list/stored_dna_human = list()
	///weak ref to the dna vault
	var/datum/weakref/dna_vault_ref

/obj/item/halflife/dna_probe/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(istype(interacting_with, /obj/machinery/analyzing_server))
		if(dna_vault_ref?.resolve())
			// Weirdly we can upload to any existing DNA vault so long as we're linked to any other existing DNA vault.
			balloon_alert(user, "uploading samples")
			if(!do_after(user, 5 SECONDS, interacting_with))
				balloon_alert(user, "upload failed")
				return FALSE
			return try_upload_dna(interacting_with, user) ? ITEM_INTERACT_SUCCESS : ITEM_INTERACT_BLOCKING
		return try_linking_vault(interacting_with, user) ? ITEM_INTERACT_SUCCESS : ITEM_INTERACT_BLOCKING

	if (!valid_scan_target(interacting_with))
		return NONE

	if (scan_dna(interacting_with, user))
		return ITEM_INTERACT_SUCCESS

	return ITEM_INTERACT_BLOCKING

/obj/item/halflife/dna_probe/proc/try_linking_vault(obj/machinery/analyzing_server/target, mob/user)
	var/obj/machinery/analyzing_server/our_vault = dna_vault_ref?.resolve()
	if(!our_vault)
		dna_vault_ref = WEAKREF(target)//linking the dna vault with the probe
		balloon_alert(user, "vault linked")
		playsound(src, 'sound/machines/terminal/terminal_success.ogg', 50)
		return TRUE
	return FALSE

/obj/item/halflife/dna_probe/proc/try_upload_dna(obj/machinery/analyzing_server/target, mob/user)
	var/uploaded = 0
	var/plant_dna_length = length(stored_dna_plants)
	var/human_dna_length = length(stored_dna_human)
	var/animal_dna_length = length(stored_dna_animal)
	if(plant_dna_length)
		uploaded += plant_dna_length
		target.plant_dna += stored_dna_plants
		stored_dna_plants.Cut()
	if(human_dna_length)
		uploaded += human_dna_length
		target.human_dna += stored_dna_human
		stored_dna_human.Cut()
	if(animal_dna_length)
		uploaded += animal_dna_length
		target.animal_dna += stored_dna_animal
		stored_dna_animal.Cut()
	playsound(target, 'sound/machines/compiler/compiler-stage1.ogg', 50)
	to_chat(user, span_notice("[uploaded] new datapoints uploaded. Reward dispensed."))
	new /obj/item/stack/spacecash/c1(user.loc, uploaded)
	target.stored_research.add_point_list(list(TECHWEB_POINT_TYPE_GENERIC = uploaded*12))
	return uploaded

/obj/item/halflife/dna_probe/proc/scan_dna(atom/target, mob/user)
	if(isliving(user))
		var/mob/living/livvy = user
		if(livvy.get_stat_level(STATKEY_INT) < 12)
			to_chat(livvy, span_notice("You're not smart enough to know how this gadget works. Best leave it to the scientists."))
			return
	var/obj/machinery/analyzing_server/our_vault = dna_vault_ref?.resolve()
	if(!our_vault)
		playsound(user, 'sound/machines/buzz/buzz-sigh.ogg', 50)
		balloon_alert(user, "need database!")
		return
	if(istype(target, /obj/machinery/hydroponics))
		var/obj/machinery/hydroponics/hydro_tray = target
		if(!hydro_tray.myseed)
			return
		if(our_vault.plant_dna[hydro_tray.myseed.type])
			to_chat(user, span_notice("Plant data is already present in vault storage."))
			return
		if(stored_dna_plants[hydro_tray.myseed.type])
			to_chat(user, span_notice("Plant data already present in local storage."))
			return
		if(hydro_tray.plant_status != HYDROTRAY_PLANT_HARVESTABLE) // So it's bit harder.
			to_chat(user, span_alert("Plant needs to be ready to harvest to perform full data scan.")) //Because space dna is actually magic
			return
		balloon_alert(user, "collecting sample")
		if(!do_after(user, 5 SECONDS, target))
			balloon_alert(user, "sample collection failed")
			return FALSE
		stored_dna_plants[hydro_tray.myseed.type] = TRUE
		playsound(src, 'sound/machines/compiler/compiler-stage2.ogg', 50)
		balloon_alert(user, "data added")
		return TRUE
	else if(istype(target, /obj/structure/flora/xen))
		if(our_vault.plant_dna[target.type])
			to_chat(user, span_notice("Xenian data already present in vault storage."))
			return
		if(stored_dna_plants[target.type])
			to_chat(user, span_notice("Xenian data already present in local storage."))
			return
		balloon_alert(user, "collecting sample")
		if(!do_after(user, 5 SECONDS, target))
			balloon_alert(user, "sample collection failed")
			return FALSE
		stored_dna_plants[target.type] = TRUE
		playsound(src, 'sound/machines/compiler/compiler-stage2.ogg', 50)
		balloon_alert(user, "data added")
		return TRUE
	else if(ishuman(target))
		var/mob/living/carbon/human/human_target = target
		if(our_vault.human_dna[human_target.dna.unique_identity])
			to_chat(user, span_notice("Humanoid data already present in vault storage."))
			return
		if(stored_dna_human[human_target.dna.unique_identity])
			to_chat(user, span_notice("Humanoid data already present in local storage."))
			return
		if(!(human_target.mob_biotypes & MOB_ORGANIC))
			to_chat(user, span_alert("No compatible DNA detected."))
			return .
		balloon_alert(user, "collecting sample")
		if(!do_after(user, 5 SECONDS, target))
			balloon_alert(user, "sample collection failed")
			return FALSE
		stored_dna_human[human_target.dna.unique_identity] = TRUE
		playsound(src, 'sound/machines/compiler/compiler-stage2.ogg', 50)
		balloon_alert(user, "data added")
		return TRUE

	if(!isliving(target))
		return

	var/static/list/non_simple_animals = typecacheof(list(/mob/living/carbon/alien))
	if(!isanimal_or_basicmob(target) && !is_type_in_typecache(target, non_simple_animals) && !ismonkey(target))
		return

	var/mob/living/living_target = target
	if(our_vault.animal_dna[living_target.type])
		to_chat(user, span_notice("Animal data already present in vault storage."))
		return
	if(stored_dna_animal[living_target.type])
		to_chat(user, span_notice("Animal data already present in local storage."))
		return
	if(!(living_target.mob_biotypes & MOB_ORGANIC))
		to_chat(user, span_alert("No compatible DNA detected."))
		return .
	balloon_alert(user, "collecting sample")
	if(!do_after(user, 5 SECONDS, target))
		balloon_alert(user, "sample collection failed")
		return FALSE
	stored_dna_animal[living_target.type] = TRUE
	playsound(src, 'sound/machines/compiler/compiler-stage2.ogg', 50)
	balloon_alert(user, "data added")
	return TRUE

/obj/item/halflife/dna_probe/proc/valid_scan_target(atom/target)
	if((allowed_scans & DNA_PROBE_SCAN_PLANTS) && istype(target, /obj/machinery/hydroponics))
		return TRUE
	if((allowed_scans & DNA_PROBE_SCAN_PLANTS) && istype(target, /obj/structure/flora/xen))
		return TRUE
	if((allowed_scans & DNA_PROBE_SCAN_HUMANS) && ishuman(target))
		return TRUE
	if((allowed_scans & DNA_PROBE_SCAN_ANIMALS) && isliving(target))
		var/static/list/non_simple_animals = typecacheof(list(/mob/living/carbon/alien))
		if(isanimal_or_basicmob(target) || is_type_in_typecache(target, non_simple_animals) || ismonkey(target))
			return TRUE
	return FALSE
