script.on_event(defines.events.on_train_schedule_changed, function(event)
	if event.player_index ~= nil then
		local player = game.players[event.player_index]
		local train = event.train
		local schedule = train.schedule

		if schedule ~= nil then
			for _,record in ipairs(schedule.records) do
				-- Only update temporary train stops
				if (record.temporary ~= nil) and record.temporary then
						record.wait_conditions = {
							{type = "fluid_count"}
						}
				end
			end

			train.schedule = schedule
		end
	end
end)
