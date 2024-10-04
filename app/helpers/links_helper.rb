module LinksHelper
  def render_destroy_element_link(builder, element)
    link_to_remove_association element.new_record? ? t("links.form.cancel_button") :
                                                     t("links.form.delete_button"),
                               builder, class: "delete remove-element"
  end

  def link_to_signin(options = {})
    link_to t("devise_views.menu.login_items.login"),
            user_keycloak_openid_omniauth_authorize_path, method: :post, options: options
  end

  def link_to_signup(options = {})
    # link_to t("users.signup"), new_user_registration_path, options
  end

  def link_to_verify_account
    link_to t("users.verify_account"), verification_path
  end
end
