//
//  OperationReader.m
//  calcul
//
//  Created by Luu Vinh Loc on 8/4/14.
//  Copyright (c) 2014 HEDSPI. All rights reserved.
//

#import "OperationReader.h"

@implementation OperationReader{
    
}


- (void)read:(NSString *)operationString{
    
    long double number = 0;
    char checkingChar;
    //NSString *operatorString;
    
    operatorArray = [[NSMutableString alloc] init];
    numberArray = [[NSMutableArray alloc] init];
    
    for(int i=0;i<[operationString length];i++){
        checkingChar=[operationString characterAtIndex:i];
        
        
        if('0'<=checkingChar && checkingChar<='9' && i!=[operationString length]){
            
            number = number*10+(checkingChar - '0');
            
        }else if('0'<=checkingChar && checkingChar<='9' && i==[operationString length]){
            
            [numberArray addObject:[NSNumber numberWithLongLong:number]];
        }else{
            // append a operator into array
            [operatorArray  appendFormat:@"%c",checkingChar];
            // add a number into array
            [numberArray addObject:[NSNumber numberWithLongLong:number]];
            number = 0;
        }
        
    }
    // add a number into array
    [numberArray addObject:[NSNumber numberWithLongLong:number]];
}

@end
