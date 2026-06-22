-- 兑换码销售价：销售价大于 0 时用于计算推广返利基数
ALTER TABLE redeem_codes
    ADD COLUMN IF NOT EXISTS sale_price DECIMAL(20,8) NOT NULL DEFAULT 0;

COMMENT ON COLUMN redeem_codes.sale_price IS '兑换码销售价，0 表示不按销售价触发推广返利';
