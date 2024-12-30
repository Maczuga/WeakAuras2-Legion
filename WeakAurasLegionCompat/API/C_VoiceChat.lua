if not C_VoiceChat then
  C_VoiceChat = {
    GetTtsVoices = function()
      -- This function does not exist in 7.3.5; return an empty table
      return {}
    end,
    SpeakText = function(voiceID, text, destination, rate, volume)
      -- This function does not exist in 7.3.5; notify the user via print
      print("Text-To-Speech does not exist before 8.0.1.")
    end,
  }
end