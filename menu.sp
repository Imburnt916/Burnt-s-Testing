#include <sourcemod>

public OnPluginStart(){

    RegConsoleCmd("sm_leaders", menu_command, "Leaders");

}

public Action:menu_command(client, args)
{
	if (!IsClientValid(client)){
		PrintToConsole(client, "Command can only be used in game");
		return Plugin_Handled;
	}
	new Handle:panel = CreatePanel();
	SetPanelTitle(panel, "Leaders of Jailbreak:");
	DrawPanelItem(panel, "Bonbon");
	DrawPanelItem(panel, "Icon");
	DrawPanelItem(panel, "Burnt");
	SendPanelToClient(panel, client, command_menu, 20);
 
	CloseHandle(panel);
	return Plugin_Handled;
}
public command_menu(Handle:menu, MenuAction:action, param1, param2, param3)
{
	new client = param1;
	if (action == MenuAction_Select)
	{
		switch(param2){
			case 1:
			{
	        	PrintToChat(client, " \x0B\x10Bonbon is the almighty jailbreak coder", param2);
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
