//All bundles and telecrystals
/datum/uplink_category/bundle
	name = "Bundles"
	weight = 10

/datum/uplink_item/bundles_tc
	category = /datum/uplink_category/bundle
	surplus = 0
	cant_discount = TRUE
	purchasable_from = parent_type::purchasable_from & ~UPLINK_SPY

/datum/uplink_item/bundles_tc/random
	name = "Random Item"
	desc = "Picking this will purchase a random item. Useful if you have some TC to spare or if you haven't decided on a strategy yet."
	item = ABSTRACT_UPLINK_ITEM
	cost = 0
	cost_override_string = "Varies"

/datum/uplink_item/bundles_tc/random/purchase(mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/list/possible_items = list()
	for(var/datum/uplink_item/item_path as anything in SStraitor.uplink_items_by_type)
		var/datum/uplink_item/uplink_item = SStraitor.uplink_items_by_type[item_path]
		if(src == uplink_item || !uplink_item.item)
			continue
		if(!handler.can_purchase_item(user, uplink_item))
			continue
		possible_items += uplink_item

	if(possible_items.len)
		var/datum/uplink_item/uplink_item = pick(possible_items)
		log_uplink("[key_name(user)] purchased a random uplink item from [handler.owner]'s uplink with [handler.telecrystals] telecrystals remaining")
		SSblackbox.record_feedback("tally", "traitor_random_uplink_items_gotten", 1, initial(uplink_item.name))
		handler.purchase_item(user, uplink_item)

/datum/uplink_item/bundles_tc/telecrystal
	name = "1 Raw Telecrystal"
	desc = "A telecrystal in its rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal
	cost = 1
	// Don't add telecrystals to the purchase_log since
	// it's just used to buy more items (including itself!)
	purchase_log_vis = FALSE
	purchasable_from = NONE

/datum/uplink_item/bundles_tc/bundle_a
	name = "Rebel Supply Kit"
	desc = "Lambda Bundles are specialized groups of items that arrive in a plain box. \
			These items are collectively worth more than 25 telecrystals, but you do not know which specialization \
			you will receive. May contain discontinued and/or exotic items. \
			Lambda will only provide one supply kit per agent."
	item = /obj/item/storage/box/syndicate/bundle_a
	cost = 20
	stock_key = UPLINK_SHARED_STOCK_KITS
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)

/datum/uplink_item/bundles_tc/surplus
	name = "Lambda Surplus Crate"
	desc = "A dusty crate from the back of the Lambda warehouse delivered directly to you via Supply Pod. \
			If the rumors are true, it will fill it's contents based on your current reputation. Get on that grind. \
			Contents are sorted to always be worth 30 TC. Lambda will only provide one surplus item per agent."
	item = /obj/structure/closet/crate // will be replaced in purchase()
	cost = 20
	purchasable_from = ~(UPLINK_ALL_SYNDIE_OPS | UPLINK_SPY)
	stock_key = UPLINK_SHARED_STOCK_SURPLUS
	/// Value of items inside the crate in TC
	var/crate_tc_value = 30
	/// crate that will be used for the surplus crate
	var/crate_type = /obj/structure/closet/crate/halflife

/// generates items that can go inside crates, edit this proc to change what items could go inside your specialized crate
/datum/uplink_item/bundles_tc/surplus/proc/generate_possible_items(mob/user, datum/uplink_handler/handler)
	var/list/possible_items = list()
	for(var/datum/uplink_item/item_path as anything in SStraitor.uplink_items_by_type)
		var/datum/uplink_item/uplink_item = SStraitor.uplink_items_by_type[item_path]
		if(src == uplink_item || !uplink_item.item)
			continue
		if(!handler.check_if_restricted(uplink_item))
			continue
		if(!uplink_item.surplus)
			continue
		if(handler.not_enough_reputation(uplink_item))
			continue
		possible_items += uplink_item
	return possible_items

/// picks items from the list given to proc and generates a valid uplink item that is less or equal to the amount of TC it can spend
/datum/uplink_item/bundles_tc/surplus/proc/pick_possible_item(list/possible_items, tc_budget)
	var/datum/uplink_item/uplink_item = pick(possible_items)
	if(prob(100 - uplink_item.surplus))
		return null
	if(tc_budget < uplink_item.cost)
		return null
	return uplink_item

/// fills the crate that will be given to the traitor, edit this to change the crate and how the item is filled
/datum/uplink_item/bundles_tc/surplus/proc/fill_crate(obj/structure/closet/crate/surplus_crate, list/possible_items)
	var/tc_budget = crate_tc_value
	while(tc_budget)
		var/datum/uplink_item/uplink_item = pick_possible_item(possible_items, tc_budget)
		if(!uplink_item)
			continue
		tc_budget -= uplink_item.cost
		new uplink_item.item(surplus_crate)

/// overwrites item spawning proc for surplus items to spawn an appropriate crate via a podspawn
/datum/uplink_item/bundles_tc/surplus/spawn_item(spawn_path, mob/user, datum/uplink_handler/handler, atom/movable/source)
	var/obj/structure/closet/crate/surplus_crate = new crate_type()
	if(!istype(surplus_crate))
		CRASH("crate_type is not a crate")
	var/list/possible_items = generate_possible_items(user, handler)

	fill_crate(surplus_crate, possible_items)

	podspawn(list(
		"target" = get_turf(user),
		"style" = /datum/pod_style/syndicate,
		"spawn" = surplus_crate,
	))
	return source //For log icon
