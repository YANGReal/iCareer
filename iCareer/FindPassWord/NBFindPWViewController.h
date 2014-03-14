//
//  NBFindPWViewController.h
//  iCareer
//
//  Created by YANGRui on 14-3-11.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBBaseViewController.h"

typedef enum
{
    phoneType,
    emailType
} PassWordFindType ;

@interface NBFindPWViewController : NBBaseViewController
@property (assign , nonatomic) PassWordFindType findType;


@end
