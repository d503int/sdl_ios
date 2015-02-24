//
//  SDLCompassDirectionSpec.m
//  SmartDeviceLink
//
//  Created by Jacob Keeler on 1/21/15.
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//#define EXP_SHORTHAND

#import <Foundation/Foundation.h>

#import <Quick/Quick.h>
#import <Nimble/Nimble.h>

#import "SDLCompassDirection.h"

QuickSpecBegin(SDLCompassDirectionSpec)

describe(@"Individual Enum Value Tests", ^ {
    it(@"Should match internal values", ^ {
        expect([SDLCompassDirection NORTH].value).to(equal(@"NORTH"));
        expect([SDLCompassDirection NORTHWEST].value).to(equal(@"NORTHWEST"));
        expect([SDLCompassDirection WEST].value).to(equal(@"WEST"));
        expect([SDLCompassDirection SOUTHWEST].value).to(equal(@"SOUTHWEST"));
        expect([SDLCompassDirection SOUTH].value).to(equal(@"SOUTH"));
        expect([SDLCompassDirection SOUTHEAST].value).to(equal(@"SOUTHEAST"));
        expect([SDLCompassDirection EAST].value).to(equal(@"EAST"));
        expect([SDLCompassDirection NORTHEAST].value).to(equal(@"NORTHEAST"));
    });
});
describe(@"ValueOf Tests", ^ {
    it(@"Should return correct values when valid", ^ {
        expect([SDLCompassDirection valueOf:@"NORTH"]).to(equal([SDLCompassDirection NORTH]));
        expect([SDLCompassDirection valueOf:@"NORTHWEST"]).to(equal([SDLCompassDirection NORTHWEST]));
        expect([SDLCompassDirection valueOf:@"WEST"]).to(equal([SDLCompassDirection WEST]));
        expect([SDLCompassDirection valueOf:@"SOUTHWEST"]).to(equal([SDLCompassDirection SOUTHWEST]));
        expect([SDLCompassDirection valueOf:@"SOUTH"]).to(equal([SDLCompassDirection SOUTH]));
        expect([SDLCompassDirection valueOf:@"SOUTHEAST"]).to(equal([SDLCompassDirection SOUTHEAST]));
        expect([SDLCompassDirection valueOf:@"EAST"]).to(equal([SDLCompassDirection EAST]));
        expect([SDLCompassDirection valueOf:@"NORTHEAST"]).to(equal([SDLCompassDirection NORTHEAST]));
    });
    
    it(@"Should return nil when invalid", ^ {
        expect([SDLCompassDirection valueOf:nil]).to(beNil());
        expect([SDLCompassDirection valueOf:@"JKUYTFHYTHJGFRFGYTR"]).to(beNil());
    });
});
describe(@"Value List Tests", ^ {
    NSMutableArray* storedValues = [SDLCompassDirection values];
    __block NSMutableArray* definedValues;
    beforeSuite(^ {
        definedValues = [@[[SDLCompassDirection NORTH],
                        [SDLCompassDirection NORTHWEST],
                        [SDLCompassDirection WEST],
                        [SDLCompassDirection SOUTHWEST],
                        [SDLCompassDirection SOUTH],
                        [SDLCompassDirection SOUTHEAST],
                        [SDLCompassDirection EAST],
                        [SDLCompassDirection NORTHEAST]] mutableCopy];
    });
    
    it(@"Should contain all defined enum values", ^ {
        for (int i = 0; i < definedValues.count; i++) {
            expect(storedValues).to(contain([definedValues objectAtIndex:i]));
        }
    });
    
    it(@"Should contain only defined enum values", ^ {
        for (int i = 0; i < storedValues.count; i++) {
            expect(definedValues).to(contain([storedValues objectAtIndex:i]));
        }
    });
});

QuickSpecEnd