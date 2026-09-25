#!/usr/bin/bash
export PATH="/c/Users/badho/OneDrive/Desktop/WDBX/wdbx_engine/dist/bin:/c/msys64/ucrt64/bin:$PATH"
cd /c/Users/badho/OneDrive/Desktop/WDBX/wdbx_engine/dist
wdbx-ctl -D test_cluster -l test_cluster/logfile start -o "-p 5433"
sleep 3
wdbx -p 5433 -U postgres -d postgres -c "CREATE INDEX my_docs_gin_idx ON my_docs USING GIN (document);"
wdbx -p 5433 -U postgres -d postgres -c "CREATE INDEX my_docs_name_idx ON my_docs ((document->>'name'));"
wdbx -p 5433 -U postgres -d postgres -c "\d my_docs"
wdbx-ctl -D test_cluster stop
