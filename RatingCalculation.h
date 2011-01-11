//
//  RatingCalculation.h
//  ArenaStatCalc
//
//  Created by Zane on 12/11/10.
//  Copyright 2010 Aurum Aquila. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RatingCalculation : NSObject {

	
	
}

-(NSString *)rating:(int) kills:(int) deaths:(int) assists:(int) betrayals:(int) win_score:(int) players:(BOOL) didWin;

@end
