-- checking the data
SELECT
    order_id,
    shipping_mode,
    order_region,
    days_for_shipping_real,
    days_for_shipment_scheduled,
    (days_for_shipping_real - days_for_shipment_scheduled) AS delay_days,
    CASE
        WHEN (days_for_shipping_real - days_for_shipment_scheduled) <= 0 THEN 'On Time'
        WHEN (days_for_shipping_real - days_for_shipment_scheduled) BETWEEN 1 AND 3 THEN 'Late'
        ELSE 'Critical'
    END AS delivery_status_calc
FROM dataco_supply_chain
LIMIT 20;