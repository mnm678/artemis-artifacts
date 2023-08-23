mkdir local-repository
mkdir local-repository/updater
mkdir local-repository/updater/metadata
mkdir local-repository/updater/metadata/current
mkdir local-repository/updater/metadata/previous
cp registry/metadata/root.json local-repository/updater/metadata/current/root.json
mkdir local-repository/registry
mkdir local-repository/registry/metadata
mkdir local-repository/registry/metadata/current
mkdir local-repository/registry/metadata/previous
cp registry/metadata/root.json local-repository/registry/metadata/current/root.json
mkdir local-repository/test_repository1
mkdir local-repository/test_repository1/metadata
mkdir local-repository/test_repository1/metadata/current
mkdir local-repository/test_repository1/metadata/previous
cp test_repository1/metadata/root.json local-repository/test_repository1/metadata/current/root.json
