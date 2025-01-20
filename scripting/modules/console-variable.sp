static ConVar g_teamFullFlags;
static ConVar g_teamStackedFlags;
static ConVar g_classFlags;

void Variable_Create() {
    g_teamFullFlags = CreateConVar("sm_joincontrol_flags_team_full", "b", "Team full flags");
    g_teamStackedFlags = CreateConVar("sm_joincontrol_flags_team_stacked", "b", "Team stacked flags");
    g_classFlags = CreateConVar("sm_joincontrol_flags_class", "b", "Class flags");
}

int Variable_TeamFullFlags() {
    char flags[AdminFlags_TOTAL + 1];

    g_teamFullFlags.GetString(flags, sizeof(flags));

    return ReadFlagString(flags);
}

int Variable_TeamStackedFlags() {
    char flags[AdminFlags_TOTAL + 1];

    g_teamStackedFlags.GetString(flags, sizeof(flags));

    return ReadFlagString(flags);
}

int Variable_ClassFlags() {
    char flags[AdminFlags_TOTAL + 1];

    g_classFlags.GetString(flags, sizeof(flags));

    return ReadFlagString(flags);
}
