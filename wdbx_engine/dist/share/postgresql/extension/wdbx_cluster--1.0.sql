-- wdbx_cluster: Simple wrapper for postgres_fdw based sharding

CREATE TABLE IF NOT EXISTS wdbx_nodes (
    node_name text PRIMARY KEY,
    host text NOT NULL,
    port int NOT NULL
);

CREATE OR REPLACE FUNCTION wdbx_add_node(p_node_name text, p_host text, p_port int)
RETURNS void AS $$
BEGIN
    -- Register the foreign server
    EXECUTE format('CREATE SERVER %I FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host %L, port %L, dbname %L)',
                   p_node_name, p_host, p_port::text, 'wdbx');
                   
    -- Insert into our metadata table
    INSERT INTO wdbx_nodes (node_name, host, port) VALUES (p_node_name, p_host, p_port);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION wdbx_create_distributed_table(p_table_name text, p_partition_column text)
RETURNS void AS $$
BEGIN
    -- Just a metadata stub for now to signify distributed table readiness.
    -- In a real setup, this would create a declarative partitioned table and map foreign partitions to wdbx_nodes.
    RAISE NOTICE 'Distributed table % created on column %.', p_table_name, p_partition_column;
END;
$$ LANGUAGE plpgsql;
