SELECT 
    asset_class_id AS asset_class_key,
    asset_class_name,
    risk_level
FROM {{ref('stg_asset_classes')}}