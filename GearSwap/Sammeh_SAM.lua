
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	include('sammeh_custom_functions.lua')
end

function user_setup()
	state.IdleMode:options('Normal','Reraise','DT')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f12 gs c wslist')
	
	state.OffenseMode = M{['description']='Engaged Mode', 'Normal','Reraise','DT','MedAccuracy','HighAccuracy'}
	-- f9 =  offense mode
	state.WeaponskillMode:options('Normal', 'Acc')
	-- win+f9 = ws mode
    select_default_macro_book()
	
	-- Set Common Aliases --
	send_command("alias wsset gs equip sets.precast.WS")
	send_command("alias mwsset gs equip sets.precast.WS.magic")
	send_command("alias eng gs equip sets.engaged")
	send_command("alias medacc gs equip sets.engaged.MedAccuracy")
	send_command("alias highacc gs equip sets.engaged.HighAccuracy")
	send_command("alias meva gs equip sets.meva")
	send_command("alias idle gs equip sets.Idle.Current")
	send_command('@wait 5;input /lockstyleset 1')
	
	-- the following aliases are based on having a Logitech G11 keyboard with extra function keys.
	
	send_command("alias g11_m2g13 input /ja Berserk <me>")
	send_command("alias g11_m2g14 input /ja Warcry <me>")
	send_command("alias g11_m2g15 input /ja Aggressor <me>")
	send_command("alias g11_m2g16 gs c ws 1")
	send_command("alias g11_m2g17 gs c ws 2")
	send_command("alias g11_m2g18 gs c ws 3")

	res = require 'resources'
	
	WeaponSkill = {
		["Great Katana"] = {
			["1"] = "Tachi: Shoha",
			["2"] = "Tachi: Hobaku",
			["3"] = "Tachi: Jinpu"
		},
		["Polearm"] = {
			["1"] = "Stardiver",
			["2"] = "Impulse Drive",
			["3"] = "Leg Sweep"
		},
		["Staff"] = {
			["1"] = "Earth Crusher",
			["2"] = "Earth Crusher",
			["3"] = "Earth Crusher"
		},
		
	}
	
