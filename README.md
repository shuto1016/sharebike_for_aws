# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


<%= form_for @article, url: blogs__path do |f| %>
            <%= f.label :本文 %>
            <%= f.text_area :article, placeholder: '入力', style: 'width: 100%;height: 300px;' %>
            <%= button_tag type: "submit", class: "btn-small blue accent-3 submit-margin" do %>
              送信<i class="icon-arrow-right"></i>
              <% end %>
          <% end %>


<div class="row form">
  <div class="input-field col s10">
    <%= form_tag('/blogs', method: :post) do  %>
    <label for="textarea1">本文</label>
      <textarea name="text" id="textarea" wrap="hard" class="materialize-textarea"></textarea>
      <input class="btn-small blue accent-3 submit-margin" type="submit" value="送信">
    <%end %>
  </div>
</div>

