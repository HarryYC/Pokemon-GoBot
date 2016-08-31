require "phoneOP"
require "pokeOP"

init("com.nianticlabs.pokemongo", 0)

function gameLogic()
  if (loggedIn() == true) then
    checkPokeStop()
  else
    mSleep(2000)
    local xHome, yHome = findImageInRegionFuzzy("egg.png", 65, 430, 801, 667, 1084, 0) 
    if xHome ~= -1 and yHome ~= -1 then 
      sysLog("hatching egg")
      mSleep(1000)
      
      tap(540, 972) --tap on screen to hatch egg
      mSleep(25000)

      backToMain()
      checkHatch()
    elseif (isBattle() == true) then
						sysLog("Battle")
						mSleep(1000)		
		else
      sysLog("no hatching egg")
      backToMain()
    end
  end
end

function main()
  local count = 0
  checkHatch()
  while (true) do
    count = checkRespond(count)
    mSleep(500)
    if (count < 15) then -- if server is responding, execute game operations
      gameLogic()
    end
    if (count > 100) then --count bigger than 100 means server is not responding, restart the app
      sysLog("count now is: "..count..", restart")
      restartApp()
      local timeOut = 1 
      while (loggedIn() == false) do
        mSleep(500)
        timeOut = timeOut + 1
        sysLog("timeout: "..timeOut)
        if (timeOut > 60) then 
          break;
        end
      end
      if (loggedIn() == true) then
        timeOut = 1
        count = 0
        checkHatch()
      end
      mSleep(500)
    end
  end
end

function findPidgey()
  local x, y = findColorInRegionFuzzy(0xfbe683,95, 205, 1077, 960, 1467)
  if x ~= -1 and y ~= -1 then 
    sysLog(x..y)
    tap(x, y)
  end
  return
end

function throwBall()
  local x, y = findColorInRegionFuzzy(0xffffff,100, 300, 1611, 800, 300)
  if x ~= -1 and y ~= -1 then
    local i = 3.0
    sysLog(y.." "..y * i)
    --swap(553, 1611, 553, y + y / 1.8)
    touchDown(1, 553, 1611)
    mSleep(100)
    touchMove(1, 553, y * i)
    mSleep(100)
    touchUp(1, 553, y * i)
  end
end
function fight()
  while (true) do
    tap(517,581)
    mSleep(100)
  end
end
--main()
--throwBall()
--findPidgey()
while (true) do
--	findPidgey()
--	if (isBattle() == true) then
--		throwBall()
--	end
	local xHome, yHome = findImageInRegionFuzzy("ok.png", 25, 485, 1127, 594, 1192, 0) 
	if xHome ~= -1 and yHome ~= -1 then
		sysLog("yes")
		tap(xHome, yHome)
		mSleep(100)
		backToMain()
	end
end