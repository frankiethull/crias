# @@@@@@@@@@@@@@@@@ notes @@@@@@@@@@@@@@@@@@@ #
# game overview & requirements to initialize:
#
## key roles:
# 1 pachamama (acting as a storyteller)
#
# 1 herd, (party, or group of players):
# a herd requires registered playable characters (or camelids)
# camelids include lamini such as: llama, alpaca, vicuna, and guanaco
# camelids can be registered as human players or LLMs
#
## gameplay:
# the pachamama creates a campaign
# which the herd can either accept or deny
# this initiates the gaming sequence
# each game is turn-based,
# beginning with pachamama,
# followed by each camelid in the herd,
#
## rounds:
# once a game is started,
# a full turn cycle is called a round,
# the previous and current round turns are stored,
# these turns are used within the prompt interface
# so each AI player has context and
# rounds can be saved-loaded



#' Play a Round
#'
#' @param pachamama a pachamama
#' @param herd      a herd of characters
#' @param gamelog   a gamelog to continue where the round left off.
#'
#' @returns a gamelog
#' @export
play_round <- \(pachamama = crias::pachamama(),
                herd      = crias::herd(characters = list(llama  = crias::llama(name  = "lance"),
                                                          vicuna = crias::vicuna(name = "victor")
                                                     )
                                   ),
                gamelog   = character(0)
                ){

  # @@@@@@@@@@@@@@@@@@ pachamama @@@@@@@@@@@@@@@@@@@@@@@

  # initiate the pachamama instance:
  pachamama_initiate <- ellmer::chat_ollama(system_prompt = pachamama@system_prompt,
                                            model         = pachamama@model)

  # register tools to pachamama:
  for (i in 1:length(pachamama@tools)) {
    pachamama_initiate$register_tool(pachamama@tools[[i]])
  }

  # pachamama response:
  if (length(gamelog) > 0){
    pachamama_log <- pachamama_initiate$chat("a game is already started,\n
                                              here is the log for reference: ", gamelog)
  }else{
    pachamama_log <- pachamama_initiate$chat(pachamama@initial_prompt)
  }

  gamelog <- c(gamelog, paste0(" \n \n ", "pachamama: ",pachamama_log))

  # print pachamama's response ahead of players' actions
  pachamama_log |> cat()

  # @@@@@@@@@@@@@@@@@@@@@ herd @@@@@@@@@@@@@@@@@@@@@@@@

  for (k in 1:length(herd@characters)){
    player <- herd@characters[[k]]

    if(player@is_human == TRUE){

    player_log <- readline(prompt = paste0(
        player@name, "'s action (party leader):"
      ))

    }else{
      initiate_llm <- ellmer::chat_ollama(system_prompt = crias::describe(player),
                                          model         = player@model)

      player_log <- initiate_llm$chat("gamelog so far:",
                                      gamelog,
                                      "provide your best decision given this turn and your role.")

      # print LLM player's response
      player_log |> cat()
    }
   gamelog <- c(gamelog, paste0(" \n \n ", player@name, "'s action:", player_log))
  }

 # chain rounds into a game with gamelog:
 return(gamelog)
}





#' Play Game
#'
#' @param pachamama a pachamama
#' @param herd      a herd of characters
#' @param gamelog   a gamelog to continue where the round left off.
#' @param rounds    num of rounds
#'
#' @returns a gamelog
#' @export
#'
play_game <- \(pachamama = crias::pachamama(),
               herd      = crias::herd(characters = list(llama  = crias::llama(name  = "lance"),
                                                         vicuna = crias::vicuna(name = "victor")
                                                        )
                                      ),
               gamelog   = character(0),
               rounds    = 3
              ){

    for(i in 1:rounds){
        gamelog <-
         crias::play_round(pachamama = pachamama,
                           herd      = herd,
                           gamelog   = gamelog)

    }
  return(gamelog)
}
