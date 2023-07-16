int cmp(const char *s1, const char *s2) {
    while (*s1 != '\0' && *s2 != '\0') {
        if (*s1 > *s2)
            return 1;
        else if (*s1 < *s2)
            return -1;
        else {
            s1++;
            s2++;
        }
    }
    if (*s1 == '\0' && *s2 != '\0')
        return -1;
    else if (*s1 != '\0' && *s2 == '\0')
        return 1;
    else
        return 0;
}
