static ConVar g_teamFullMode;
static ConVar g_teamFullFlags;
static ConVar g_teamStackedMode;
static ConVar g_teamStackedFlags;
static ConVar g_classMode;
static ConVar g_classFlags;

void Variable_Create() {
    g_teamFullMode = CreateConVar("sm_joincontrol_mode_team_full", "0", "Team full mode");
    g_teamFullFlags = CreateConVar("sm_joincontrol_flags_team_full", "b", "Team full flags");
    g_teamStackedMode = CreateConVar("sm_joincontrol_mode_team_stacked", "0", "Team stacked mode");
    g_teamStackedFlags = CreateConVar("sm_joincontrol_flags_team_stacked", "b", "Team stacked flags");
    g_classMode = CreateConVar("sm_joincontrol_mode_class", "0", "Class mode");
    g_classFlags = CreateConVar("sm_joincontrol_flags_class", "b", "Class flags");
}

int Variable_TeamFullMode() {
    return g_teamFullMode.IntValue;
}

int Variable_TeamFullFlags() {
    return FlagsToInt(g_teamFullFlags);
}

int Variable_TeamStackedMode() {
    return g_teamStackedMode.IntValue;
}

int Variable_TeamStackedFlags() {
    return FlagsToInt(g_teamStackedFlags);
}

int Variable_ClassMode() {
    return g_classMode.IntValue;
}

int Variable_ClassFlags() {
    return FlagsToInt(g_classFlags);
}

static int FlagsToInt(ConVar variable) {
    char flags[AdminFlags_TOTAL + 1];

    variable.GetString(flags, sizeof(flags));

    return ReadFlagString(flags);
}
