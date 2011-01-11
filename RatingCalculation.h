//
//  RatingCalculation.h
//  ArenaStatCalc
//
//  Created by Jhetam Family on 12/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RatingCalculation : NSObject {

	
	
}

-(NSString *)rating:(int) kills:(int) deaths:(int) assists:(int) betrayals:(int) win_score:(int) players:(BOOL) didWin;

@end
