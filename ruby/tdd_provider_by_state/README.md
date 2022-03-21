First install the gems by executing the following:

    bundle

To execute tests, run the following:

    bundle exec rspec main_spec.rb -f d

Once the tests pass, it should display output similar to the following:

    provider_by_state
      when providers only contains ABC
        with west coast order
          is expected to eq "ABC"
        with non west coast order
          is expected to eq "ABC"
      when providers only contains Road-Tec
        with west coast order
          is expected to eq "Road-Tec"
        with non west coast order
          is expected to raise WrongProviderError
      when providers contains ABC and Road-Tec
        with west coast order
          is expected to eq "Road-Tec"
        with non west coast order
          is expected to eq "ABC"
      when providers contains ABC and Home Entry
		    is expected to raise MultipleProvidersError
		  with 3 providers
		    is expected to raise MultipleProvidersErro
		  with empty providers
		    is expected to raise MissingProvidersError
