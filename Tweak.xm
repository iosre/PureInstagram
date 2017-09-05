#import "PureInstagram.h"

%hook IGMainFeedListAdapterDataSource

- (NSArray *)objectsForListAdapter:(IGListAdapter *)arg1
{
	NSArray *objects = %orig;
	NSMutableArray *objectsWithoutAds = [@[] mutableCopy];	
	for (id object in objects)
		if ([object isKindOfClass:(NSClassFromString(@"IGFeedItem"))] && !(((IGFeedItem *)object).isSponsored || ((IGFeedItem *)object).isSponsoredApp))
			[objectsWithoutAds addObject:object];
	return objectsWithoutAds;
}

%end
