ClearAreaWH = 'Insert webhook for Clear Area logs'
SummonWH = 'Insert webhook for summon logs'
PMessageWH = 'Insert webhook for message logger'
vKillWH = 'Insert webhook for vmenu kills'

RegisterNetEvent('vMenu:ClearArea', function(src)
    local src = source;
    local name = GetPlayerName(src)
    sendToDiscordClear(8421504, "**Clear Area Log!**", "**Player that cleared area!:** ".. name .."", footer)
end)


RegisterNetEvent('vMenu:SummonPlayer', function(summond)
    local summoner = source;
    local staff = GetPlayerName(summoner) 
    local player = GetPlayerName(summond)
    sendToDiscordSummon(8421504, "**Summon Log!**", "**Player that was summoned!:**"..player.."\n\n**Summoned by:** "..staff.."", footer)
end)

RegisterNetEvent('vMenu:KillPlayer', function(killed)
    local kill = source;
    local killer = GetPlayerName(kill) 
    local died = GetPlayerName(killed)
    sendToDiscordKill(8421504, "**vMenu Kill Log!**", "**Killer:** "..killer.."\n\n**Player Killed:** "..died.."", footer)
end)


RegisterNetEvent('vMenu:SendMessageToPlayer', function(getter, message)
    local messenger = source;
    local splayer = GetPlayerName(messenger) 
    local tplayer = GetPlayerName(getter)
    sendToDiscordPM(8421504, "**Private Message Log!**", "**Messenger:** "..splayer.."\n\n**Recieved by:** "..tplayer.."\n\n**Message:** "..message.." ", footer)
end)


-- Clear Area webhook send
function sendToDiscordClear(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "Made By: Viper",
              },
          }
      }

      PerformHttpRequest(ClearAreaWH, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end

-- Staff Kick log
function sendToDiscordKick(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "Made By: Viper",
              },
          }
      }

      PerformHttpRequest(KickWH, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end

-- Summon Logs
function sendToDiscordSummon(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "Made By: Viper",
              },
          }
      }

      PerformHttpRequest(SummonWH, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end

-- Privet Message Logger
function sendToDiscordPM(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "Made By: Viper",
              },
          }
      }

      PerformHttpRequest(PMessageWH, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end

-- vMenu Kill logs (F1 kill)
function sendToDiscordKill(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "Made By: Viper",
              },
          }
      }

      PerformHttpRequest(vKillWH, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end