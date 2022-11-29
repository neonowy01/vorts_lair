switch = {
	["grunt"] = function() return Entities:FindByName(nil, "grunt_template") end,
	["captain"] = function() return Entities:FindByName(nil, "captain_template") end,
	["supp"] = function() return Entities:FindByName(nil, "supp_template") end,
	["barrel"] = function() return Entities:FindByName(nil, "barrel_template") end,
}

function spawn(npc, position)
	template = switch[npc]()
	realPos = Entities:FindByName(nil, position):GetOrigin()
	print(realPos)
	template:ForceSpawn()
	npcTable = template:GetSpawnedEntities()
	--print(#npcTable)
	for i = #npcTable, 1, -1
	do 	
		print(i)
		if npcTable[i]:GetClassname()=="npc_combine_s" or npcTable[i]:GetName()=="barrel"
			then
			print(npcTable[i]:GetClassname())
			print("Found")
			finalNpc = npcTable[i]
			break
			end
	end
	finalNpc:SetOrigin(realPos)
end


