function get(identifier, defaultValue)
    return state.GetValue(identifier) or defaultValue
end

function insertTimingPoint(bpm, countInBar, beatUnit)
	local tp = utils.CreateTimingPoint(state.SongTime, bpm*(beatUnit/4), countInBar)
	actions.PlaceTimingPoint(tp)
end

function draw()
	imgui.Begin("Tap to insert timing point")
	
	local bpm = get("bpm", 160)
	_, bpm = imgui.InputInt("the bpm of the song", bpm)
	state.SetValue("bpm", bpm)
	
	local countInBar = get("countInBar", 3)
	_, countInBar = imgui.InputInt("Count in Bar", countInBar)
	state.SetValue("countInBar", countInBar)
	
	local beatUnit = get("beatUnit", 8)
	_, beatUnit = imgui.InputInt("Beat unit", beatUnit)
	state.SetValue("beatUnit", beatUnit)
	
	if imgui.Button("Insert Timing point on current pos with bpm adjusted to desired timing signatures") then
		insertTimingPoint(bpm, countInBar, beatUnit)
	end
	
	imgui.End()
end