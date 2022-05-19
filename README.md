# Shopify - Data Science Challenge

All code used to calculate the values are in *script.R* or shown in the answers.

## Question 1

### a
This issue with the current calculation for average order value is that it finds the mean value of the *order_amount* column. This is an issue because each order amount may be the sum of more than one item. For example, an order of $500 for one item and two items is treated the same when simply finding the mean of *order_amount*. Therefore, a better way to evaluate the data is to find and divide the sum of *order_amount* by *total_items*.

### b
Both the mean and median average order value are suitable metrics. To find the mean, we can use the following code:
```R
df %>% summarise(aov = sum(order_amount) / sum(total_items))
```

After doing some exploring, I found that shops 42 and 78 were outliers in the dataset. Therefore, I removed them when re-calculating the mean and median values with the following code:
```R
df %>% 
  filter(shop_id != 78, shop_id != 42) %>%
  summarise(aov_mean = sum(order_amount) / sum(total_items),
            aov_median = median(order_amount / total_items))
```

An important thing to note is that this median calculation doesn't take into account the fact that some rows have more than one item per order. However, since the most items in an order was 8 after filtering out outlier shops, this did not have a significant effect on the results.

### c
After removing the outliers, the average order value is roughly $150. This is a reasonable value, though it may still be on the higher end of affordable sneakers.

## Question 2

### a

We know that Speedy Express is *ShipperID* 1 from the following code:
```SQL
SELECT Orders.ShipperID, Shippers.ShipperID, Shippers.ShipperName
FROM Orders
LEFT JOIN Shippers 
ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;
```
From the following code, we find there were 54 totals orders by Speedy Express:

```SQL
SELECT COUNT(*), ShipperID
FROM Orders
GROUP BY ShipperID;
```

### b




### c




