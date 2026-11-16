SELECT 
    asset_class_id,
    asset_class_name,
    risk_level
FROM {{source('sql_bosses', 'asset_classes')}}