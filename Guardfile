group :god_is_watching, halt_on_fail: true do
  guard :rspec, cmd: 'bundle exec rspec -f html -o ./tmp/spec_results.html' do
    watch('spec/spec_helper.rb')                        { 'spec' }
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$}) do |m|
      "spec/lib/#{m[1]}_spec.rb"
    end
  end

  guard :reek do
    watch('.reek')
    watch(/^lib\/.*\.rb$/)
  end

  guard :bundler do
    watch('Gemfile')
    watch(/^.+\.gemspec$/)
  end

  guard :rubocop do
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
  end

  guard 'bundler_audit', run_on_start: true do
    watch('Gemfile.lock')
  end
end
