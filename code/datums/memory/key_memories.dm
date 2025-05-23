/**
 * I am affectionally titling these "key memories"
 *
 * These memories aren't particularly special or interesting, but occuply an important role
 * in conveying information to the user about something important they need to check semi-often
 */
/datum/memory/key
	story_value = STORY_VALUE_KEY
	memory_flags = MEMORY_FLAG_NOMOOD|MEMORY_FLAG_NOLOCATION|MEMORY_FLAG_NOPERSISTENCE|MEMORY_SKIP_UNCONSCIOUS

/// Your bank account ID and pin, can't get into it without it
/datum/memory/key/account
	var/remembered_id
	var/remembered_pinnum

/datum/memory/key/account/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	remembered_id,
	remembered_pinnum,
)
	src.remembered_id = remembered_id
	src.remembered_pinnum = remembered_pinnum
	return ..()

/datum/memory/key/account/get_names()
	return list("The bank ID of [protagonist_name], [remembered_id]. In addition the PIN, [remembered_pinnum].")

/datum/memory/key/account/get_starts()
	return list(
		"[remembered_id] is your account ID, and your pin is [remembered_pinnum]",
	)

/// The code to the captain's spare ID, ONLY give to the real captain.
/datum/memory/key/captains_spare_code
	var/safe_code

/datum/memory/key/captains_spare_code/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	safe_code,
)
	src.safe_code = safe_code
	return ..()

/datum/memory/key/captains_spare_code/get_names()
	return list("The code to the golden safe in the town hall, [safe_code].")

/datum/memory/key/captains_spare_code/get_starts()
	return list(
		"[protagonist_name] struggling at a wall safe, until finally entering [safe_code].",
		"[safe_code][rand(0,9)]. The numbers mason, what do they mean!?", // Same as the account code
	)


/// The nuclear bomb code, for nuke ops
/datum/memory/key/nuke_code
	var/nuclear_code

/datum/memory/key/nuke_code/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	nuclear_code,
)
	src.nuclear_code = nuclear_code
	return ..()

/datum/memory/key/nuke_code/get_names()
	return list("[protagonist_name] learns the detonation codes for a nuclear weapon, [nuclear_code].")

/datum/memory/key/nuke_code/get_starts()
	return list(
		"The number [nuclear_code] written on a sticky note with the words \"FOR SYNDICATE EYES ONLY\" scrawled next to it.",
		"A piece of paper with the number [nuclear_code] being handed to [protagonist_name] from a figure in a blood-red MODsuit.",
	)

/// Tracks what medicines someone with the "allergies" quirk is allergic to
/datum/memory/key/quirk_allergy
	memory_flags = MEMORY_FLAG_NOMOOD|MEMORY_FLAG_NOLOCATION|MEMORY_FLAG_NOPERSISTENCE|MEMORY_SKIP_UNCONSCIOUS|MEMORY_NO_STORY // No story for this
	var/allergy_string

/datum/memory/key/quirk_allergy/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	allergy_string,
)
	src.allergy_string = allergy_string
	return ..()

/datum/memory/key/quirk_allergy/get_names()
	return list("The [allergy_string] allergy of [protagonist_name].")

/datum/memory/key/quirk_allergy/get_starts()
	return list("[protagonist_name] sneezing after coming into contact with [allergy_string].")

/// Tracks what brand a smoker quirk user likes
/datum/memory/key/quirk_smoker
	memory_flags = MEMORY_FLAG_NOLOCATION|MEMORY_FLAG_NOPERSISTENCE|MEMORY_SKIP_UNCONSCIOUS // Does not have nomood
	var/preferred_brand

/datum/memory/key/quirk_smoker/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	preferred_brand,
)
	src.preferred_brand = preferred_brand
	return ..()

/datum/memory/key/quirk_smoker/get_names()
	return list("[protagonist_name]'s addiction to [preferred_brand] cigarettes.")

