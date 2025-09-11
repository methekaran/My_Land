// Code your testbench here.
// Uncomment the next line for SystemC modules.
// #include <systemc>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//define the structure for the node
struct node{
    int data;
    struct node *next;//this is a pointer to the next node
};

int print_my_ll(struct node *ptr){
  struct node *local_ll;
  local_ll =ptr;
  while(local_ll!=NULL){
    printf("The value of the node is=%d\n",local_ll->data);
    local_ll=local_ll->next;
  }
  return 0;
}

int add_at_last(struct node *ptr){
  struct node *local_last=NULL;
  
  //malloc func
  local_last = (struct node*)malloc(sizeof(struct node));
  local_last->data=40;
  local_last->next=NULL;
  
  while(ptr->next!=NULL){
    //printf("Debug next addr=%p\n",ptr);
    ptr=ptr->next;
  }
  ptr->next=local_last;
  //printf("Last's addr=%p\n",ptr);
  return 0;
}

struct node* add_at_first(struct node *head){
  struct node *local_first=NULL;
  
  //malloc
  local_first = (struct node*)malloc(sizeof(struct node));
  local_first->data=5;
  local_first->next=NULL;
  
  if(head->next==NULL){
  	return 0;
  }
  else {
  	local_first->next=head;
    head=local_first;
  	return head;
  }
}

int add_in_middle(struct node *head,int loc){
	//struct 
    struct node *local_node=NULL;
  	struct node *local_head=NULL;
  	int total_size=0;
  	int indx=0;
  
    //malloc
  	local_node = (struct node*)malloc(sizeof(struct node));
  	local_head = (struct node*)malloc(sizeof(struct node));
  
  	local_head=head;
  	local_node->data=35;
  	local_node->next=NULL;
  
  	//first see if the size of the location is within the size of the link list
  while(local_head!=NULL){
  	total_size=total_size+1;
    local_head=local_head->next;
  }
  local_head=head;
  
  if(loc > total_size){
  	return 0;
  }
  else {
    while(indx!=loc){
    	local_head=local_head->next;
      	indx=indx+1;
    }
    local_node->next=local_head->next;
    local_head->next=local_node;
  }
  return 0;
}

int remove_a_node(struct node *head,int loc){
	struct node *local_head=NULL;
  	struct node *prev_node=NULL;
  
  	int total_size=0;
  
  	//malloc
  	local_head=(struct node*)malloc(sizeof(struct node));
  	prev_node=(struct node*)malloc(sizeof(struct node));
  
  	local_head=head;
  	prev_node=head;
  	
    if(loc==1){
  		head=local_head->next;
      	free(local_head);
    }
  	else {
      for(int indx=1;indx<loc-1;indx++){
        prev_node=prev_node->next;
      }
      if(prev_node==NULL || prev_node->next==NULL) return 0;
      local_head=prev_node;
      prev_node->next=local_head->next;
      free(local_head);
    
   	}
  	return 0;
}

int main(){
  
  
  //head+first+last
  struct node *head=NULL;
  struct node *first=NULL;
  struct node *last=NULL;
  
  //allocating the memory
  head = (struct node*)malloc(sizeof(struct node));
  first= (struct node*)malloc(sizeof(struct node));
  last = (struct node*)malloc(sizeof(struct node));
  
  head->data=10;
  head->next=first;
  first->data=20;
  first->next=last;
  last->data=30;
  last->next=NULL;
  
  //add a node at the end
  add_at_last(head);
  
  //add at first
  //Need to return the head from add first function otherwise main doesn't see the first added or a new node
  head=add_at_first(head);
  
  //add a node at a location 
  add_in_middle(head,3);
  
  //remove a node from a location
  remove_a_node(head,2);
  
  //print my all linked list
  print_my_ll(head);
  
  return 0;
}


