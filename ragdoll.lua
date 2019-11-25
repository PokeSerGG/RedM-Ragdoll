local ragdoll = false

function setRagdoll(flag)
    ragdoll = flag
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ragdoll then
          Citizen.InvokeNative(0xAE99FB955581844A, PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
       end
    end
end)

ragdol = true

RegisterNetEvent("Ragdoll")
AddEventHandler("Ragdoll", function()
    if (ragdol) then
		    setRagdoll(true)
		    ragdol = false
	  else
		    setRagdoll(false)
		    ragdol = true
	   end
end)

RegisterCommand("suelo", function(source, args, raw)
    TriggerEvent("Ragdoll")
end, false)