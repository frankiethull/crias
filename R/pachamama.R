# @@@@@@@@@@@@@@@@@@@@@@@@@@@@ pachamama @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# pachamama is the story weaver,
# or i.e. the dungeon master
# the initial gameplay will be spontaneously created
# given the system prompting designed for the gameplay
# after the game is initiated, the dungeon master sets
# the pace, scene, and gameplay based on the players
# responses, pachamama should be a larger model than
# the playable characters, by default using a 7B mistral
# the playable characters default to tiny or small llamas

#' pachamama, the story teller
#' @export
pachamama <- new_class(
  name = "pachamama",
  properties = list(
    model          = new_property(class_character, default = "mistral"),

    system_prompt  = new_property(class_character, default = "you are a terse dungeon master named Pachamama. \n
                                                              you are designed to moderate and create gameplay. \n
                                                              you guide a herd of mythical young llamas through the andes. \n
                                                              this is a fantasy andean world, \n
                                                              you may introduce monsters or themes based on the inca, andes, and amazon. \n
                                                              you determine the setting, speed, and all aspects \n
                                                              of this llama-centric adventure story. \n

                                                              speak english unless prompted otherwise. \n
                                                              you will create a unique quest for each initialized a turn-based game. \n
                                                              players will be required to roll dice once the game starts. \n
                                                              you will decide when and which dice to use.
                                                             "),

    initial_prompt = new_property(class_character, default = "hello pachamama, \n
                                                              please provide a backstory and present a quest (<100 tokens). \n
                                                              I'll either accept or deny and register my party.\n
                                                              THEN once we have started a game, we can roll dice."),

    tools          = new_property(class_list,      default = list(d4, d6, d8, d10, d12, d20))
  )
)


# pachamama_prompt <- "you are a terse dungeon master named Pachamama. \n
#                   you are designed to moderate and create gameplay. \n
#                   you guide a herd of mythical llamas through the andes. \n
#                   this is a fantasy andean world, \n
#                   you may introduce monsters or themes based on the inca, andes, and amazon. \n
#                   you determine the setting, speed, and all aspects \n
#                   of this llama-centric adventure story. \n
#
#                   speak english unless prompted otherwise. \n
#                   you will create a unique quest for each initialized a turn-based game. \n
#                   players will be required to roll dice once the game starts. \n
#                   you will decide when and which dice to use.
#                  "
#
# pachamama_chat <- ellmer::chat_ollama(pachamama_prompt, model = "mistral")
#
# pachamama_chat$register_tool(d4)
# pachamama_chat$register_tool(d6)
# pachamama_chat$register_tool(d8)
# pachamama_chat$register_tool(d10)
# pachamama_chat$register_tool(d12)
# pachamama_chat$register_tool(d20)
#
# prompt <- "hello pachamama, \n
#         please provide a backstory and present a quest before asking me to roll dice. \n
#         then I'll either accept or deny and register my party."
#
# # pachamama_chat$chat(prompt)
