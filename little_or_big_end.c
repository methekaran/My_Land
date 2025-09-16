int check_little_or_big(){

  uint32_t local_var=0x12345678;
  uint8_t  *temp_var=(uint8_t*) & local_var;
  
  if(*temp_var==0x78){
    printf("The System is little endian!!!\n");
  }
  else {
  	printf("The system is big endian!!!\n");
  }
  
  return 0;
}
