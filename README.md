# Artemis Artifacts
This repository contains the artifacts associated with the paper "Artemis: Defanging Software Supply Chain Attacks in
Multi-repository Update Systems" published in ACSAC 2023.

## Data
The data for the software update compromise analysis can be found in `Software Update Compromise Dataset.csv`.

## Runtime Testing Code

The scripts provided will set up 2 repositories and a client. These can then be used to run both TUF and Artemis verification. The runtime of `without-artemis-download.py` can then be compared to the runtime of `artemis-download.py`. The metadata downloaded can be found in `local-repository/updater` for the non-artemis run, and in the two directories `local-repository/registry` and `local-repository/test_repository1`.

To do further experiments with Artemis, the targets and repository map files in this example may be changed. Changing the contents of the repository will require changes to the `demo.py` setup script.

### Intallation
To install the requirements, run `pip install -r requirements.txt`

### Setup

#### Repository setup
To set up the repository, run: 

* `./repo_setup.sh`

#### Client setup

Then, to set up the client, set up metadata directories for each repository. To do so, run `./client_setup.sh`. Then update the keys listed in `targets_mapping.json` to use the keys generated in the repository setup. To do so find the key definition for `my_repo` in `registry/metadata/targets.json`, then copy the keyid into the appropriate location in `targets_mapping.json`. For example, the keyid for `my_repo` will be listed like:

```
 {
  "keyids":[ 
  "864cc1a1d1800f4c7ea6db41387561fdf2ed4817cb1abe7747fdb20d00538979"
   ],
   "name": "my_repo",
   "paths": [
     "my_repo/*"
   ],
   "terminating": false,
   "threshold": 1
 }
```
 and that keyid will have a public key listed like:
 
```
"864cc1a1d1800f4c7ea6db41387561fdf2ed4817cb1abe7747fdb20d00538979": {
  "keyid_hash_algorithms": [
    "sha256",
    "sha512"
  ],
  "keytype": "ed25519",
  "keyval": {
    "public": "dfe569a18434a7f362b5622b0e75e774a15cb0996d481975a9fd50957585a64f"
  },
  "scheme": "ed25519"
 }
```

Copy these values into the labeled locations in `targets_mapping.json`.

### Run without Artemis
Open 2 terminals in this directory. In the first, run:

* `cd repository`
* `python3 -m http.server 8001`

In the second, run:

* `python without-artemis-download.py`

### Run with Artemis
Open 3 terminals in this directory. The first two will be repositories, and the third will be a client. In the first (if the server is not still running from "Run without Artemis"), run:

* `cd registry`
* `python -m http.server 8001`

In the second, run:

* `cd test_repository1`
* `python -m http.server 8002`

In the third, run:

* `python artemis-download.py`
