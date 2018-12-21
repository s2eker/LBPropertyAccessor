//
//  LBPropertyAccessorController.m
//  LBPropertyAccessor
//
//  Created by 李兵 on 2018/12/20.
//

#import "LBPropertyAccessorController.h"
#import "LBProperty.h"

@interface NSObject (LBProperty)
- (BOOL)lbp_equalTo:(id)obj;
@end
@implementation NSObject (LBProperty)
- (BOOL)lbp_equalTo:(id)obj {
    if ([self isKindOfClass:[NSNumber class]] &&
        ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]])) {
        NSNumber *num = (NSNumber *)self;
        NSString *str = (NSString *)obj;
        return num.integerValue == str.integerValue || num.floatValue == str.floatValue;
    }
    
    if ([obj isKindOfClass:[NSNumber class]] &&
        ([self isKindOfClass:[NSNumber class]] || [self isKindOfClass:[NSString class]])) {
        NSNumber *num = (NSNumber *)obj;
        NSString *str = (NSString *)self;
        return num.integerValue == str.integerValue || num.floatValue == str.floatValue;
    }
    
    
    return  [self isEqual:obj];
}

@end

@interface LBPropertyAccessorController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) id obj;
@property (nonatomic, strong) NSArray *properties;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LBPropertyAccessorController
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self initData];
}

- (void)initUI {
    [self.view addSubview:self.collectionView];
}
- (void)initData {
    [self.dataSource removeAllObjects];
    for (NSDictionary *dic in self.properties) {
        LBProperty *p = [LBProperty propertyWithDic:dic];
        [self.dataSource addObject:p];
    }
}

#pragma mark -- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSource.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    LBProperty *p = self.dataSource[section];
    return MAX(p.values.count, 1);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = [cell viewWithTag:10000];
    if (!label) {
        label = [UILabel new];
        label.tag = 10000;
        label.layer.cornerRadius = 5;
        label.layer.masksToBounds = YES;
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor greenColor];
        [cell addSubview:label];
    }
    UILabel *dot = [cell viewWithTag:10001];
    CGFloat s = 20;
    if (!dot) {
        dot = [UILabel new];
        dot.text = @"✓";
        dot.tag = 10001;
        dot.layer.cornerRadius = s/2;
        dot.layer.masksToBounds = YES;
        dot.font = [UIFont systemFontOfSize:18];
        dot.textAlignment = NSTextAlignmentCenter;
        dot.textColor = [UIColor whiteColor];
        dot.backgroundColor = [UIColor orangeColor];
        dot.hidden = YES;
        [cell addSubview:dot];
    }
    label.frame = cell.bounds;
    dot.frame = CGRectMake(cell.frame.size.width-s/2, -s/2, s, s);
    
    LBProperty *p = self.dataSource[indexPath.section];
    LBValue *v = p.values[indexPath.row];
    label.text = v.description;
    label.backgroundColor = p.color;
    
    id objV = [self.obj valueForKey:p.name.value];
    dot.hidden = ![objV lbp_equalTo:v.value];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *v = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    v.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel *l = [v viewWithTag:10000];
    if (!l) {
        l = [UILabel new];
        l.tag = 10000;
        l.font = [UIFont systemFontOfSize:17];
        l.textColor = [UIColor blackColor];
        l.frame = CGRectMake(15, 10, v.bounds.size.width-30, v.bounds.size.height-10);
        [v addSubview:l];
    }
    LBProperty *p = self.dataSource[indexPath.section];
    l.text = p.name.description;
    return v;
}
#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LBProperty *p = self.dataSource[indexPath.section];
    LBValue *v = p.values[indexPath.row];
    [self.obj setValue:v.value forKey:p.name.value];
    [collectionView reloadData];
}


#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    LBProperty *p = self.dataSource[indexPath.section];
    LBValue *v = p.values[indexPath.row];
    CGSize size = [v.description sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    CGSize size2 = CGSizeMake(ceil(size.width)+20, 30);
    return size2;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return  10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(self.view.bounds.size.width, 40);
}



+ (instancetype)instanceWithObj:(id)obj properties:(NSArray *)properties {
    LBPropertyAccessorController *vc = [LBPropertyAccessorController new];
    vc.obj = obj;
    vc.properties = properties;
    return vc;
}

@end



