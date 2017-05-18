class DepTestClass
  using Travis::Feierabend::Deprecations

  def obsolete_method
    1
  end

  deprecate :obsolete_method
end

class ReplaceTestClass
  using Travis::Feierabend::Deprecations

  def cool_new_behavior
    42
  end

  replace_method :obsolete_method, :cool_new_behavior
end


describe Travis::Feierabend::Deprecations do

  let(:test_deprecate_class) { DepTestClass.new }
  let(:test_replace_class) { ReplaceTestClass.new }

  it 'warns about an obsolete method' do
    expect(test_deprecate_class).to receive(:warn).with("[DEPRECATION] 'obsolete_method' is deprecated.")
    expect(test_deprecate_class.obsolete_method).to eq 1
  end

  it 'replaces a method' do
    expect(test_replace_class).to receive(:warn).with("[DEPRECATION] 'obsolete_method' is no longer availible. Using 'cool_new_behavior' instead.")
    expect(test_replace_class.obsolete_method).to eq 42
  end

end
