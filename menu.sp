#include <sourcemod>

public OnPluginStart(){

    RegConsoleCmd("sm_menu", menu_command, "Menu");

}

public Action:menu_command(client, args)
{
	if (!IsClientValid(client)){
		PrintToConsole(client, "Command can only be used in game");
		return Plugin_Handled;
	}
	new Handle:panel = CreatePanel();
	SetPanelTitle(panel, "Options:");
	DrawPanelItem(panel, "1");
	SendPanelToClient(panel, client, DoNothing, 20);
 
	CloseHandle(panel);
	return Plugin_Handled;
}
public DoNothing(Handle:menu, MenuAction:action, param1, param2)
{
    //Filler
}


public bool:IsClientValid(client)
{
	if(client > 0 && client <= MaxClients && IsClientInGame(client))
	{
		return true;
	}
	return false;
}