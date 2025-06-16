###############################################################################

script_path="$0"
script_path_no_ext="${script_path%.*}"
script_dir=$(dirname "$script_path")
script_filename=$(basename "$script_path")
script_name_no_ext="${script_filename%.*}"

###############################################################################

DIR="$script_path_no_ext" && mkdir -p $DIR
DATE=$(TZ=UTC-8 date +'%Y-%m-%d-%H-%M-%S')

###############################################################################

# build/mooncake-transfer-engine/example/memory_pool --help
# build/mooncake-transfer-engine/example/transfer_engine_bench --help

###############################################################################

# ./transfer_engine_bench --help

###############################################################################

# on `10.157.150.15`
# python mooncake-transfer-engine/example/http-metadata-server-python/bootstrap_server.py

unset MC_GID_INDEX
# export MC_GID_INDEX="3"
export MC_TE_METRIC="1"
LOCAL_SERVER_NAME="10.157.150.15"
MODE="initiator"
SEGMENT_ID="10.157.150.14"
# DEVICE_NAME="mlx5_0"
# DEVICE_NAME="mlx5_1"
# DEVICE_NAME="mlx5_2"
# DEVICE_NAME="mlx5_3"
# DEVICE_NAME="mlx5_4"
DEVICE_NAME="mlx5_0,mlx5_3,mlx5_4,mlx5_5"

# unset MC_GID_INDEX
# export MC_GID_INDEX="3"
# export MC_TE_METRIC="1"
# LOCAL_SERVER_NAME="10.157.150.14"
# MODE="target"
# SEGMENT_ID="10.157.150.14"
# DEVICE_NAME="mlx5_0"
# DEVICE_NAME="mlx5_1"
# DEVICE_NAME="mlx5_2"
# DEVICE_NAME="mlx5_3"
# DEVICE_NAME="mlx5_4"
DEVICE_NAME="mlx5_0,mlx5_3,mlx5_4,mlx5_5"

METADATA_SERVER="http://10.157.150.15:18102/metadata"

args=(
  #
  --device_name=$DEVICE_NAME
  #
  # --gpu_id=3
  #
  --operation=read
  # --operation=write
  #
  # --auto_discovery
  # --nic_priority_matrix=
  #
  # --batch_size=2
  # --block_size=421632000 # (61*1*6000*576*2)
  #
  --batch_size=61
  --block_size=6912000 # (61*1*6000*576*2) // 61
  #
  # --batch_size=1430   # (61 * 6000/256)
  # --block_size=294912 # (61*1*6000*576*2) // (61 * 6000/256)
  #
  # --batch_size=179     # (61 * 6000/2048)
  # --block_size=2359296 # (61*1*6000*576*2) // (61 * 6000/2048)
  #
  # --threads=1
  --threads=4
  # --threads=16
  #
  --buffer_size=1073741824 # 1GiB, `1ull << 30`
  --duration=20
  #
  --report_unit=GB
  # --report_unit=GiB
  # --report_unit=MB
  #
  --protocol=rdma
  # --protocol=tcp
  #
  --segment_id=$SEGMENT_ID
  --mode=$MODE
  --local_server_name=$LOCAL_SERVER_NAME
  --metadata_server=$METADATA_SERVER
)

cat $script_path | tee $DIR/$script_filename.$DATE.bench.sh.logsh
./transfer_engine_bench "${args[@]}" 2>&1 0>&1 | tee $DIR/$script_filename.$DATE.bench.log

###############################################################################
