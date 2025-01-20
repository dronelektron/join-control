static ConVar g_teamFlags;
static ConVar g_classFlags;

void Variable_Create() {
    g_teamFlags = CreateConVar("sm_joincontrol_immunity_team", "b", "Team immunity flags");
    g_classFlags = CreateConVar("sm_joincontrol_immunity_class", "b", "Class immunity flags");
}

int Variable_TeamFlags() {
    char flags[AdminFlags_TOTAL + 1];

    g_teamFlags.GetString(flags, sizeof(flags));

    return ReadFlagString(flags);
}

int Variable_ClassFlags() {
    char flags[AdminFlags_TOTAL + 1];

    g_classFlags.GetString(flags, sizeof(flags));

    return ReadFlagString(flags);
}
