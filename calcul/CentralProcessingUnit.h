//
//  CentralProcessingUnit.h
//  calcul
//
//  Created by Luu Vinh Loc on 7/29/14.
//  Copyright (c) 2014 HEDSPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CentralProcessingUnit : NSObject{
    @public
    long double result;
    NSMutableString *resultString;
    
}

//returns the result of expression

- (int) performOperation:(char)operation x:(long double)x y:(long double)y;

- (int) process:(NSMutableString *)operatorArray numberArray:(NSMutableArray *)numberArray;



@end
