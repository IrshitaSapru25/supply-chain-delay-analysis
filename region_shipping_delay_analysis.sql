--second and final query 
SELECT
    order_region,
    shipping_mode,
    COUNT(*) AS total_orders,
    ROUND(AVG(days_for_shipping_real - days_for_shipment_scheduled), 2) AS avg_delay_days,
    ROUND(
        100.0 * SUM(
            CASE 
                WHEN (days_for_shipping_real - days_for_shipment_scheduled) > 0 
                THEN 1 ELSE 0 
            END
        ) / COUNT(*),
        2
    ) AS delay_percentage
FROM public.dataco_supply_chain
GROUP BY order_region, shipping_mode
ORDER BY avg_delay_days DESC