import tuf.client.updater

image_name = "my_repo/image1"

tuf.settings.repositories_directory = 'local-repository'

# MultiRepoUpdater implements Artemis by supporting multiple repositories
# The repository map file and targets map file are passed in
updater = tuf.client.updater.MultiRepoUpdater('map', 'targets_mapping.json')

info = updater.get_valid_targetinfo(image_name)

up1 = updater.get_updater("registry")
up2 = updater.get_updater("test_repository1")

if up1 in info:
    up1.download_target(info[up1], "downloaded_targets")
elif up2 in info:
    up2.download_target(info[up2], "downloaded_targets")
