votesOption1 = 0
votesOption2 = 0

function luaVote(evt)
	if evt.class == "ncl" and evt.action == "start" and evt.type == "presentation" then
		if evt.label == "luaVote1" then
			votesOption1 = votesOption1 + 1
		end

		if evt.label == "luaVote2" then
			votesOption2 = votesOption2 + 1
		end
		
		--print("option1: " .. votesOption1 .. "; option2: " .. votesOption2)
		
		local voteCondition = 0; -- tie		
		if votesOption1 > votesOption2 * 2 then
			voteCondition = 1 -- option1 landslide
		elseif votesOption1 > votesOption2 then
			voteCondition = 2 -- option1 simple win
		elseif votesOption2 > votesOption1 * 2 then
			voteCondition = 3 -- option2 landslide
		elseif votesOption2 > votesOption1 then
			voteCondition = 4 -- option2 simple win
		end
	
		local evtCondition = {
			class = "ncl",
			type = "attribution",
			name = "luaVoteResult",
			value = voteCondition
		}
	
		evtCondition.action = "start"
		event.post("out", evtCondition)
		--evtCondition.action = "stop"
		--event.post("out", evtCondition)
	
	end
	
	evt.action = "stop"
	event.post("out", evt)
end

event.register(luaVote)

