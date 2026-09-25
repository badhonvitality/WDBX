-- wdbx_replication: Simple wrapper for logical replication setup

CREATE OR REPLACE FUNCTION wdbx_create_publication(p_pub_name text, p_table_name text DEFAULT NULL)
RETURNS void AS $$
BEGIN
    IF p_table_name IS NOT NULL THEN
        EXECUTE format('CREATE PUBLICATION %I FOR TABLE %I', p_pub_name, p_table_name);
    ELSE
        EXECUTE format('CREATE PUBLICATION %I FOR ALL TABLES', p_pub_name);
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION wdbx_create_subscription(p_sub_name text, p_conn_str text, p_pub_name text)
RETURNS void AS $$
BEGIN
    EXECUTE format('CREATE SUBSCRIPTION %I CONNECTION %L PUBLICATION %I', p_sub_name, p_conn_str, p_pub_name);
END;
$$ LANGUAGE plpgsql;
