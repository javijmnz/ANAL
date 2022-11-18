#include <stdlib.h>
#include <stdio.h>
#include "bstree.h"

#define LEFT(pn) pn->left
#define RIGHT(pn) pn->right
#define ROOT(ptree) ptree->root

/* START [_BSTNode] */
typedef struct _BSTNode {
    void * info;
    struct _BSTNode * left;
    struct _BSTNode * right;
    struct _BSTNode * parent;
} BSTNode;
/* END [_BSTNode] */

/* START [_BSTree] */
struct _BSTree {
    BSTNode * root;
    P_tree_ele_print print_ele;
    P_tree_ele_cmp cmp_ele;
};
/* END [_BSTree] */



/*** BSTNode TAD private functions ***/
BSTNode * _bst_node_new(){
    BSTNode * pn = NULL;

    pn = malloc(sizeof(BSTNode));
    if (!pn) {
        return NULL;
    }

    pn->left = pn->right = NULL;
    pn->info = NULL;
    pn->parent = NULL;
    return pn;
}

void _bst_node_free (BSTNode * pn){
    if (!pn) return;

    free(pn);
}

void _bst_node_free_rec (BSTNode * pn){
    if (!pn) return;

    _bst_node_free_rec(pn->left);
    _bst_node_free_rec(pn->right);
    _bst_node_free(pn);

    return;
}

int _bst_depth_rec (BSTNode * pn) {
    int depthR, depthL;
    if (!pn) return 0;

    depthL = _bst_depth_rec(pn->left);
    depthR = _bst_depth_rec(pn->right);

    if (depthR > depthL) {
        return depthR + 1;
    } else {
        return depthL + 1;
    }
}

int _bst_size_rec(BSTNode * pn) {
    int count = 0;
    if (!pn) return count;

    count += _bst_size_rec(pn->left);
    count += _bst_size_rec(pn->right);

    return count + 1;
}

int _bst_preOrder_rec (BSTNode * pn, FILE * pf, P_tree_ele_print print_ele) {
    int count = 0;
    if (!pn) return count;

    count += print_ele(pf, pn->info);
    count += _bst_preOrder_rec(pn->left, pf, print_ele);
    count += _bst_preOrder_rec(pn->right, pf, print_ele);

    return count;
}

int _bst_inOrder_rec (BSTNode * pn, FILE * pf, P_tree_ele_print print_ele) {
    int count = 0;
    if (!pn) return count;

    count += _bst_inOrder_rec(pn->left, pf, print_ele);
    count += print_ele(pf, pn->info);
    count += _bst_inOrder_rec(pn->right, pf, print_ele);

    return count;
}

int _bst_postOrder_rec (BSTNode * pn, FILE * pf, P_tree_ele_print print_ele) {
    int count = 0;
    if (!pn) return count;

    count += _bst_postOrder_rec(pn->left, pf, print_ele);
    count += _bst_postOrder_rec(pn->right, pf, print_ele);
    count += print_ele(pf, pn->info);

    return count;
}

/*** BSTree TAD functions ***/
BSTree * tree_init(P_tree_ele_print print_ele, P_tree_ele_cmp cmp_ele){
    if (!print_ele || !cmp_ele) return NULL;

    BSTree * tree = malloc (sizeof(BSTree));
    if (!tree) {
        return NULL;
    }

    tree->root = NULL;
    tree->print_ele = print_ele;
    tree->cmp_ele = cmp_ele;

    return tree;
}

void tree_destroy (BSTree * tree) {
    if (!tree) return;

    _bst_node_free_rec(tree->root);

    free(tree);
    return;
}

Bool tree_isEmpty( const BSTree * tree){
    if (!tree || !tree->root) return TRUE;
    return FALSE;
}

int tree_depth (const BSTree * tree){
    if (!tree) return -1;

    return _bst_depth_rec(tree->root);
}

size_t tree_size(const BSTree * tree) {
    if (!tree) return -1;

    return _bst_size_rec(tree->root);
}

int tree_preOrder (FILE *f, const BSTree * tree){
    if (!f || !tree) return -1;

    return _bst_preOrder_rec(tree->root, f, tree->print_ele) + fprintf(f, "\n");
}

int tree_inOrder (FILE *f, const BSTree * tree){
    if (!f || !tree) return -1;

    return _bst_inOrder_rec(tree->root, f, tree->print_ele) + fprintf(f, "\n");
}

int tree_postOrder (FILE *f, const BSTree * tree){
    if (!f || !tree) return -1;

    return _bst_postOrder_rec(tree->root, f, tree->print_ele) + fprintf(f, "\n");
}


/**** TODO: find_min, find_max, insert, contains, remove ****/

void *_bst_find_min_rec(BSTNode *pn){
    // BASE
    if (!pn->left)
        return pn->info;

    // RECURSION
    return _bst_find_min_rec(pn->left);
}

void * tree_find_min (BSTree * tree) {
    // Check valid arguments
    if (!tree)
        return NULL;
    
    // Empty tree
    if (!tree->root)
        return NULL;
    
    return _bst_find_min_rec(tree->root);
}

void *_bst_find_max_rec(BSTNode *pn){
    // BASE
    if (!pn->right)
        return pn->info;
    
    // RECURSION
    return _bst_find_max_rec(pn->right);
}

void * tree_find_max (BSTree * tree){
    // Check valid arguments
    if (!tree)
        return NULL;
    
    // Empty tree
    if (!tree->root)
        return NULL;
    
    return _bst_find_max_rec(tree->root);
}

