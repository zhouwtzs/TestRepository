//
//  VideoPlayController.m
//  AppleVideoEditDemo
//
//  Created by 周文涛 on 16/7/5.
//  Copyright © 2016年 周文涛. All rights reserved.
//

#import "VideoPlayController.h"
#import "Bottom3BtnView.h"
#import "VideoEditConttoller.h"
#import "VideoFileManager.h"

@interface VideoPlayController ()

@property (nonatomic, strong)id timeObserver;

@property (nonatomic, strong)Bottom3BtnView * playBottomView;

@property (nonatomic, strong)UIButton * centetPlayBtn;

@property (nonatomic, assign)BOOL playing;

@property (nonatomic, assign)BOOL doubleTap;

@property (nonatomic, assign)BOOL isTaped;

@end

@implementation VideoPlayController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _isTaped = NO;
    
    [self createUI];
    
    [self playerBuild];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden{
    
    if (_isTaped) {
       
        return YES;
    }else{
    
        return NO;
    }
}

#pragma mark - UI
- (void)createUI{
    
    //barbutton
    UIBarButtonItem * barBtn = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(pressEditBtn)];
    
    self.navigationItem.rightBarButtonItem = barBtn;
    
    //layer
    _avplayerLayer = [[AVPlayerLayer alloc]init];
    
    _avplayerLayer.frame = self.view.bounds;
    
    [self.view.layer addSublayer:_avplayerLayer];
    
    //bottom views
    NSArray * images = @[[UIImage imageNamed:@"pbshare"],[UIImage imageNamed:@"pblike"],[UIImage imageNamed:@"pbdelete"]];
    
    _playBottomView = [[Bottom3BtnView alloc]initWithImage:images];
    
    _playBottomView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.95];
    
    [self.view addSubview:_playBottomView];
    
    _centetPlayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _centetPlayBtn.bounds = CGRectMake(0, 0, 80, 80);
    
    _centetPlayBtn.center = self.view.center;
    
    _centetPlayBtn.layer.cornerRadius = 40.0f;
    
    [_centetPlayBtn setImage:[UIImage imageNamed:@"centerplay"] forState:UIControlStateNormal];
    
    [_centetPlayBtn addTarget:self action:@selector(pressCenterPlayBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_centetPlayBtn];
    
    //单击
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnView:)];
    
    tap.numberOfTapsRequired = 1;
    
    tap.numberOfTouchesRequired = 1;
    
    //双击
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapOnView:)];
    
    doubleTap.numberOfTouchesRequired = 1;
    
    doubleTap.numberOfTapsRequired = 2;
    
    [self.view addGestureRecognizer:tap];
    
    [self.view addGestureRecognizer:doubleTap];
}

- (void)playerBuild{
    
    if (!_avAsset) {
        
        NSURL * sourceMovieURL = [NSURL URLWithString:_pickerURLStr];
        
        _avAsset = [AVURLAsset URLAssetWithURL:sourceMovieURL options:nil];
    }
    _playerItem = [AVPlayerItem playerItemWithAsset:_avAsset];
    
    //监听播放状态
    [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    _player = [AVPlayer playerWithPlayerItem:_playerItem];
    
//    typeof(self) __weak weakSelf = self;
    
    self.timeObserver = [_player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        
//        CGFloat currentSecond = weakSelf.playerItem.currentTime.value/weakSelf.playerItem.currentTime.timescale;// 计算当前在第几秒
//        
//        NSInteger mm = currentSecond/60;
//        
//        NSInteger ss = ((NSInteger)currentSecond)%60;
        
    }];
    
    _avplayerLayer.player = _player;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished)name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

}

- (void)playerClean{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [_player removeTimeObserver:self.timeObserver];
    
    self.timeObserver = nil;
    
    _player = nil;
    
    _avplayerLayer.player = nil;
    
    [_playerItem removeObserver:self forKeyPath:@"status"];
    
    _playerItem = nil;

}

#pragma mark - press button
- (void)pressCenterPlayBtn{

    [_player play];
    
    _playing = YES;
    
    _centetPlayBtn.hidden = YES;
}

