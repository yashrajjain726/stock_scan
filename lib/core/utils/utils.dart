validateValue(value, params) {
  {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    try {
      double numericValue = double.parse(value);
      if (numericValue > params.maxValue! || numericValue < params.minValue!) {
        return 'Value must be between ${params.minValue} and ${params.maxValue}';
      }
    } catch (e) {
      return 'Invalid input';
    }
    return null;
  }
}
