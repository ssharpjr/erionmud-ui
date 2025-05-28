-- Does a full UI refresh

function UIRefresh (event)
  InitUI()
  echo("UI Refreshed!\n")
end

registerAnonymousEventHandler("UI_Refresh", "UIRefresh")

