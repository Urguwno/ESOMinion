Dev = { }
Dev.lastticks = 0
Dev.running = false
Dev.curTask = nil


function Dev.ModuleInit()
	GUI_NewWindow("Dev",50,50,250,430)
	GUI_NewComboBox("Dev","Player/TargetInfo","chartarg","EntityInfo","Player,Target,Nearest");
	GUI_NewField("Dev","Ptr","TargetPtr","EntityInfo")
	GUI_NewField("Dev","EListID","TID","EntityInfo")
	GUI_NewField("Dev","ServerID","SID","EntityInfo")	
	GUI_NewField("Dev","Type","TType","EntityInfo")	
	GUI_NewField("Dev","ContentID","TCID","EntityInfo")
	GUI_NewField("Dev","TargetID","TTarID","EntityInfo")	
	GUI_NewField("Dev","Class","TClass","EntityInfo")	
	GUI_NewField("Dev","Name","TName","EntityInfo")	
	GUI_NewField("Dev","Health","THP","EntityInfo")
	GUI_NewField("Dev","Position","TPos","EntityInfo")
	GUI_NewField("Dev","Heading","THead","EntityInfo")
	GUI_NewField("Dev","Radius/Height","THRad","EntityInfo")
	GUI_NewField("Dev","OnMesh","TOnMesh","EntityInfo")
	GUI_NewField("Dev","OnMeshExact","TOnMeshExact","EntityInfo")
	GUI_NewField("Dev","Distance","TDist","EntityInfo")
	GUI_NewField("Dev","PathDistance","TPDist","EntityInfo")
	GUI_NewField("Dev","LineOfSight","TLOS","EntityInfo")	
	GUI_NewField("Dev","InteractActionType","TIAT","EntityInfo")
	GUI_NewField("Dev","InteractActionName","TIATName","EntityInfo")
	GUI_NewField("Dev","Attitude","TAtt","EntityInfo")
	GUI_NewField("Dev","IsAlive","TIsAlive","EntityInfo")
	GUI_NewField("Dev","IsDead","TIsDead","EntityInfo")
	GUI_NewField("Dev","IsFriendly","TIsF","EntityInfo")
	GUI_NewField("Dev","IsHostile","TIHost","EntityInfo")
	GUI_NewField("Dev","IsAttackable","TAtta","EntityInfo")
	GUI_NewField("Dev","IsTargetable","TTarg","EntityInfo")
	GUI_NewField("Dev","IsKillable","TKillab","EntityInfo")
	GUI_NewField("Dev","IsStealthed","TIsStea","EntityInfo")
	GUI_NewField("Dev","StealthState","TStealthSta","EntityInfo")
	GUI_NewField("Dev","IsSwimming","TSwim","EntityInfo")
	GUI_NewField("Dev","IsFalling","TIsfall","EntityInfo")
	GUI_NewField("Dev","IsVendor","TIsVend","EntityInfo")
	GUI_NewField("Dev","IsNPC","TIsNPC","EntityInfo")
	GUI_NewField("Dev","IsGhost","TIsGhost","EntityInfo")
	GUI_NewField("Dev","IsCritter","TIsCrit","EntityInfo")	
	GUI_NewField("Dev","IsWerewolf","TIsWere","EntityInfo")
	GUI_NewField("Dev","IsBossMonster","TIsBoss","EntityInfo")
	GUI_NewField("Dev","IsQuestInteraction","TIsQI","EntityInfo")
	chartarg = "Player"
	
	-- CastInfo
	GUI_NewComboBox("Dev","Player/TargetInfo","ABchartarg","CastInfo","Player,Target");
	GUI_NewField("Dev","IsCasting","ABIsCast","CastInfo")
	GUI_NewField("Dev","IsChanneling","ABIsChannel","CastInfo")
	GUI_NewField("Dev","Ability","CABility","CastInfo")
	GUI_NewField("Dev","AbilityID","CAbiliID","CastInfo")
	GUI_NewField("Dev","StartTime","CAbiStar","CastInfo")
	GUI_NewField("Dev","EndTime","CAbiEnd","CastInfo")
	GUI_NewField("Dev","ABIsChanneling","CABIsChann","CastInfo")
	
	-- AbilityInfo
	ABchartarg = "Player"	
	GUI_NewNumeric("Dev","AbiliyListEntry","abilitySlot","AbilityInfo","0","999");
	GUI_NewField("Dev","Ptr","ABPtr","AbilityInfo")
	GUI_NewField("Dev","ID","ABID","AbilityInfo")
	GUI_NewField("Dev","Name","ABName","AbilityInfo")
	GUI_NewField("Dev","IsUsable","ABUsable","AbilityInfo")
	GUI_NewField("Dev","IsGroundTargeted","ABGround","AbilityInfo")	
	GUI_NewField("Dev","PowerType","ABType","AbilityInfo")	
	GUI_NewField("Dev","PowerCost","ABCost","AbilityInfo")
	GUI_NewField("Dev","Casttime","ABCastT","AbilityInfo")
	GUI_NewField("Dev","Channeltime","ABChanT","AbilityInfo")
	GUI_NewField("Dev","Range","ABRange","AbilityInfo")
	GUI_NewField("Dev","Radius","ABRadius","AbilityInfo")				
	GUI_NewField("Dev","CanCast","ABCanCa","AbilityInfo")
	GUI_NewField("Dev","IsTargetInRange","ABInRange","AbilityInfo")
	abilitySlot = 0	
	GUI_NewButton("Dev","Cast","AB_Cast","AbilityInfo")
	RegisterEventHandler("AB_Cast", Dev.Func)

	-- MovementInfo
	GUI_NewField("Dev","X: ","tb_xPos","Navigation_Movement")
	GUI_NewField("Dev","Y: ","tb_yPos","Navigation_Movement")
	GUI_NewField("Dev","Z: ","tb_zPos","Navigation_Movement")
	GUI_NewButton("Dev","GetCurrentPos","Dev.playerPosition","Navigation_Movement")
	RegisterEventHandler("Dev.playerPosition", Dev.Mov)
	GUI_NewButton("Dev","FacePosition","Dev.facePos","Navigation_Movement")
	RegisterEventHandler("Dev.facePos", Dev.Mov)
	GUI_NewButton("Dev","FaceTarget","Dev.faceTar","Navigation_Movement")
	RegisterEventHandler("Dev.faceTar", Dev.Mov)
	
	GUI_NewField("Dev","IsMoving","mimov","Navigation_Movement")
	GUI_NewField("Dev","MovementDirection","midirect","Navigation_Movement")
	GUI_NewField("Dev","Movement","MovState","Navigation_Movement")
	GUI_NewNumeric("Dev","SetMovement","mimovf","Navigation_Movement","0","16")
	mimovf = 0	
	GUI_NewButton("Dev","SetMovement","Dev.MoveDir","Navigation_Movement")
	RegisterEventHandler("Dev.MoveDir", Dev.Mov)
	GUI_NewButton("Dev","UnSetMovement","Dev.UnMoveDir","Navigation_Movement")
	RegisterEventHandler("Dev.UnMoveDir", Dev.Mov)	
	GUI_NewButton("Dev","Stop Movement","Dev.MoveS","Navigation_Movement")
	RegisterEventHandler("Dev.MoveS", Dev.Mov)	
	
	GUI_NewComboBox("Dev","NavigationType","Nnavitype","Navigation_Movement","Normal,Follow");
	GUI_NewComboBox("Dev","MovementType","Nmovetype","Navigation_Movement","Straight,Random");
	GUI_NewCheckbox("Dev","SmoothTurns","Nsmooth","Navigation_Movement");
	GUI_NewField("Dev","NavigateTo Result:","tb_nRes","Navigation_Movement")
	GUI_NewButton("Dev","NavigateTo","Dev.naviTo","Navigation_Movement")
	RegisterEventHandler("Dev.naviTo", Dev.Mov)
	GUI_NewButton("Dev","Stop Movement","Dev.MoveS","Navigation_Movement")
	GUI_NewField("Dev","RandomPtInCircleMinRadius","tb_min","Navigation_Movement")
	GUI_NewField("Dev","RandomPtInCircleMaxRadius","tb_max","Navigation_Movement")
	GUI_NewButton("Dev","GetRandomPointInCircle","Dev.ranPT","Navigation_Movement")
	GUI_NewField("Dev","DistToRandomWaypoint","tb_xdist","Navigation_Movement")
	RegisterEventHandler("Dev.ranPT", Dev.Mov)
	tb_min = 0
	tb_max = 500
	GUI_NewButton("Dev","Teleport","Dev.Teleport","Navigation_Movement")
	tb_nPoints = 0
	Nmovetype = "Straight"
	Nnavitype = "Normal"
	GUI_NewNumeric("Dev","ObstacleSize","obsSize","Navigation_Movement","1","500")
	obsSize = 2
	GUI_NewButton("Dev","AddObstacle","Dev.AddOB","Navigation_Movement")
	RegisterEventHandler("Dev.AddOB", Dev.Mov)
	GUI_NewButton("Dev","ClearObstacles","Dev.ClearOB","Navigation_Movement")
	RegisterEventHandler("Dev.ClearOB", Dev.Mov)
	GUI_NewNumeric("Dev","AvoidanceAreaSize","avoidSize","Navigation_Movement","1","500")
	avoidSize = 2
	GUI_NewButton("Dev","AddAvoidancearea","Dev.AddAA","Navigation_Movement")
	RegisterEventHandler("Dev.AddAA", Dev.Mov)
	GUI_NewButton("Dev","ClearAvoidanceareas","Dev.ClearAA","Navigation_Movement")
	RegisterEventHandler("Dev.ClearAA", Dev.Mov)
	--GUI_WindowVisible("Dev",false)	
	--GUI_UnFoldGroup("Dev","EntityInfo")
	
	
	GUI_NewButton("Dev","TOGGLE DEVMONITOR ON_OFF","Dev.Test1")
	RegisterEventHandler("Dev.Test1", Dev.Test1)
	GUI_SizeWindow("Dev",250,550)		
