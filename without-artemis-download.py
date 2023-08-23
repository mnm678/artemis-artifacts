import tuf.client.updater

image_name = "my_repo/image1"

tuf.settings.repositories_directory = 'local-repository'

repository_mirrors = {'mirror1': {'url_prefix': 'http://localhost:8001',
                                    'metadata_path': 'metadata',
                                    'targets_path': 'targets',
                                    'confined_target_dirs': ['']}}

updater = tuf.client.updater.Updater('updater', repository_mirrors)

target = updater.get_one_valid_targetinfo(image_name)
updater.download_target(target, "non_art_downloaded_targets")
