require "phoneOP"



function backToMain()
  local xHome, yHome = findImageInRegionFuzzy("homeBall.png", 65, 460, 1530, 620, 1689, 0)
	backCount = 0
  while (xHome == -1) do
    if (isBattle() == true) then
      tap(136, 173)
    end
    sysLog("get back to main")
    tap(540, 1607)
    mSleep(1500)
		backCount = backCount + 1
		if (backCount > 3) then
			break;
		end
    xHome, yHome = findImageInRegionFuzzy("homeBall.png", 65, 460, 1530, 620, 1689, 0)
  end	
  mSleep(500)
end

function checkHatch() 
  --from main to egg screen
  local found = false
  while (found ~= true) do
    tap(540, 1607) 
    mSleep(1000)
    tap(230, 1452)
    mSleep(1500)
    tap(806, 203)
    mSleep(1000)
    
    --check if egg is hatching
    local xH, yH = findColorInRegionFuzzy(0xf6572b, 90, 75, 347, 1010, 636)
    if xH ~= -1 and yH ~= -1 then  
      --tap(x, y)
      sysLog("return to main")
      found = true
      tap(540, 1607) --return to main
    else                         
      tap(186, 440)	-- click first egg
      mSleep(1000)
      tap(546, 1130) -- click start
      mSleep(1000)
      local xI, yI = findColorInRegionFuzzy(0xf6572b, 90, 17, 1198, 1021, 1488) --find incubator
      if xI ~= -1 and yI ~= -1 then	--if found, click
        sysLog("found incubator")
        tap(xI, yI)
        mSleep(1000)
        backToMain()
        found = true
      else
        sysLog("Can not find incubator")				
        backToMain()
      end
    end
  end
end

function findPokeStop()
  local xStop, yStop = findColorInRegionFuzzy(0x44ffff,100, 205, 1077, 960, 1467)
  if xStop == -1 and yStop == -1 then 
    return false
  else
    tap(xStop, yStop)
    sysLog("x:"..xStop.." y:"..yStop)
    return true
  end
end

function isBattle()
  local x, y = findImageInRegionFuzzy("escape.png", 70, 39, 62, 217, 222, 0) --find escape icon
  if x == -1 and y == -1 then
--    sysLog("f")
    return false
  else
--    sysLog("t")
		tap(x, y)
		mSleep(1000)
    return true
  end
end

function checkPokeStop()
  if (findPokeStop() == true) then
    --sysLog("find Stop")
    mSleep(1500)
    swap(289, 256, 1368, 1368)
    mSleep(500)
    backToMain()
  end
end

function checkRespond(count)
  local xHome, yHome = findColorInRegionFuzzy(0xfefefe, 95, 88, 230, 96, 241)
  if (xHome ~= -1) then
--    if (count > 100) then
--    end
    count = count + 1
		sysLog("count: "..count)
  else
    count = 0
  end
  return count
end

function loggedIn()
  local xHome, yHome = findImageInRegionFuzzy("homeBall.png", 55, 460, 1530, 620, 1689, 0)
  if (xHome ~= -1) then
--		sysLog("t")
    return true
  else
--		sysLog("f")
		tap (541, 1023)
    return false
  end
end

function loggedIn2()
  local xHome, yHome = findImageInRegionFuzzy("login.png", 75, 457, 1522, 630, 1675, 0)
  if (xHome ~= -1) then
--		sysLog("t")
    return true
  else
--		sysLog("f")
    return false
  end
end