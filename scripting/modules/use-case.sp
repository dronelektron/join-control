static int g_currentClient;

void UseCase_SetCurrentClient(int client) {
    g_currentClient = client;
}

Action UseCase_OnTeamFull(int team, bool& full) {
    int mode = Variable_TeamFullMode();

    if (mode == MODE_DEFAULT || team < TEAM_ALLIES) {
        return Plugin_Continue;
    }

    bool flagAccess = mode == MODE_FLAGS && IsClientHasTeamFullFlags(g_currentClient);
    bool allAccess = mode == MODE_ALL;

    if (flagAccess || allAccess) {
        full = false;

        return Plugin_Stop;
    }

    return Plugin_Continue;
}

Action UseCase_OnTeamStacked(int team, bool& stacked) {
    int mode = Variable_TeamStackedMode();

    if (mode == MODE_DEFAULT || team < TEAM_ALLIES) {
        return Plugin_Continue;
    }

    bool flagAccess = mode == MODE_FLAGS && IsClientHasTeamStackedFlags(g_currentClient);
    bool allAccess = mode == MODE_ALL;

    if (flagAccess || allAccess) {
        stacked = false;

        return Plugin_Stop;
    }

    return Plugin_Continue;
}

Action UseCase_OnCanPlayerJoinClass(int client, bool& canJoin) {
    int mode = Variable_ClassMode();

    if (mode == MODE_DEFAULT) {
        return Plugin_Continue;
    }

    bool flagAccess = mode == MODE_FLAGS && IsClientHasClassFlags(client);
    bool allAccess = mode == MODE_ALL;

    if (flagAccess || allAccess) {
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
