//
//  ViewController.m
//  LearnRMTPDemo
//
//  Created by Heige on 16/6/18.
//  Copyright © 2016年 Heige. All rights reserved.
//

#import "ViewController.h"
#import <MJRefresh.h>
#import "HJTNetTool.h"
#import "CustomTool.h"
#import "TableViewDataSource.h"
#import "TableViewDelegate.h"
#import "MovieRMTPMovieRMTP.h"
#import "MovieRMTPLives.h"
#import "MovieRMTPCreator.h"
#import "HJTClearCacheTool.h"
#import "LiveViewController.h"


@interface ViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic)UITableView *dataTableView;
@property (strong,nonatomic)NSMutableArray *totalSource;
@property (strong,nonatomic)TableViewDataSource *tableViewDataSource;
@property (strong,nonatomic)TableViewDelegate *tableViewDelegate;
@property (strong,nonatomic)MovieRMTPMovieRMTP*movieRmtp;
@property (assign,nonatomic)NSInteger page;
@end


@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self CreateTableView];
}

-(void)CreateTableView{
    _page = 1;
    _totalSource = [NSMutableArray array];
    self.navigationItem.title =@"直播";
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    _dataTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    
    _dataTableView.estimatedRowHeight = 270.0f;
    _dataTableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_dataTableView];
    
    [_dataTableView registerNib:[UINib nibWithNibName:@"DataTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"dataCell"];
    
    _tableViewDataSource=[[TableViewDataSource alloc] init];
    _tableViewDelegate=[[TableViewDelegate alloc] init];
    _dataTableView.dataSource=_tableViewDataSource;
    _dataTableView.delegate=_tableViewDelegate;
   
    
   [_dataTableView addObserver: self forKeyPath: @"contentOffset" options: NSKeyValueObservingOptionNew context: nil];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoredata)];
    
    _dataTableView.mj_header = header;
   // _dataTableView.mj_footer = footer;
    
    [_dataTableView.mj_header beginRefreshing];
    
    
}
//KVO监听屏幕滚动
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    UIPanGestureRecognizer* pan = _dataTableView.panGestureRecognizer;
    //获取到拖拽的速度 >0 向下拖动 <0 向上拖动
    CGFloat velocity = [pan velocityInView:_dataTableView].y;
    
    if (velocity<-5) {
        //向上拖动，隐藏导航栏
        [self.navigationController setNavigationBarHidden:true animated:true];
    }
    else if (velocity>5) {
        //向下拖动，显示导航栏
        [self.navigationController setNavigationBarHidden:false animated:true];
    }
    else if(velocity==0){
        //停止拖拽
    }
}


-(void)loadNewData{
    [self getDataWithHead:YES];
}

-(void)loadMoredata{
  //  [self getDataWithHead:NO];
}


-(void)getDataWithHead:(BOOL)isHead{
    if (isHead) {
        _page = 1;
    }else{
        if (_page < 2) {
            _page = 2;
        }
    }
    [HJTNetTool get:GetData progress:^(NSProgress * _Nonnull progress) {
        
    } success:^(id  _Nonnull responseObject) {
        _movieRmtp = [[MovieRMTPMovieRMTP alloc]initWithDictionary:responseObject];
        
        if (_movieRmtp.dmError!=0) {
            SHOW_ERROR
        }else{
            
            if (_movieRmtp.lives) {
                if (isHead) {
                    [_totalSource removeAllObjects];
                }else{
                    _page ++;
                }
                _totalSource = [_movieRmtp.lives mutableCopy];
                _tableViewDataSource.array = _totalSource;
                _tableViewDelegate.array = _totalSource;
                WS
                _tableViewDelegate.cellSelectedBlock = ^(id obj){
                    SS
                     [strongSelf cellSelectedWithObj:(id)obj];
                };
                
            }
            [_dataTableView reloadData];
        }
        
        if (isHead) {
            [_dataTableView.mj_header endRefreshing];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [_dataTableView.mj_footer endRefreshing];
                
            });
        }
        
    } failure:^(NSString * _Nonnull errorLD) {
        SHOW_NTERROR
        if (isHead) {
            [_dataTableView.mj_header endRefreshing];
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [_dataTableView.mj_footer endRefreshing];
                
            });
        }
    }];
}

- (void)cellSelectedWithObj:(id)obj
{
    NSIndexPath *indexPath = obj;
    LiveViewController*webVC = [LiveViewController new];
    MovieRMTPLives*wxNewsList = _totalSource[indexPath.row];
    webVC.liveUrl = wxNewsList.streamAddr;
    webVC.imageUrl = wxNewsList.creator.portrait;
    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
