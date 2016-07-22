function getPoint()
  dialog("请点击屏幕一次", 0)
  x,y = catchTouchPoint();
  mSleep(1000);
  dialog("x:"..x.." y:"..y, 0)
end

function tap(x, y)
  touchDown(1, x, y)
  mSleep(50)
  touchUp(1, x, y)  
end

function swap(x1, x2, y1, y2)
  touchDown(1, x1, y1)
  mSleep(100)
  touchMove(1, x2, y2)
  mSleep(100)
  touchUp(1, x2, y2)  
end

function overTwoHours(t, second)
  if (getNetTime() - t > second) then 
    return true
  else
    return false
  end
end

function restartApp()
  local flag = appIsRunning("com.nianticlabs.pokemongo")
  if (flag ~= 0) then
    closeApp("com.nianticlabs.pokemongo")
    mSleep(1000)
  end
  runApp("com.nianticlabs.pokemongo")
  mSleep(20000)
end

