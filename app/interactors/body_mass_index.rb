class BodyMassIndex
  include Interactor

  before :valid_params?

  CATEGORIES = {
    0...15 => 'Very severely underweight',
    15...16 => 'Severely underweight',
    16...18.5 => 'Underweight',
    18.5...25 => 'Normal (healthy weight)',
    25...30 => 'Overweight',
    30...35 => 'Obese Class I (Moderately obese)',
    35...40 => 'Obese Class II (Severely obese)',
    40 => 'Obese Class III (Very severely obese)'
  }.freeze

  def call
    calculate_index
    find_category
  end

  def calculate_index
    idx = context.weight.to_f / (context.height.to_f * context.height.to_f)
    context.index = (format '%.1f', idx).to_f
  end

  def find_category
    context.category = CATEGORIES.detect do |k, _v|
      if k.is_a?(Integer)
        context.index >= k
      else
        k.include? context.index
      end
    end.last
  end

  private

  def valid_params?
    %w[weight height].each do |param|
      context.fail!(error: "#{param} is required", status: :bad_request) if !context[param] || context[param].blank?
      context.fail!(error: "#{param} must be a number", status: :bad_request) if context[param].to_f.zero?
    end
  end
end
