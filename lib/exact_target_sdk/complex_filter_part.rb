module ExactTargetSDK
class ComplexFilterPart < FilterPart

  property 'LeftOperand', :required => true
  property 'LogicalOperator', :required => true
  property 'RightOperand', :required => true

end
end
