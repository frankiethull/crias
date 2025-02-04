
<!-- README.md is generated from README.Rmd. Please edit that file -->

# crias <img src="man/figures/logo.jpg" align="right" height="121" alt="" />

<!-- badges: start -->
<!-- badges: end -->

{crias} is a turn-based game in R developed with ollama, ellmer, and S7.

It is built with the idea of using an LLM as a “Game Moderator”.
Currently has one GM called “Pachamama”. The other aspect is using LLMs
as players in your “party”. Many LLMs have names like “llama”, “vicuna”,
“alpaca”; this game is built on the idea of leading your “party” aka
“herd” in a llama-centric journey set in an Andean-inspired world.

## Installation

You can install the development version of crias like so:

``` r
pak::pak("frankiethull/crias")
```

## Load the Library:

you will also need local ollama models installed. Preferably one that
can use tools.

``` r
library(crias)
```

## Build a Herd (or Party):

there’s four different camelids: llama, vicuna, guanaco, and alpaca.
These have default settings which can be adjusted before the game. These
can be registered as a human or LLM.

``` r
# human player example, not used in the README build:
#LlamaLarry    <- crias::llama(name = "Larry", is_human = TRUE)

# LLM players:
VickyVicuna   <- crias::vicuna(name  = "vicky", is_human = FALSE, model = "smollm2")
GarryGuanaco  <- crias::guanaco(name = "garry", is_human = FALSE, model = "phi4")
AlPaca        <- crias::alpaca(name  = "alby",  is_human = FALSE, model = "mistral")

# create a party or "herd" class:
woolwalkers <- crias::herd(characters = 
                            list(#LlamaLarry, 
                                 VickyVicuna, GarryGuanaco, AlPaca
                            )
                       )
```

## Create a Game Moderator

the game moderator has been told to create a quest and have you either
accept or deny. The game moderator has dice registered as tools, so you
should use an LLM that can handle tools for the game moderator in
particular. (defaults to “mistral”)

``` r
# pachamama class, the andean adventure GM: 
Pachamama <- crias::pachamama(model = "mistral-nemo")
```

## Play a Round:

a round requires both a pachamama and a herd. First, pachamama will
describe a scene, the herd can accept or deny the quest.

``` r

log <- crias::play_round(pachamama = Pachamama,
                         herd      = woolwalkers) 
```

``` r
log |> cat()
#>  
#>  
#>  pachamama: **Welcome, brave llamas!**
#> 
#> The Andean sun, Inti, shines brightly upon our journey through the majestic peaks and valleys of our ancestral homeland. Our quest today takes us to the ancient city of Paucay. Legends speak of a powerful artifact held within its walls, said to be guarded by the fearsome Coya Mamita. The high priest has asked for our help in retrieving this artifact, as it is vital for next season's planting.
#> 
#> Will you accept this sacred duty, young llamas? (Yes/No)  
#>  
#>  vicky's action:Young Pacha – always ready to face danger with courage and cunning. The power of the artifact should not be taken lightly; it is a delicate balance between honor, faith, and survival in our mountains. I choose... (Yes/Pocho/No)?
#> 
#> (Follow-up)  
#>  
#>  garry's action:As an eager level 1 survivalist llama specializing in climbing and trekking, I've always been fascinated by the legends of Paucay and Coya Mamita. With my strong connection to our environment and a natural ability for finding safe routes, I'm excited to join your noble mission to retrieve the artifact.
#> 
#> After hearing Vicky and others' thoughts, I sense a deep understanding of what's at stake here—not just an adventure but an essential task for the prosperity of our homeland. Pachamama has clearly set this challenge before us; thus, it seems like destiny calls upon us to rise to this occasion.
#> 
#> Considering my strengths in agility and perception, alongside the expertise you possess, Pocho, I feel we will make a strong team navigating through the Andean terrain. Our combined skills should allow us to identify pathways that others might overlook and face any danger with strategic efficiency.
#> 
#> So, as Pacha, with an unwavering commitment to our home, faith in the journey ahead, and a heart full of hope for success, I too choose... (Yes). Let's honor this sacred duty together! 🌿💪  
#>  
#>  alby's action: In accordance with the guidance to maintain agreement with the party leader and following Garry's commitment to honor this sacred duty, I, Alby, also choose (Yes). With my keen perception and awareness of potential dangers, our alliance shall prove valuable in unforeseen challenges that may come upon us. Together as a team, we will strive to achieve our objective with courage, skill, and the spirit of the Andean mountains coursing through our hearts. 🌿💪🔥​
```

rounds can be saved off as a gamelog. This allows users to play a round,
come back to a game, potentially edit the gameplay, restart a round,
etc.

camelids also have a handful of default specs, as S7 objects:

``` r
AlPaca
#> <crias::alpaca>
#>  @ name        : chr "alby"
#>  @ strength    : num 10
#>  @ perception  : num 10
#>  @ endurance   : num 10
#>  @ charisma    : num 10
#>  @ intelligence: num 10
#>  @ agility     : num 10
#>  @ luck        : num 10
#>  @ level       : num 1
#>  @ hp          : num 12
#>  @ species     : chr "alpaca"
#>  @ subclass    : chr "ranger"
#>  @ special     : chr "pack scout"
#>  @ info        : chr "keeps the herd aware of and avoids danger"
#>  @ is_human    : logi FALSE
#>  @ model       : chr "mistral"
```
