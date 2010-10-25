votesOption1 = 0
votesOption2 = 0

function luaVote(evt)
	--print("evt.class: " .. evt.class .. "; evt.action: " .. evt.action .. "; evt.type: " .. evt.type .. "; evt.label: " .. evt.label)
	if evt.class == "ncl" and evt.action == "start" and evt.type == "presentation" then
		if evt.label == "luaVote1" then
			votesOption1 = votesOption1 + 1
			evt.action = "stop"
			event.post("out", evt)
		end

		if evt.label == "luaVote2" then
			votesOption2 = votesOption2 + 1
			evt.action = "stop"
			event.post("out", evt)
		end
		
		-- tie
		local voteCondition = 0
		-- option1 landslide		
		if votesOption1 > votesOption2 * 2 then
			voteCondition = 1
		-- option1 simple win
		elseif votesOption1 > votesOption2 then
			voteCondition = 2
		-- option2 landslide
		elseif votesOption2 > votesOption1 * 2 then
			voteCondition = 3
		-- option2 simple win
		elseif votesOption2 > votesOption1 then
			voteCondition = 4
		end
	
		local evtCondition = {
			class = 'ncl',
			type = 'attribution',
			name = 'luaVoteResult',
			value = voteCondition
		}
	
		--print("evtCondition.name: " .. evtCondition.name .. "; evtCondition.value: " .. evtCondition.value)			
	
		evtCondition.action = 'start'
		event.post("out", evtCondition)
		evtCondition.action = 'stop'
		event.post("out", evtCondition)
	end

	print("option1: " .. votesOption1 .. "; option2: " .. votesOption2)
end

--print("event.register(luaVote)")
event.register(luaVote)
