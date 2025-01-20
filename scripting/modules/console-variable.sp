static ConVar g_teamFullFlags;
static ConVar g_teamStackedFlags;
static ConVar g_classFlags;

void Variable_Create() {
    g_teamFullFlags = CreateConVar("sm_joincontrol_flags_team_full", "b", "Team full flags");
    g_teamStackedFlags = CreateConVar("sm_joincontrol_flags_team_stacked", "b", "Team stacked flags");
    g_classFlags = CreateConVar("sm_joincontrol_flags_class", "b", "Class flags");
}

int Variable_TeamFullFlags() {
    return FlagsToInt(g_teamFullFlags);
}

int Variable_TeamStackedFlags() {
    return FlagsToInt(g_teamStackedFlags);
}

int Variable_ClassFlags() {
    return FlagsToInt(g_classFlags);
}

static int FlagsToInt(ConVar variable) {
    char flags[AdminFlags_TOTAL + 1];

    variable.GetString(flags, sizeof(flags));

    return ReadFlagString(flags);
}
