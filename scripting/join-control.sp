#include <sourcemod>

#include "dod-hooks/api"

#include "join-control/console-variable"
#include "join-control/use-case"

#include "modules/console-variable.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Join control",
    author = "Dron-elektron",
    description = "Allows you to control the player's team and class",
    version = "1.0.2",
    url = "https://github.com/dronelektron/join-control"
};

public void OnPluginStart() {
    Variable_Create();
    AutoExecConfig(_, "join-control");
}

public Action Player_OnJoinTeam(int client, int& team) {
    UseCase_SetCurrentClient(client);

    return Plugin_Continue;
}

public Action GameRules_OnTeamFull(int team, bool& full) {
    return UseCase_OnTeamFull(team, full);
}

public Action GameRules_OnTeamStacked(int newTeam, int currentTeam, bool& stacked) {
    return UseCase_OnTeamStacked(newTeam, stacked);
}

public Action GameRules_OnCanPlayerJoinClass(int client, int class, bool& canJoin) {
    return UseCase_OnCanPlayerJoinClass(client, canJoin);
}
