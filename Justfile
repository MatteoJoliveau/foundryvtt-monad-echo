FOUNDRY_DATA := "./foundryData"
SYSTEM_DATA := FOUNDRY_DATA / "Data/systems/monad-echo"

default:
  @just --list --unsorted | grep -v "    default"

foundry: _data-path
  foundryvtt --noupnp --noupdate --adminPassword=monadecho --dataPath={{ FOUNDRY_DATA }}

_data-path:
  mkdir -p {{ FOUNDRY_DATA }}

link-system-folder:
  rm -f {{ SYSTEM_DATA }}
  ln -s $PWD/public/system.json $PWD/src/system.json
  ln -s $PWD/public/template.json $PWD/src/template.json
  ln -s $PWD/src {{ SYSTEM_DATA }} 
