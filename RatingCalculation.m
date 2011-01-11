//
//  RatingCalculation.m
//  ArenaStatCalc
//
//  Created by Zane on 12/11/10.
//  Copyright 2010 Aurum Aquila. All rights reserved.
//

#import "RatingCalculation.h"


@implementation RatingCalculation

-(NSString *)rating:(int) kills:(int) deaths:(int) assists:(int) betrayals:(int) win_score:(int) players:(BOOL) didWin{
		/*Bungie's official formula for calculating arena ratings can be found at http://www.bungie.net/projects/reach/article.aspx?ucc=variants&cid=25865*/
		
		/* ARENA RATING FORMULA*/
		/*---------------------------------------------------------------*/
		/*
		 
		 game_normalization = players_per_team / score_to_win
		 
		 raw_rating = (kills + sa*assists) - (sd*deaths + sb*betrayals)
		 
		 rating = loss_penalty * (1000 + (2000/pi * atan( raw_rating * game_normalization )))*/
		
		/*----------------------------------------------------------------*/
		
		//Define the game variables for use
		
		int final_rating;//Unsigned integer returns the value correctly for some reason....
		
		
		double oneTeam = (double) players/2;
		
		//These constants are defined by bungie. Subject to change, so watch reviews and bungie.net
		double scaleAssists = 1.0;
		double scaleDeaths = 0.5;
		double scaleBetrayals = 1.0;
		double loss_penalty = 0.96;
		
		double game_normalization = ((double) oneTeam/win_score);//This allows for the ratings across games to be 'consistent'. I.E. 1000 in one game is 1000 in another
		
		double raw_rating = (kills + assists*scaleAssists) - (deaths*scaleDeaths + betrayals*scaleBetrayals);
		
		if (didWin == NO)//If they lost, apply a loss penalty (constant above)
		{
			final_rating = loss_penalty * 1000+(2000/M_PI * atan(raw_rating * game_normalization));
		}
		
		if (didWin == YES)//If they won, don't apply the loss penalty
		{
			final_rating = 1000+(2000/M_PI * atan(raw_rating * game_normalization));
		}
	
	NSString *string = [NSString stringWithFormat:@"%f",final_rating];
		
	return string;
}

@end
