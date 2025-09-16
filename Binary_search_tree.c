#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//define the structure
struct node {
  int data;
  struct node *left;
  struct node *right;
};


bool find_value(struct node *root,int inp_val){
  while(root!=NULL){
    if(root->data==inp_val){
      printf("The value of root=%d\n",root->data);
      return 1;
    }
    else if(root->data > inp_val){
      root = root->left;
    }
    else{
      root = root->right;
    }
  }
  return 0;
}

int main(){
  
  struct node *first=NULL;
  struct node *left_1=NULL;
  struct node *right_1=NULL;
  bool bool_type;
  
  first   = (struct node*)malloc(sizeof(struct node));
  left_1  = (struct node*)malloc(sizeof(struct node));
  right_1 = (struct node*)malloc(sizeof(struct node));
  
  first->data=30;
  first->left = left_1;
  first->right= right_1;
  
  left_1->data=20;
  left_1->left=NULL;
  left_1->right=NULL;
  
  right_1->data=40;
  right_1->left=NULL;
  right_1->right=NULL;

  bool_type=find_value(first,40);
  printf("The bool_type is=%d\n",bool_type);
  return 0;
}
