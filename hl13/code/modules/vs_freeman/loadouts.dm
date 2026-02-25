GLOBAL_VAR_INIT(freeman_hunters, 0)
/obj/item/hl2/loadout_picker/vs_freeman

/obj/item/hl2/loadout_picker/vs_freeman/combine/generate_display_names()
	var/static/list/loadouts
	if(!loadouts)
		loadouts = list()
		if(GLOB.freeman_hunters > 0)
			var/list/possible_loadouts = list(
			/datum/outfit/deployment_loadout/combine/tier5/hunter
			)
		else
			var/list/possible_loadouts = list( //just giving them all the tier 4s is probably balanced, i dont trust cremator though
				/datum/outfit/deployment_loadout/combine/tier4/elite,
				/datum/outfit/deployment_loadout/combine/tier4/shotgunner,
				/datum/outfit/deployment_loadout/combine/tier4/sniper,
				/datum/outfit/deployment_loadout/combine/tier4/ordinal,
				/datum/outfit/deployment_loadout/combine/tier4/medic_cop,
				/datum/outfit/deployment_loadout/combine/tier4/engineer,
				/datum/outfit/deployment_loadout/combine/tier4/overseer
			)
		for(var/datum/outfit/deployment_loadout/loadout as anything in possible_loadouts)
			loadouts[initial(loadout.display_name)] = loadout
	return loadouts

/obj/item/hl2/loadout_picker/vs_freeman/combine/additional_effects(mob/living/user)
	if(GLOB.freeman_hunters > 0)
		GLOB.freeman_hunters--
