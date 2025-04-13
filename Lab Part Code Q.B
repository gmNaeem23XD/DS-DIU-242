
#include <stdio.h>
#include <stdlib.h>

struct Node {
    float data;
    struct Node* next;
};

struct Node* createNode(float value) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = value;
    newNode->next = NULL;
    return newNode;
}

struct Node* insertEnd(struct Node* head, float value) {
    struct Node* newNode = createNode(value);
    if (head == NULL)
        return newNode;

    struct Node* temp = head;
    while (temp->next != NULL)
        temp = temp->next;

    temp->next = newNode;
    return head;
}

struct Node* deleteXX(struct Node* head, float key) {
    if (head == NULL) return NULL;

    if (head->data == key) {
        struct Node* temp = head;
        head = head->next;
        free(temp);
        return head;
    }

    struct Node* current = head;
    while (current->next != NULL && current->next->data != key) {
        current = current->next;
    }

    if (current->next == NULL) {
        printf("XX (%.2f) not found in the list.\n", key);
        return head;
    }

    struct Node* temp = current->next;
    current->next = temp->next;
    free(temp);

    return head;
}

void printReverse(struct Node* head) {
    if (head == NULL) return;
    printReverse(head->next);
    printf("%.2f ", head->data);
}

void printList(struct Node* head) {
    while (head != NULL) {
        printf("%.2f ", head->data);
        head = head->next;
    }
    printf("\n");
}

int main() {
   
    struct Node* head = NULL;
    head = insertEnd(head, 10.5);
    head = insertEnd(head, 6.54);  
    head = insertEnd(head, 15.7);
    head = insertEnd(head, 34.3);

    printf("Original Linked List:\n");
    printList(head);

    float XX = 6.54;
    head = deleteXX(head, XX);

    printf("\nAfter Deleting XX (%.2f):\n", XX);
    printList(head);

    printf("\nLinked List in Reverse Order:\n");
    printReverse(head);
    printf("\n");

    return 0;
}
