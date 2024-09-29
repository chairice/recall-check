#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "returning.h"

#define MAX_LINE_LENGTH 256
#define MAX_ITEMS 10

// Define the Item structure
struct Item {
    char item_name[100];      // Item name
    char prod_num[14];             // Product number
    char date_recalled[9];   // Date recalled (MM/DD/YY)
};

// Function to create and initialize an Item
struct Item createItem(const char *item_name, const char *prod_num, const char *date_recalled) {
    struct Item newItem;
    // Copy strings and ensure null termination
    strncpy(newItem.item_name, item_name, sizeof(newItem.item_name) - 1);
    newItem.item_name[sizeof(newItem.item_name) - 1] = '\0'; // Ensure null termination

    strncpy(newItem.prod_num, prod_num, sizeof(newItem.prod_num) - 1);
    newItem.prod_num[sizeof(newItem.prod_num) - 1] = '\0'; // Ensure null termination

    strncpy(newItem.date_recalled, date_recalled, sizeof(newItem.date_recalled) - 1);
    newItem.date_recalled[sizeof(newItem.date_recalled) - 1] = '\0'; // Ensure null termination

    return newItem; // Return the new Item
}

// Function to print Item details
void printItem(struct Item item) {
    printf("Item Name: %s\n", item.item_name);
    printf("Product Number: %s\n", item.prod_num);
    printf("Date Recalled: %s\n\n", item.date_recalled);
}

struct Returning itemParser(char* fileName, char barcodes[]) {
    FILE *file = fopen(fileName, "r");
    if (file == NULL) {
        printf("Error: Could not open file\n");
        exit(-1);
    }

    char line[MAX_LINE_LENGTH];
    struct Item items[MAX_ITEMS];
    int itemCount = 0;

    // Read first line
    fgets(line, sizeof(line), file);

    while (fgets(line, sizeof(line), file)) {
        // Remove newline character
        line[strcspn(line, "\n")] = '\0';

        char *itemName = strtok(line, ",");
        char *prodNum = strtok(NULL, ",");
        char *dateRecalled = strtok(NULL, ",");

        if (itemName != NULL && prodNum != NULL && dateRecalled != NULL) {
            if (itemCount < MAX_ITEMS) {
                items[itemCount++] = createItem(itemName, prodNum, dateRecalled);
            }
        }
    }

    // Close the file
    fclose(file);

    // Output the parsed data
    printf("Parsed CSV Data:\n");
    for (int i = 0; i < itemCount; i++) {
        printItem(items[i]);
    }
    struct Returning r;
    for (int i = 0; i < itemCount; i++){
        strcpy(r.item_names[i], items[i].item_name);
        strcpy(r.date_recalled[i], items[i].date_recalled);
        r.is_match[i] = 0;
        for (int j = 0; j < sizeof(barcodes); j++){
            if (strcmp(&barcodes[j], items[i].prod_num) == 0){
                r.is_match[i] = 1;
            }
        }
    }
}

int main(){
    struct Returning r; 
    r = itemParser("UPC.csv", )
}
