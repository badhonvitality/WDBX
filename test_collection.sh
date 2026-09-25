#!/usr/bin/bash
export PATH="/c/Users/badho/OneDrive/Desktop/WDBX/wdbx_engine/dist/bin:/c/msys64/ucrt64/bin:$PATH"
cd /c/Users/badho/OneDrive/Desktop/WDBX/wdbx_engine/dist
rm -rf test_cluster
wdbx-init -D test_cluster -U postgres
wdbx-ctl -D test_cluster -l test_cluster/logfile start -o "-p 5433"
sleep 3
wdbx -p 5433 -U postgres -d postgres -c "CREATE COLLECTION my_docs;"
wdbx -p 5433 -U postgres -d postgres -c "\d my_docs"
wdbx -p 5433 -U postgres -d postgres -c "INSERT INTO my_docs (_id, document) VALUES ('doc1', '{ \"name\": \"John\" }'); SELECT * FROM my_docs;"
wdbx-ctl -D test_cluster stop
