static int g_currentClient;

void UseCase_SetCurrentClient(int client) {
    g_currentClient = client;
}

Action UseCase_OnTeamFull(int team, bool& full) {
    if (team < TEAM_ALLIES) {
        return Plugin_Continue;
    }

    int mode = Variable_TeamFullMode();
    int flags = Variable_TeamFullFlags();

    return HasAccess(g_currentClient, mode, flags, false, full);
}

Action UseCase_OnTeamStacked(int team, bool& stacked) {
    if (team < TEAM_ALLIES) {
        return Plugin_Continue;
    }

    int mode = Variable_TeamStackedMode();
    int flags = Variable_TeamStackedFlags();

    return HasAccess(g_currentClient, mode, flags, false, stacked);
}

Action UseCase_OnCanPlayerJoinClass(int client, bool& canJoin) {
    int mode = Variable_ClassMode();
    int flags = Variable_ClassFlags();

    return HasAccess(client, mode, flags, true, canJoin);
}

static Action HasAccess(int client, int mode, int flags, bool value, bool& result) {
    if (mode == MODE_DEFAULT) {
        return Plugin_Continue;
    }

    bool flagAccess = mode == MODE_FLAGS && HasFlags(client, flags);
    bool allAccess = mode == MODE_ALL;

    if (flagAccess || allAccess) {
        result = value;

        return Plugin_Stop;
    }

    return Plugin_Continue;
}

static bool HasFlags(int client, int flags) {
    int userFlags = GetUserFlagBits(client);

    if (IsBitSet(userFlags, ADMFLAG_ROOT)) {
        userFlags = (1 << AdminFlags_TOTAL) - 1;
    }

    return (userFlags & flags) > 0;
}

static bool IsBitSet(int flags, int bit) {
    return (flags & bit) == bit;
}