- (void)pressEditBtn{
    
    UIVideoEditorController * VideoEditorController = [[UIVideoEditorController alloc]init];
    
    VideoEditorController.videoPath = [VideoFileManager videoPath:15 send:NO];
    
    [self.navigationController pushViewController:VideoEditorController animated:NO];
    
    
//    ((AVURLAsset *)_avAsset).URL;
//    
//    
//    
//    @property(nonatomic, copy)     NSString                              *videoPath;
//    @property(nonatomic)           NSTimeInterval                        videoMaximumDuration; // default value is 10 minutes. set to 0 to specify no maximum duration.
//    @property(nonatomic)           UIImagePickerControllerQualityType    videoQuality;         // default value is
    
//    
//    if(UIVideoEditorController.CanEditVideoAtPath(ChosenVideoPath))
//    {
//        var videoEditor = new UIVideoEditorController();
//        videoEditor.VideoPath = ChosenVideoPath;
//        videoEditor.Saved += delegate(object sender, UIPathEventArgs e) {
//            this.DismissModalViewControllerAnimated(true);
//            // Handle edited video with e.Path
//        };
//        videoEditor.Failed += delegate(object sender, NSErrorEventArgs e) {
//            this.DismissModalViewControllerAnimated(true);
//            // Handle error here with e.Error
//        };
//        videoEditor.UserCancelled += delegate(object sender, EventArgs e) {
//            this.DismissModalViewControllerAnimated(true);
//            // Handle cancel
//        };
//        this.PresentModalViewController(videoEditor, true);
//    }
    
    
}

- (void)tapOnView:(UITapGestureRecognizer *)tap{
    
    _doubleTap = NO;
    
    [self performSelector:@selector(onceTapOnView:) withObject:tap afterDelay:0.2];
}

- (void)onceTapOnView:(UITapGestureRecognizer *)tap{

    if (_doubleTap) {
        
        return;
    }
    
    typeof(_playBottomView) __weak weakBottomView = _playBottomView;
    
    WEAKSELF;
    
    if (_isTaped) {
        
        _isTaped = NO;
        
        [self setNeedsStatusBarAppearanceUpdate];
        
        weakBottomView.hidden = NO;
        
        weakSelf.navigationController.navigationBar.hidden = NO;
        
        weakSelf.navigationController.navigationBar.alpha = 0;
        
        [UIView animateWithDuration:0.25 animations:^{

            weakBottomView.alpha = 1.0f;
            
            weakSelf.navigationController.navigationBar.alpha = 1.0f;
            
        } completion:nil];
        
    }else{
        
        _isTaped = YES;
        
        [UIView animateWithDuration:0.25 animations:^{
            
            weakBottomView.alpha = 0;
            
            weakSelf.navigationController.navigationBar.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            weakBottomView.hidden = YES;
            
            weakSelf.navigationController.navigationBar.hidden = YES;
            
            [weakSelf setNeedsStatusBarAppearanceUpdate];

        }];
    }
}

- (void)doubleTapOnView:(UITapGestureRecognizer *)tap{
    
    _doubleTap = YES;
    
    //双击放大是什么鬼
    
    NSLog(@"双击");
}

#pragma mark - play notification
- (void)playbackFinished{
    
    _centetPlayBtn.hidden = NO;
    
    _playing = NO;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"status"]) {
        
        if (_playerItem.status == AVPlayerStatusReadyToPlay) {
            
//            CGFloat allSecond = _playerItem.duration.value / _playerItem.duration.timescale;// 转换成秒
//            
//            NSInteger mm = allSecond/60;
//            
//            NSInteger ss = ((NSInteger)allSecond)%60;
            
//            _pickerBottomView.allTimeLabel.text = [NSString stringWithFormat:@"%02d:%02d",(int)mm,(int)ss];
//            
//            _pickerBottomView.sliderView.maximumValue = allSecond;
//            
//            if ([self.delegate respondsToSelector:@selector(playerDidReadyToPlay:)]) {
//                
//                [self.delegate playerDidReadyToPlay:self];
//            }
        }else if (_playerItem.status == AVPlayerStatusFailed) {
            
        }else;
    }
    
}

- (void)viewWillDisappear:(BOOL)animated{

    [self playerClean];
    
    
}

@end
