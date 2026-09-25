#!/usr/bin/bash
export PATH="/c/Users/badho/OneDrive/Desktop/WDBX/wdbx_engine/dist/bin:/c/msys64/ucrt64/bin:$PATH"
cd /c/Users/badho/OneDrive/Desktop/WDBX/wdbx_engine/dist
wdbx-ctl -D test_cluster -l test_cluster/logfile start -o "-p 5433"
sleep 3
wdbx -p 5433 -U postgres -d postgres -c "UPDATE my_docs SET document['name'] = '\"Jonathan\"' WHERE _id = 'doc1'; SELECT * FROM my_docs;"
wdbx-ctl -D test_cluster stop