end

	
function init_gear_sets()
	
	sets.engaged = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		--body={ name="Valorous Mail", augments={'Accuracy+20 Attack+20','"Store TP"+7','Attack+9',}},
		body="Kendatsuba Samue +1",
		--hands={ name="Valorous Mitts", augments={'Accuracy+13 Attack+13','CHR+5','Quadruple Attack +3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		hands="Wakido Kote +3",
		legs={ name="Valor. Hose", augments={'Accuracy+30','"Store TP"+8','CHR+7',}},
		feet="Flamma gambieras +2",
		neck="Moonbeam Nodowa",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Ilabrat Ring",
		back={ name="Takaha Mantle", augments={'STR+4','"Zanshin"+1','"Store TP"+2','Meditate eff. dur. +6',}},
	}
	
	sets.engaged.Reraise = set_combine(sets.engaged,{body="Twilight Mail",head="Twilight Helm"})
	
	sets.engaged.HighAccuracy = {
	    head="Wakido Kabuto +3",
		body="Ken. Samue +1",
		hands="Wakido Kote +3",
		legs="Wakido Haidate +3",
		feet="Flam. Gambieras +2",
		neck="Moonbeam Nodowa",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Takaha Mantle", augments={'STR+4','"Zanshin"+1','"Store TP"+2','Meditate eff. dur. +6',}},
	}
	sets.engaged.MedAccuracy = {
	    ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Ken. Samue +1",
		-- hands={ name="Valorous Mitts", augments={'Accuracy+13 Attack+13','CHR+5','Quadruple Attack +3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		hands="Wakido Kote +3",
		legs="Wakido Haidate +3",
		feet="Flam. Gambieras +2",
		neck="Moonbeam Nodowa",
		waist="Ioskeha Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Takaha Mantle", augments={'STR+4','"Zanshin"+1','"Store TP"+2','Meditate eff. dur. +6',}},
	}

	sets.engaged.DT = sets.dt
	--[[
	sets.precast.WS = {
		ammo="Knobkierrie",
	    head="Flam. Zucchetto +2",
		body={ name="Valorous Mail", augments={'Accuracy+24 Attack+24','Weapon skill damage +3%','DEX+6','Accuracy+1','Attack+13',}},
		hands={ name="Valorous Mitts", augments={'Accuracy+23 Attack+23','Weapon skill damage +3%','VIT+8','Accuracy+2','Attack+12',}},
		legs="Wakido Haidate +3",
		feet={ name="Valorous Greaves", augments={'Mag. Acc.+17','"Store TP"+4','Weapon skill damage +8%','Accuracy+5 Attack+5','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	]]
	sets.precast.WS = {
		ammo="Knobkierrie",
		head="Flam. Zucchetto +2",
		body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		hands={ name="Valorous Mitts", augments={'Attack+16','Weapon skill damage +3%','STR+10','Accuracy+7',}},
		legs="Wakido Haidate +3",
		feet={ name="Valorous Greaves", augments={'Mag. Acc.+17','"Store TP"+4','Weapon skill damage +8%','Accuracy+5 Attack+5','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets.precast.WS.Acc = {
		ammo="Knobkierrie",
	    head="Wakido Kabuto +3",
		body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		hands={ name="Valorous Mitts", augments={'Accuracy+23 Attack+23','Weapon skill damage +3%','VIT+8','Accuracy+2','Attack+12',}},
		legs="Wakido Haidate +3",
		feet={ name="Valorous Greaves", augments={'Mag. Acc.+17','"Store TP"+4','Weapon skill damage +8%','Accuracy+5 Attack+5','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Regal Ring",
		back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets.precast.WS.magic = {
	    ammo="Pemphredo Tathlum",
		head={ name="Valorous Mask", augments={'Magic burst dmg.+8%','Mag. Acc.+26','Accuracy+20 Attack+20','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
		body={ name="Found. Breastplate", augments={'Accuracy+15','Mag. Acc.+15','Attack+15','"Mag.Atk.Bns."+15',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs="Wakido Haidate +3",
		feet={ name="Valorous Greaves", augments={'"Snapshot"+4','"Mag.Atk.Bns."+27','"Fast Cast"+1','Accuracy+8 Attack+8','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Hermetic Earring",
		right_ear="Crematio Earring",
		left_ring="Etana Ring",
		right_ring="Weather. Ring",
		back="Argocham. Mantle",
	}
			
	sets.ranged = {
		head="Ken. Jinpachi",
		body="Ken. Samue +1",
		hands="Ken. Tekko",
		legs="Ken. Hakama",
		feet="Ken. Sune-Ate",
		neck="Combatant's Torque",
		waist="Reiki Yotai",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Cacoethic Ring",
		right_ring="Cacoethic Ring +1",
		back={ name="Smertrios's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
	}

	-- WS Sets
	sets.precast.WS['Namas Arrow'] = set_combine(sets.ranged, {
		body={ name="Sakonji Domaru +3", augments={'Enhances "Overwhelm" effect',}},
		legs="Wakido Haidate +3",
		})
	sets.precast.WS['Apex Arrow'] = sets.precast.WS['Namas Arrow']
	sets.precast.WS["Tachi: Jinpu"] = sets.precast.WS.magic
	sets.precast.WS["Tachi: Goten"] = sets.precast.WS.magic
	sets.precast.WS["Tachi: Koki"] = sets.precast.WS.magic
	sets.precast.WS["Earth Crusher"] = sets.precast.WS.magic
	
	

	sets.precast.JA.Meditate = set_combine(sets.precast.JA, {
		back="Smertrios's Mantle",
		hands={ name="Sakonji Kote +3", augments={'Enhances "Blade Bash" effect',}},
		head="Wakido Kabuto +3"
	})
	sets.precast.JA['Warding Circle'] = set_combine(sets.precast.JA, {head="Wakido Kabuto +3"})
	sets.precast.JA['Sekkanoki'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Konzen-ittai'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Blade Bash'] = set_combine(sets.precast.JA, {hands="Sakonji Kote +3"})
	sets.precast.JA['Meikyo Shisui'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Hasso'] = set_combine(sets.precast.JA, {})
	sets.precast.JA['Sengikori'] = set_combine(sets.precast.JA, {})
	
	sets.meva = {
		ammo="Staunch Tathlum",
		head="Ken. Jinpachi",
		body="Ken. Samue +1",
		hands="Ken. Tekko",
		legs="Ken. Hakama",
		feet="Ken. Sune-Ate",
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Hearty Earring",
		right_ear="Eabani Earring",
		left_ring="Purity Ring",
		right_ring="Vengeful Ring",
		back="Moonbeam Cape",
	}
	
	sets.CurePotencyRecv = { }
	

    ---  MIDCAST SETS  ---
    sets.midcast = {}
    
    ---  AFTERCAST SETS  ---
    sets.Idle = {
	    head="Loess Barbuta +1",
		body="Chozor. Coselete",
		hands="Sakonji Kote +3",
		legs={ name="Valor. Hose", augments={'Accuracy+30','"Store TP"+8','CHR+7',}},
		feet="Danzo Sune-Ate",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%',}},
		right_ring="Defending Ring",
		back="Moonbeam Cape",
		ammo="Staunch Tathlum"
	}
	
	sets.dt = sets.Idle
	
	sets.Idle.Current = sets.Idle
    sets.Resting = sets.Idle
	
	sets.WakeSleep = {head="Frenzy Sallet"}
	sets.ProtectBuff = {ring1="Sheltered Ring"}

end



function job_pretarget(spell) 
checkblocking(spell)
end


function job_precast(spell)
    handle_equipping_gear(player.status)
	if spell.name == 'Utsusemi: Ichi' and (buffactive['Copy Image (3)'] or buffactive ['Copy Image (4+)']) then
	  cancel_spell()
	  send_command('@wait 1;')
	  equip(sets.Idle.Current)
	  return
	end
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    end
	if spell.name == 'Ranged' then
		equip(sets.ranged)
	end	
end

function job_post_precast(spell)
	if player.tp < 2250 and spell.type == 'WeaponSkill' and player.equipment.main == "Dojikiri Yasutsuna" then
		equip({left_ear="Moonshade Earring"})
		windower.add_to_chat(10,"Adding in Moonshade Earring for more TP:"..player.tp)
	elseif player.tp < 2750 and spell.type == 'WeaponSkill' then
		windower.add_to_chat(10,"Adding in Moonshade Earring for more TP:"..player.tp)
		equip({left_ear="Moonshade Earring"})
	end
end

function job_post_midcast(spell)
    if spell.name == 'Utsusemi: Ichi' then
	  send_command('cancel Copy Image|Copy Image (2)')
	end
	if spell.type == "WeaponSkill" then
	  tpspent = spell.tp_cost
	end

end        

function job_aftercast(spell)
	if state.SpellDebug.value == "On" then 
      spelldebug(spell)
	end
    
    handle_equipping_gear(player.status)
    equip(sets.Idle.Current)    
end

function status_change(new,tab)
    handle_equipping_gear(player.status)
    if new == 'Resting' then
        equip(sets.Resting)
    else
        equip(sets.Idle.Current)
    end
end


function job_buff_change(status,gain_or_loss)
    job_handle_equipping_gear(player.status)
   if (gain_or_loss) then  
     add_to_chat(4,'------- Gained Buff: '..status..'-------')
	 if status == "sleep" then
	   equip(sets.WakeSleep)
	 end
	 if status == "KO" then
	   send_command('input /party These tears... they sting-wing....')
	 end
   else 
     add_to_chat(3,'------- Lost Buff: '..status..'-------')
   end
 end

 function job_self_command(command)
	if command[1]:lower() == "ws" and command[2] ~= nil then
		local EquipedGear = windower.ffxi.get_items()
		local CurrentSkill
		if EquipedGear.equipment.main == nil or EquipedGear.equipment.main == 0 then 
		  CurrentSkill = "Hand-to-Hand"
		else 
		  CurrentSkill = res.skills[res.items[windower.ffxi.get_items(EquipedGear.equipment.main_bag, EquipedGear.equipment.main).id].skill].en
		end
		send_command('input /ws '..WeaponSkill[CurrentSkill][command[2]])
	end
	if command[1]:lower() == "wslist" then
		local EquipedGear = windower.ffxi.get_items()
		local CurrentSkill
		if EquipedGear.equipment.main == nil or EquipedGear.equipment.main == 0 then 
		  CurrentSkill = "Hand-to-Hand"
		else 
		  CurrentSkill = res.skills[res.items[windower.ffxi.get_items(EquipedGear.equipment.main_bag, EquipedGear.equipment.main).id].skill].en
		end
		windower.add_to_chat(2,"WS List:")
		for i,v in pairs(WeaponSkill[CurrentSkill]) do
			windower.add_to_chat(2,i..") "..v)
		end
	end
end

function job_state_change(stateField, newValue, oldValue)
    job_handle_equipping_gear(player.status)
	equip(sets.Idle.Current)
end


function job_handle_equipping_gear(playerStatus, eventArgs)    	
	disable_specialgear()
    if buffactive.sleep then
	equip(sets.WakeSleep)
	end
	if playerStatus == 'Idle' then
        equip(sets.Idle.Current)
    end
	if state.IdleMode.value == "Reraise" then
	   sets.Idle.Current = set_combine(sets.Idle,{body="Twilight Mail",head="Twilight Helm"})   
	elseif state.IdleMode.value == "DT" or state.OffenseMode.value == "DT" then
		if buffactive['Aftermath'] then
			sets.Idle.Current = sets.dtaftermath
			sets.engaged.DT = sets.dtaftermath
		else
			sets.Idle.Current = sets.dt
			sets.engaged.DT = sets.dt
		end
	else
	   sets.Idle.Current = sets.Idle
	end
end



function select_default_macro_book()
    set_macro_page(2, 1)
end
