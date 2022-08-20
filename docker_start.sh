#!/bin/bash
set -e
set -o pipefail

rails assets:precompile
rails db:migrate
if [ "$RAILS_SEED" = true ]
then
 rails db:seed
fi
rails server -b 0.0.0.0