end

function Dev.GUIVarUpdate(Event, NewVals, OldVals)
    for k,v in pairs(NewVals) do
        if (k == "HackNoCl") then
            if ( v == "1" ) then
                d(Player:NoClip(true))
            else
                d(Player:NoClip(false))
            end        
        end	
	end
end

function Dev.Test1()
	Dev.running = not Dev.running
	if ( not Dev.running) then Dev.curTask = nil end
	d(Dev.running)
end

Dev.Obstacles = {}
Dev.AvoidanceAreas = {}
function Dev.Mov ( arg ) 
	if ( arg == "Dev.playerPosition") then
		local p = Player
		if ( p ) then
			local p = Player.pos
			tb_xPos = tostring(p.x)
			tb_yPos = tostring(p.y)
			tb_zPos = tostring(p.z)
			d(p)
		end
	elseif ( arg == "Dev.facePos" and tonumber(tb_xPos)~=nil) then
		d("SetFacing..")
		d(Player:SetFacing(tonumber(tb_xPos),tonumber(tb_yPos),tonumber(tb_zPos),true))
	elseif ( arg == "Dev.faceTar") then
		local mytarget = Player:GetTarget()
		if ( mytarget ) then
			local tPos = mytarget.pos
			if ( TableSize(tPos) > 0 ) then
				d(Player:SetFacing(tPos.x,tPos.y,tPos.z), true)
			end
		end
	
	elseif ( arg == "Dev.MoveDir") then
		d(Player:SetMovement(1,tonumber(mimovf)))
	elseif ( arg == "Dev.UnMoveDir") then
		d(Player:SetMovement(0,tonumber(mimovf)))
	elseif ( arg == "Dev.MoveS") then
		d(Player:Stop())
	elseif ( arg == "Dev.naviTo" and tonumber(tb_xPos)~=nil) then		
		local navsystem
		local navpath
		local smoothturns
		if ( Nnavitype == "Normal") then 
			navsystem = false 
		else 
			navsystem = true --FollowNavSystem
		end
		if ( Nmovetype == "Straight") then 
			navpath = false 
		else 
			navpath = true --Random
		end
		if ( Nsmooth == "0") then 
			smoothturns = false 
		else 
			smoothturns = true
		end
		d("Navigating to "..tostring(tb_xPos).." "..tostring(tb_yPos).." "..tostring(tb_zPos))
		tb_nRes = tostring(Player:MoveTo(tonumber(tb_xPos),tonumber(tb_yPos),tonumber(tb_zPos),0.5,navsystem,navpath,smoothturns))
	elseif ( arg == "Dev.Teleport") then
		if (tonumber(tb_xPos) ~= nil ) then
			d(Player:Teleport(tonumber(tb_xPos),tonumber(tb_yPos),tonumber(tb_zPos)))
		end	
	elseif ( arg == "Dev.ranPT") then
		local ppos = Player.pos
		if ( tonumber(tb_min) and tonumber(tb_max) ) then 
			local p = NavigationManager:GetRandomPointOnCircle(ppos.x,ppos.y,ppos.z,tonumber(tb_min),tonumber(tb_max))
			if ( p) then
				tb_xPos = tostring(p.x)
				tb_yPos = tostring(p.y)
				tb_zPos = tostring(p.z)				
				tb_xdist = Distance3D(p.x,p.y,p.z,ppos.x,ppos.y,ppos.z)
			end
		end

	elseif ( arg == "Dev.AddOB" and Player.onmesh) then
		local pPos = Player.pos
		if ( pPos ) then
			table.insert(Dev.Obstacles, { x=pPos.x, y=pPos.y, z=pPos.z, r=tonumber(obsSize) })
			d("Adding new Obstacle with size "..tostring(obsSize))
			NavigationManager:AddNavObstacles(Dev.Obstacles)
		end
	elseif ( arg == "Dev.ClearOB" ) then
		local pPos = Player.pos
		if ( pPos ) then
			Dev.Obstacles = {}
			d("Clearing Obstacles ")
			NavigationManager:ClearNavObstacles()
		end
	elseif ( arg == "Dev.AddAA" and Player.onmesh) then
		local pPos = Player.pos
		if ( pPos ) then
			table.insert(Dev.AvoidanceAreas, { x=pPos.x, y=pPos.y, z=pPos.z, r=tonumber(avoidSize) })
			d("adding AvoidanceArea with size "..tostring(avoidSize))
			NavigationManager:SetAvoidanceAreas(Dev.AvoidanceAreas)
		end
	elseif ( arg == "Dev.ClearAA" ) then
		local pPos = Player.pos
		if ( pPos ) then
			Dev.AvoidanceAreas = {}
			d("Clearing AvoidanceAreas ")
			NavigationManager:ClearAvoidanceAreas()
		end			
	end	
