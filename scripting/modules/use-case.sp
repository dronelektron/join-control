static int g_currentClient;

void UseCase_SetCurrentClient(int client) {
    g_currentClient = client;
}

Action UseCase_OnCanPlayerJoinTeam(int team, bool& block) {
    if (team < TEAM_ALLIES) {
        return Plugin_Continue;
    }

    if (IsClientHasTeamImmunity(g_currentClient)) {
        block = false;

        return Plugin_Stop;
    }

    return Plugin_Continue;
}

Action UseCase_OnCanPlayerJoinClass(int client, bool& canJoin) {
    if (IsClientHasClassImmunity(client)) {
        canJoin = true;

        return Plugin_Stop;
    }

    return Plugin_Continue;
}

static bool IsClientHasTeamImmunity(int client) {
    int teamFlags = Variable_TeamFlags();

    return IsAnyFlagSet(client, teamFlags);
}

static bool IsClientHasClassImmunity(int client) {
    int classFlags = Variable_ClassFlags();

    return IsAnyFlagSet(client, classFlags);
}

static bool IsAnyFlagSet(int client, int flags) {
    int userFlags = GetUserFlagBits(client);

    return (userFlags & flags) > 0;
}
