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
	SendPanelToClient(panel, client, command_menu, 20);
 
	CloseHandle(panel);
	return Plugin_Handled;
}
public command_menu(Handle:menu, MenuAction:action, param1, param2)
{
	new client = param1;
	if (action == MenuAction_Select)
	{
		switch(param2){
			case 1:
			{
	        	PrintToChat(client, "Chose Option: %d", param2);
			}
		}
	} 
}


public bool:IsClientValid(client)
{
	if(client > 0 && client <= MaxClients && IsClientInGame(client))
	{
		return true;
	}
	return false;
}