// tree_insert: Implementation with double pointer
Status _bst_insert_rec(BSTNode **pn, BSTNode *parent, const void *elem, P_tree_ele_cmp cmp_ele) {
    // BASE - Empty tree: insert
    if (!(*pn)) {
        *pn = _bst_node_new();
        if (!(*pn))
            return ERROR;
        (*pn)->info = (void *)elem;
        (*pn)->parent = parent;
        return OK;
    }
    
    // RECURSION
    if (cmp_ele(elem, (*pn)->info) == 0)
        // The element is already in the tree
        return OK;
    else if (cmp_ele(elem, (*pn)->info) > 0)
        // The element is greater than the root -> It goes to the right
        return _bst_insert_rec(&((*pn)->right), *pn, elem, cmp_ele);
    else
        // The element is lower than the root -> It goes to the left
        return _bst_insert_rec(&((*pn)->left), *pn, elem, cmp_ele);
}

Status tree_insert (BSTree * tree, const void * elem) {
    // Check valid arguments
    if (!tree || !elem)
        return ERROR;
    
    return _bst_insert_rec(&(tree->root), NULL, elem, tree->cmp_ele);
}

// tree_insert: Implementation without double pointer
/* Status _bst_insert_rec(BSTNode *pn, BSTNode *parent, const void *elem, P_tree_ele_cmp cmp_ele, P_tree_ele_print print_ele) {
    BSTNode *aux;
    
    if (!pn) {
        aux = _bst_node_new();
        if (!aux)
            return ERROR;
        aux->info = (void*)elem;
        aux->parent = parent;
        if (cmp_ele(elem, parent->info) > 0) {
            parent->right = aux;
        } else if (cmp_ele(elem, parent->info) < 0) {
            parent->left = aux;
        }
        return OK;
    }

    if (cmp_ele(elem, pn->info) == 0)
        // The element is already in the tree
        return OK;
    else if (cmp_ele(elem, pn->info) > 0)
        // The element is greater than the root -> It goes to the right
        return _bst_insert_rec(pn->right, pn, elem, cmp_ele, print_ele);
    else
        // The element is lower than the root -> It goes to the left
        return _bst_insert_rec(pn->left, pn, elem, cmp_ele, print_ele);

}

Status tree_insert (BSTree * tree, const void * elem) {
    BSTNode *aux;
    if (!tree || !elem)
        return ERROR;
    
    if (!tree->root) {
        aux = _bst_node_new();
        if (!aux)
            return ERROR;
        aux->info = (void*)elem;
        aux->parent = NULL;   
        tree->root = aux;
        return OK; 
    }      
    
    return _bst_insert_rec(tree->root, NULL, elem, tree->cmp_ele, tree->print_ele);
}
*/

Bool _bst_contains_rec(BSTNode *pn, const void *elem, P_tree_ele_cmp cmp_ele) {
    // BASE 1: We reached end of tree going through potential position of elem (and it was not there)
    if (!pn) 
        return FALSE;

    // BASE 2: We found elem
    if (cmp_ele(elem, pn->info) == 0)
        // The element is already in the tree
        return TRUE;
    
    // RECURSION
    if (cmp_ele(elem, pn->info) > 0)
        // The element is greater than the root -> It must be to the right
        return _bst_contains_rec(pn->right, elem, cmp_ele);
    else
        // The element is lower than the root -> It must be to the left
        return _bst_contains_rec(pn->left, elem, cmp_ele);
}

Bool tree_contains (BSTree * tree, const void * elem) {
    // Check valid arguments
    if (!tree || !elem)
        return FALSE;
    
    return _bst_contains_rec(tree->root, elem, tree->cmp_ele); 
}

BSTNode * _bst_remove_rec(BSTNode **ppn, const void * elem, P_tree_ele_cmp cmp_ele){
    int cmp;
    BSTNode *pnaux = NULL, *pparent = NULL;
    void *max = NULL;
    
    // BASE 1: We reached end of tree going through potential position of elem (and it was not there)
    if (!*ppn)
        return NULL;
    
    // RECURSION
    cmp = cmp_ele(elem, (*ppn)->info);
    if (cmp < 0) 
        return _bst_remove_rec(&((*ppn)->left), elem, cmp_ele);
    else if (cmp > 0)
        return _bst_remove_rec(&((*ppn)->right), elem, cmp_ele);
    
    // BASE 2: We found elem
        if (!(*ppn)->left && !(*ppn)->right){
            printf("both null   ");
            _bst_node_free(*ppn);
            *ppn = NULL;
            return NULL;
        } else if (!(*ppn)->left){
            printf("left null   ");
            pnaux = (*ppn)->right;
            pparent = (*ppn)->parent;
            _bst_node_free(*ppn);
            *ppn = pnaux;
            (*ppn)->parent = pparent;
            return *ppn;
        } else if (!(*ppn)->right){
            printf("right null   ");
            pnaux = (*ppn)->left;
            pparent = (*ppn)->parent;
            _bst_node_free(*ppn);
            *ppn = pnaux;
            (*ppn)->parent = pparent;
            return *ppn;
        } else {
            printf("no null   ");
            max = _bst_find_max_rec((*ppn)->left);
            
            _bst_remove_rec(ppn, max, cmp_ele);
            (*ppn)->info = max;

            return *ppn;
        }
        
        return *ppn;
}

Status tree_remove (BSTree * tree, const void * elem) {
    if (!tree || !elem)
        return ERROR;
    
    _bst_remove_rec(&(tree->root), elem, tree->cmp_ele);

    return OK;
}

