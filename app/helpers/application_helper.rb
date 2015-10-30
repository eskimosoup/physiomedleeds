module ApplicationHelper

  def branch_classes(branch)
    classes = []
    classes << "active"  if @current_branch && @current_branch.name == branch.name
    classes << "red" if %w( injury injuries ).include?(branch.name.downcase)
    classes.compact.join(" ")
  end
end