end

function Dev.Func ( arg ) 
	if ( arg == "AB_Cast") then
		local mytarget
		if ( ABchartarg == "Player" ) then
			mytarget = Player
		elseif ( ABchartarg == "Target" ) then
			mytarget = Player:GetTarget()	
		end		
		if (mytarget ~= nil and tonumber(ABID)~=nil) then
			d("Casting.."..ABName.." at "..tostring(mytarget.id))
			d(AbilityList:Cast(tonumber(ABID),mytarget.id))
		end
	end	
end
			
function Dev.UpdateWindow()
	-- CharacterInfo --
	local mytarget
	if ( chartarg == "Player" ) then
		mytarget = Player
	elseif ( chartarg == "Target" ) then
		mytarget = Player:GetTarget()
	else
		local EList = EntityList("nearest")
		if ( EList ) then			
			id,mytarget = next (EList)
		end
	end
		
	if (mytarget ~= nil) then
		
		TargetPtr = string.format( "%x",tonumber(mytarget.ptr ))
		TID = mytarget.id
		SID = mytarget.serverid
		TType = mytarget.type
		TCID = mytarget.contentid
		TName = mytarget.name
		TClass = mytarget.class
		TTarID = mytarget.targetid
		THP = tostring(mytarget.hp.current.." / "..mytarget.hp.max.." / "..mytarget.hp.percent.."%")
		TPos = (math.floor(mytarget.pos.x * 10) / 10).." / "..(math.floor(mytarget.pos.y * 10) / 10).." / "..(math.floor(mytarget.pos.z * 10) / 10)
		TOnMesh = tostring(mytarget.onmesh)
		TOnMeshExact = tostring(mytarget.onmeshexact)
		TDist = mytarget.distance --(math.floor(mytarget.distance * 100) / 100)
		TPDist = (math.floor(mytarget.pathdistance * 100) / 100)
		THead = mytarget.pos.facingangle
		TIAT = mytarget.interacttype
		TIATName = mytarget.interactname
		TAtt = mytarget.attitude
		TIsAlive = tostring(mytarget.alive)
		TIsDead = tostring(mytarget.dead)
		TIsF = tostring(mytarget.friendly)
		TIHost = tostring(mytarget.hostile)
		TAtta = tostring(mytarget.attackable)
		TTarg = tostring(mytarget.targetable)
		TKillab = tostring(mytarget.killable)
		TIsVend = tostring(mytarget.isvendor)
		TIsQI = tostring(mytarget.isquestinteraction)
		THRad = tostring(mytarget.radius).." / "..tostring(mytarget.pos.height)	
		TLOS = tostring(mytarget.los)
		TSwim = tostring(mytarget.isswimming)
		TIsfall = tostring(mytarget.isfalling)
		TIsStea = tostring(mytarget.isstealthed)
		TStealthSta = mytarget.stealthstate		
		TIsNPC = tostring(mytarget.isnpc)
		TIsGhost = tostring(mytarget.isghost)
		TIsCrit = tostring(mytarget.iscritter)
		TIsWere = tostring(mytarget.iswerewolf)
		TIsBoss = tostring(mytarget.isbossmonster)
			
		
	else
		TID = "nil"
		TCID = "nil"
		TName = "none"
		TType = "none"
		GTType = "none"
	end	
	
	-- AbilityInfo
	local mytarget
	if ( ABchartarg == "Player" ) then
		mytarget = Player
	elseif ( ABchartarg == "Target" ) then
		mytarget = Player:GetTarget()	
	end		
	if (mytarget ~= nil) then
		ABIsCast = tostring(mytarget.iscasting)
		ABIsChannel = tostring(mytarget.ischanneling)
		
		local cinfo = mytarget.castinfo
		if ( cinfo ) then
			CABility = cinfo.name
			CAbiliID = cinfo.abilityid
			CAbiStar = cinfo.starttime
			CAbiEnd = cinfo.endtime
			CABIsChann = tostring(cinfo.ischanneling)
		else
			CABility = "none"
			CAbiliID = 0
			CAbiStar = 0
			CAbiEnd = 0
			CABIsChann = 0
		end		
	end	
		
	local ABList = AbilityList("")
	local id,ab
	if (ABList) then
		local count = 1
		id,ab = next(ABList)
		while (id and ab ) do			
			if ( tonumber(count) == tonumber(abilitySlot) ) then
				break
			end
			count = count + 1
			id,ab = next(ABList,id)
		end	
	end	
	if ( id and ab ) then
		if (mytarget ~= nil) then
			ABCanCa = AbilityList:CanCast(ab.id,mytarget.id)
			ABInRange = tostring(AbilityList:IsTargetInRange(ab.id,mytarget.id))	
		end
		ABPtr = ab.ptr
		ABID = ab.id
		ABName = ab.name
		ABUsable = tostring(ab.isusable)
		ABGround = tostring(ab.isgroundtarget)
		ABType = ab.type
		ABCost = ab.cost
		ABCastT = ab.casttime
		ABChanT = ab.channeltime
		ABRange = ab.range
		ABRadius= ab.radius		
	else
		ABPtr = 0
		ABID = 0
		ABName = 0
		ABCanCa = "false"
		ABUsable = "false"
		ABGround = "false"
		ABType = 0
		ABCost = 0
		ABCastT = 0
		ABChanT = 0
		ABRange = 0
		ABRadius= 0
		ABInRange = "false"
	end
	
	-- Movement & Navigation	
	MovState = tostring(Player:GetMovementState())
	mimov = tostring(Player:IsMoving())
	local movdirs = Player:GetMovement()
	local movstr = ""
	if (movdirs.forward) then movstr = "forward" end
	if (movdirs.left) then movstr = movstr.." left" end
	if (movdirs.right) then movstr = movstr.." right" end
	if (movdirs.backward) then movstr = movstr.." backward" end
	midirect = movstr
	
end

function Dev.OnUpdateHandler( Event, ticks )
	
	local gamestate = GetGameState()
	
	if ( gamestate == 2 ) and ( ticks - Dev.lastticks > 500 ) then
		Dev.lastticks = ticks		
		if ( Dev.running ) then
			Dev.UpdateWindow()
						
			if (Dev.curTask) then
				Dev.curTask()
			end
		end
	end
end


RegisterEventHandler("Module.Initalize",Dev.ModuleInit)
RegisterEventHandler("Gameloop.Update", Dev.OnUpdateHandler)
RegisterEventHandler("GUI.Update",Dev.GUIVarUpdate)
