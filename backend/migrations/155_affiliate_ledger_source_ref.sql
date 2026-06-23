ALTER TABLE user_affiliate_ledger
    ADD COLUMN IF NOT EXISTS source_type VARCHAR(32) NULL;

ALTER TABLE user_affiliate_ledger
    ADD COLUMN IF NOT EXISTS source_ref VARCHAR(128) NULL;

COMMENT ON COLUMN user_affiliate_ledger.source_type IS '返利来源类型，如 payment_order、redeem_code';
COMMENT ON COLUMN user_affiliate_ledger.source_ref IS '返利来源引用 ID，按 source_type 解释';

CREATE INDEX IF NOT EXISTS idx_user_affiliate_ledger_source_type_ref
    ON user_affiliate_ledger(source_type, source_ref)
    WHERE source_type IS NOT NULL AND source_ref IS NOT NULL;
