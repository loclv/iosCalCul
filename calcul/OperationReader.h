//
//  OperationReader.h
//  calcul
//
//  Created by Luu Vinh Loc on 8/4/14.
//  Copyright (c) 2014 HEDSPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperationReader : NSObject{
@public
    NSMutableString *operatorArray;
    NSMutableArray *numberArray;
}

- (void)read:(NSString *)operationString;

@end
