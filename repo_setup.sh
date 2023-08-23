mkdir registry
mkdir registry/targets
mkdir registry/targets/my_repo
echo "hello world" > registry/targets/my_repo/image1
mkdir registry/targets/wabbit_networks
echo "other text" > registry/targets/wabbit_networks/file1.txt

mkdir test_repository1
mkdir test_repository1/targets
mkdir test_repository1/targets/my_repo
echo "hello world" > test_repository1/targets/my_repo/image1
mkdir test_repository1/targets/wabbit_networks
echo "other text" > test_repository1/targets/wabbit_networks/file1.txt

python3 demo.py
cp -r "registry/metadata.staged/" "registry/metadata"
cp -r registry/metadata test_repository1

