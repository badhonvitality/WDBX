vector_sources = files(
  'src/bitutils.c',
  'src/bitvec.c',
  'src/halfutils.c',
  'src/halfvec.c',
  'src/hnsw.c',
  'src/hnswbuild.c',
  'src/hnswinsert.c',
  'src/hnswscan.c',
  'src/hnswutils.c',
  'src/hnswvacuum.c',
  'src/ivfbuild.c',
  'src/ivfflat.c',
  'src/ivfinsert.c',
  'src/ivfkmeans.c',
  'src/ivfscan.c',
  'src/ivfutils.c',
  'src/ivfvacuum.c',
  'src/sparsevec.c',
  'src/vector.c',
)

if host_system == 'windows'
  vector_sources += rc_lib_gen.process(win32ver_rc, extra_args: [
    '--NAME', 'vector',
    '--FILEDESC', 'pgvector - open-source vector similarity search for PostgreSQL',])
endif

vector = shared_module('vector',
  vector_sources,
  include_directories: include_directories('.'),
  kwargs: contrib_mod_args,
)
contrib_targets += vector

# vector.sql must be installed as vector--0.8.6.sql
# In meson we can just rename it during install, or use custom_target
vector_sql = custom_target('vector_sql',
  input: 'sql/vector.sql',
  output: 'vector--0.8.6.sql',
  command: ['cp', '@INPUT@', '@OUTPUT@'],
  install: true,
  install_dir: dir_data_extension,
)

install_data(
  'vector.control',
  'sql/vector--0.1.0--0.1.1.sql',
  'sql/vector--0.1.1--0.1.3.sql',
  'sql/vector--0.1.3--0.1.4.sql',
  'sql/vector--0.1.4--0.1.5.sql',
  'sql/vector--0.1.5--0.1.6.sql',
  'sql/vector--0.1.6--0.1.7.sql',
  'sql/vector--0.1.7--0.1.8.sql',
  'sql/vector--0.1.8--0.2.0.sql',
  'sql/vector--0.2.0--0.2.1.sql',
  'sql/vector--0.2.1--0.2.2.sql',
  'sql/vector--0.2.2--0.2.3.sql',
  'sql/vector--0.2.3--0.2.4.sql',
  'sql/vector--0.2.4--0.2.5.sql',
  'sql/vector--0.2.5--0.2.6.sql',
  'sql/vector--0.2.6--0.2.7.sql',
  'sql/vector--0.2.7--0.3.0.sql',
  'sql/vector--0.3.0--0.3.1.sql',
  'sql/vector--0.3.1--0.3.2.sql',
  'sql/vector--0.3.2--0.4.0.sql',
  'sql/vector--0.4.0--0.4.1.sql',
  'sql/vector--0.4.1--0.4.2.sql',
  'sql/vector--0.4.2--0.4.3.sql',
  'sql/vector--0.4.3--0.4.4.sql',
  'sql/vector--0.4.4--0.5.0.sql',
  'sql/vector--0.5.0--0.5.1.sql',
  'sql/vector--0.5.1--0.6.0.sql',
  'sql/vector--0.6.0--0.6.1.sql',
  'sql/vector--0.6.1--0.6.2.sql',
  'sql/vector--0.6.2--0.7.0.sql',
  'sql/vector--0.7.0--0.7.1.sql',
  'sql/vector--0.7.1--0.7.2.sql',
  'sql/vector--0.7.2--0.7.3.sql',
  'sql/vector--0.7.3--0.7.4.sql',
  'sql/vector--0.7.4--0.8.0.sql',
  'sql/vector--0.8.0--0.8.1.sql',
  'sql/vector--0.8.1--0.8.2.sql',
  'sql/vector--0.8.2--0.8.3.sql',
  'sql/vector--0.8.3--0.8.4.sql',
  'sql/vector--0.8.4--0.8.5.sql',
  'sql/vector--0.8.5--0.8.6.sql',
  'sql/vector--0.8.6--0.8.7.sql',
  kwargs: contrib_data_args,
)

install_headers(
  'src/vector.h',
  'src/halfvec.h',
  'src/sparsevec.h',
  install_dir: dir_include_extension / 'vector',
)

