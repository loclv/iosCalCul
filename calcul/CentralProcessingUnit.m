//
//  CentralProcessingUnit.m
//  calcul
//
//  Created by Luu Vinh Loc on 7/29/14.
//  Copyright (c) 2014 HEDSPI. All rights reserved.
//

#import "CentralProcessingUnit.h"

@implementation CentralProcessingUnit



- (int) performOperation:(char)operation x:(long double)x y:(long double)y
{
    if (operation =='+')
    {
        result = x+y;
        return 0;
    }
    else if (operation =='-')
    {
        result = x-y;
        return 0;
    }
    else if(operation =='x')
    {
        result = x*y;
        return 0;
    }
    else if(operation =='/')
    {
        if (y==0) {
            return 1;
        }
        result = x/y;
        return 0;
    }
    else if(operation ==' '){
        result = x;
    }
    return 0;
}



- (int) process:(NSMutableString *)operatorArray numberArray:(NSMutableArray *)numberArray{
    int i;
    int j=0;
    self->result = 0;
    resultString = [[NSMutableString alloc] init];
    
    for(i=0;i<[operatorArray length];i++){
        if([self performOperation:[operatorArray characterAtIndex:i] x:[[numberArray objectAtIndex:j] longLongValue] y:[[numberArray objectAtIndex:(j+1)] longLongValue]] == 1){
            
            [resultString deleteCharactersInRange:NSMakeRange(0, [resultString length])];
            [resultString appendString:@"ERROR - can't device by zero!"];
            return 1;
        }

        j++;
    }
    [resultString appendString:[NSString stringWithFormat:@"%Lg", result]];
    
    return 0;
    
}

@end
