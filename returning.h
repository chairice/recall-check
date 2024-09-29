#ifndef RETURNING_H
#define RETURNING_H

struct Returning {
    char item_names[7][100];
    int is_match[7]; //0 = false NOT IN RECALLED, 1 = true IN RECALLED
    char date_recalled[7][9];
};

#endif // ITEM_H
