static int g_currentClient;

void UseCase_SetCurrentClient(int client) {
    g_currentClient = client;
}

Action UseCase_OnTeamFull(int team, bool& full) {
    if (team < TEAM_ALLIES) {
        return Plugin_Continue;
    }

    if (IsClientHasTeamFullFlags(g_currentClient)) {
        full = false;

        return Plugin_Stop;
    }

    return Plugin_Continue;
}

Action UseCase_OnTeamStacked(int team, bool& stacked) {
    if (team < TEAM_ALLIES) {
        return Plugin_Continue;
    }

    if (IsClientHasTeamStackedFlags(g_currentClient)) {
        stacked = false;

        return Plugin_Stop;
    }

    return Plugin_Continue;
}

Action UseCase_OnCanPlayerJoinClass(int client, bool& canJoin) {
    if (IsClientHasClassFlags(client)) {
        canJoin = true;

        return Plugin_Stop;
    }

    return Plugin_Continue;
}

static bool IsClientHasTeamFullFlags(int client) {
    int flags = Variable_TeamFullFlags();

    return IsAnyFlagSet(client, flags);
}

static bool IsClientHasTeamStackedFlags(int client) {
    int flags = Variable_TeamStackedFlags();

    return IsAnyFlagSet(client, flags);
}

static bool IsClientHasClassFlags(int client) {
    int flags = Variable_ClassFlags();

    return IsAnyFlagSet(client, flags);
}

static bool IsAnyFlagSet(int client, int flags) {
    int userFlags = GetUserFlagBits(client);

    return (userFlags & flags) > 0;
}
