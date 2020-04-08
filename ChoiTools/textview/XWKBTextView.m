//
//  XWKBTextView.m
//  FamilyPlatForm
//
//  Created by Mac on 17/3/6.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "XWKBTextView.h"

@implementation XWKBTextView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
    }
    return self ;
}

-(instancetype)init{
    self= [super init];
    if(self){
        self.delegate = self;
        self.backgroundColor= [UIColor clearColor];
        self.font= [UIFont systemFontOfSize:15];//默认字体大小
        
        //添加通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView{
    _placeholderLabel=[UILabel  new];
    _placeholderLabel.backgroundColor=[UIColor clearColor];
    _placeholderLabel.font = self.font;
    [self addSubview:_placeholderLabel];
    
    _placeholderLabel.sd_layout.topSpaceToView(self,8).leftSpaceToView(self,5).rightSpaceToView(self,5).autoHeightRatio(0);

    
}

#pragma mark - 监听通知

/**
 *  监听文本改变通知
 */
- (void)textDidChange{
    _placeholderLabel.hidden=self.hasText;
    
}

#pragma mark -

-(void)layoutSubviews{
    [super layoutSubviews];
    
}

-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder= placeholder;
    _placeholderLabel.text=placeholder;
    
    [self setNeedsLayout];
    
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor=placeholderColor;
    _placeholderLabel.textColor=placeholderColor;
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    _placeholderFont = placeholderFont;
    _placeholderLabel.font = placeholderFont;
}
-(void)setFont:(UIFont *)font{
    [super setFont:font];
    _placeholderLabel.font=font;
    [self setNeedsLayout];
}

-(void)setText:(NSString *)text{
    [super setText:text];
    [self textDidChange];
}

@end
