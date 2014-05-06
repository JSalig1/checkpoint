class CheckToComplete < ActionView::Helpers::FormBuilder
  def check_to_complete
    check_box(
      :status,
      { onchange: "this.form.submit_button.click();" },
      checked_value = "completed"
    )
  end

  def hidden_submit
    submit(
      "Update",
      id: "submit_button",
      style: "display: none"
    )
  end
end