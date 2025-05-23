//Industrial/Sewer Pipe Storage, may have functionality in the future

/obj/structure/halflife/pipes
	name = "base class halflife pipe"
	desc = "Demon Pipe, youre cursed now."
	icon = 'hl13/icons/obj/pipes.dmi'
	max_integrity = 500
	density = FALSE
	anchored = TRUE
	plane = ABOVE_GAME_PLANE
	layer = ABOVE_MOB_LAYER
	pixel_y = 32

/obj/structure/halflife/pipes/attackby(obj/item/I, mob/living/user, params) //cant attack due to wall side handling
	return

//Prop Pipes, Decor

/obj/structure/halflife/pipes/piped
	name = "pipes"
	icon_state = "piped"

/obj/structure/halflife/pipes/vent
	name = "vent"
	icon_state = "vent"
	desc = "An old pipe vent, long empty of whatever it expelled."

//Horizontal pipes, Facing the player

//Double Pipes

/obj/structure/halflife/pipes/horizontal
	name = "pipes"
	icon_state = "normal"
	desc = "A hardy metal pipe, long empty of whatever it held."

/obj/structure/halflife/pipes/horizontal/random
	icon_state = "rand"

/obj/structure/halflife/pipes/horizontal/random_alt
	icon_state = "cont"

/obj/structure/halflife/pipes/horizontal/box
	icon_state = "box"
	desc = "A hardy metal pipe, with a maintenance box or vent."

/obj/structure/halflife/pipes/horizontal/brown
	icon_state = "brown"
	desc = "A hardy metal pipe, with an old copper fitting."

/obj/structure/halflife/pipes/horizontal/turnaround
	icon_state = "turnaround"

/obj/structure/halflife/pipes/horizontal/down
	icon_state = "double_down"
	desc = "A hardy metal pipe, going into the floor."

/obj/structure/halflife/pipes/horizontal/down/single
	icon_state = "down"

/obj/structure/halflife/pipes/horizontal/valve
	icon_state = "valve"
	desc = "A hardy metal pipe, fitted with an old red valve."

/obj/structure/halflife/pipes/horizontal/end
	icon_state = "inwall"

//Single Pipes

/obj/structure/halflife/pipes/horizontal/single
	icon_state = "normal_single"

/obj/structure/halflife/pipes/horizontal/single/random
	icon_state = "rand_single"

/obj/structure/halflife/pipes/horizontal/single/valve
	icon_state = "valve_single"
	desc = "A hardy metal pipe, fitted with an old red valve."

/obj/structure/halflife/pipes/horizontal/single/cont
	icon_state = "cont_single"

/obj/structure/halflife/pipes/horizontal/single/down
	icon_state = "down_single"
	desc = "A hardy metal pipe, going into the floor."

/obj/structure/halflife/pipes/horizontal/single/inwall
	icon_state = "inwall_single"

//Vertical Pipes, On the Side - split into west and east for mapping purposes

/obj/structure/halflife/pipes/vertical/east
	name = "pipes"
	icon_state = "upeast"
	desc = "A hardy metal pipe, long empty of whatever it held."

/obj/structure/halflife/pipes/vertical/east/random
	icon_state = "upeastrand"

/obj/structure/halflife/pipes/vertical/east/valve
	icon_state = "valve_upeast"
	desc = "A hardy metal pipe, fitted with an old red valve."

/obj/structure/halflife/pipes/vertical/east/corner
	icon_state = "upcornereast"

/obj/structure/halflife/pipes/vertical/east/corner/single
	icon_state = "upcornereast_single"

/obj/structure/halflife/pipes/vertical/east/corner/down
	icon_state = "downcornereast"

/obj/structure/halflife/pipes/vertical/west
	name = "pipes"
	icon_state = "upwest"
	desc = "A hardy metal pipe, long empty of whatever it held."

/obj/structure/halflife/pipes/vertical/west/random
	icon_state = "upwestrand"

/obj/structure/halflife/pipes/vertical/west/valve
	icon_state = "valve_upwest"
	desc = "A hardy metal pipe, fitted with an old red valve."

/obj/structure/halflife/pipes/vertical/west/corner
	icon_state = "upcornerwest"

/obj/structure/halflife/pipes/vertical/west/corner/single
	icon_state = "upcornerwest_single"

/obj/structure/halflife/pipes/vertical/west/corner/down
	icon_state = "downcornerwest"

//Top pipes, under the frills

/obj/structure/halflife/pipes/top
	name = "pipes"
	icon_state = "top"
	desc = "A hardy metal pipe, long empty of whatever it held."


// For large pipes. Ground based, not on the wall... cool

/obj/structure/halflife/large_pipe
	name = "pipe"
	desc = "A large pipe. There doesn't seem to be anything flowing through it currently."
	icon = 'hl13/icons/obj/pipes.dmi'
	icon_state = "large_pipe_straight"
	max_integrity = 150 //1000 is ridiculous marmio, even for a fluff structure (namely because its dense)
	density = TRUE
	anchored = TRUE
	plane = ABOVE_GAME_PLANE
	layer = ABOVE_MOB_LAYER

/* /obj/structure/halflife/large_pipe/Initialize(mapload) // Looks dumb rn... :( (leaving disabled because it decided it wouldnt work on compile)
	. = ..()
	AddElement(/datum/element/climbable, climb_time = 3 SECONDS, climb_stun = 0, no_stun = TRUE, jump_over = TRUE, jump_north = 12, jump_south = 17, jump_sides = 12)
*/

/obj/structure/halflife/large_pipe/corner
	icon_state = "large_pipe_corner"

/obj/structure/halflife/large_pipe/pump
	icon_state = "large_pipe_pump"
	name = "old pump"
	desc = "A large, old pump. Whatever it once moved has long since left."

/obj/structure/halflife/large_pipe/intersection
	icon_state = "large_pipe_intersection"

/obj/structure/halflife/large_pipe/intersection_t
	icon_state = "large_pipe_intersection-t"

/obj/structure/halflife/large_pipe/ground
	icon_state = "large_pipe_ground"
