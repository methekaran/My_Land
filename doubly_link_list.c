// Code your testbench here.
// Uncomment the next line for SystemC modules.
// #include <systemc>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

struct node{
	int data;
  	struct node  *next;
  	struct node  *prev;
};
//10->  20 ->30
// 10<- 20 <-30 
//30->20->10

struct node* reverse_a_list(struct node *ptr){
	struct node*next=NULL;
	struct node*prev=NULL;
  	struct node*curr=NULL;
  
  	curr=ptr;
  
  while(curr!=NULL){
  	next=curr->next;
    curr->next=prev;
    curr->prev=next;
    prev=curr;
    curr=next;
  }
  
  return prev;
}
int print_dl(struct node *ptr){
  
  struct node*l_p=NULL;
  
  l_p=ptr;
  
  while(l_p!=NULL){
  	printf("The doubly link list values are=%d\n",l_p->data);
    l_p=l_p->next;
  }
  return 0;
}
int main(){
  
  //create three nodes 
  
  struct node *head=NULL;
  struct node *first=NULL;
  struct node *last=NULL;
  
  head=(struct node*)malloc(sizeof(struct node));
  first=(struct node*)malloc(sizeof(struct node));
  last=(struct node*)malloc(sizeof(struct node));
  
  head->data=10;
  head->next=first;
  head->prev=NULL;
  
  first->data=20;
  first->next=last;
  first->prev=head;
  
  last->data=30;
  last->next=NULL;
  last->prev=first;
  
  head=reverse_a_list(head);
  
  print_dl(head);
  
  return 0;

}