/datum/memory/key/quirk_smoker/get_starts()
	return list(
		"[preferred_brand] cigarettes being plundered by [protagonist_name].",
		"[protagonist_name] buying a box of [preferred_brand] nicotine sticks.",
		"[protagonist_name] fiending for some [preferred_brand] ciggies.",
	)

/datum/memory/key/quirk_smoker/get_moods()
	return list("[memorizer] [mood_verb] as they light another up.")

/// Tracks what beverage an alcoholic quirk user likes
/datum/memory/key/quirk_alcoholic
	memory_flags = MEMORY_FLAG_NOLOCATION|MEMORY_FLAG_NOPERSISTENCE|MEMORY_SKIP_UNCONSCIOUS // Does not have nomood
	var/preferred_brandy //haha, get it because brandy is a type of alcohol wow!

/datum/memory/key/quirk_alcoholic/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	preferred_brandy,
)
	src.preferred_brandy = preferred_brandy
	return ..()

/datum/memory/key/quirk_alcoholic/get_names()
	return list("[protagonist_name]'s addiction to [preferred_brandy] alcohol.")

/datum/memory/key/quirk_alcoholic/get_starts()
	return list(
		"[preferred_brandy] being downed by [protagonist_name].",
		"[protagonist_name] buying a box of [preferred_brandy] bottles.",
		"[protagonist_name] fiending for some [preferred_brandy].",
	)

/datum/memory/key/quirk_alcoholic/get_moods()
	return list("[memorizer] [mood_verb] as they drink some [preferred_brandy].")

/// Where our traitor uplink is, and what is its code
/datum/memory/key/traitor_uplink
	var/uplink_loc
	var/uplink_code

/datum/memory/key/traitor_uplink/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	uplink_loc,
	uplink_code,
)
	src.uplink_loc = uplink_loc
	src.uplink_code = uplink_code
	return ..()

/datum/memory/key/traitor_uplink/get_names()
	return list("[protagonist_name]'s equipment uplink in their [uplink_loc], opened via [uplink_code].")

/datum/memory/key/traitor_uplink/get_starts()
	return list(
		"[protagonist_name] punching in [uplink_code] into their [uplink_loc].",
		"[protagonist_name] writing down [uplink_code] with their [uplink_loc] besides them, so as to not forget it.",
	)

/datum/memory/key/traitor_uplink/implant

/datum/memory/key/traitor_uplink/implant/get_names()
	return list("[protagonist_name]'s equipment uplink implanted into their body.")

/datum/memory/key/traitor_uplink/implant/get_starts()
	return list(
		"[protagonist_name] being implanted by a scientist.",
		"[protagonist_name] having surgery done on them by a scientist.",
	)

/datum/memory/key/permabrig_crimes
	var/crimes

/datum/memory/key/permabrig_crimes/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	crimes,
)
	src.crimes = crimes
	return ..()

/datum/memory/key/permabrig_crimes/get_names()
	return list("[protagonist_name]'s crime of \"[crimes]\".")

/datum/memory/key/permabrig_crimes/get_starts()
	return list(
		"[protagonist_name] being arrested by security for [crimes].",
		"[protagonist_name] committing the crimes of [crimes].",
	)

/datum/memory/key/message_server_key
	var/decrypt_key

/datum/memory/key/message_server_key/New(
	datum/mind/memorizer_mind,
	atom/protagonist,
	atom/deuteragonist,
	atom/antagonist,
	decrypt_key,
)
	src.decrypt_key = decrypt_key
	return ..()

/datum/memory/key/message_server_key/get_names()
	return list("The daily message server key is [decrypt_key]. Keep it a secret from the clown.")

/datum/memory/key/message_server_key/get_starts()
	return list(
		"A sticky note attached to a monitor with [decrypt_key] written on it.",
		"Poly the parrot screaming \"[decrypt_key]!\" over and over again.",
		"[protagonist_name] spilling coffee over the message monitor while typing [decrypt_key].",
	)
