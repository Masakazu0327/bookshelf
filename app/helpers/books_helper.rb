module BooksHelper
  def show_book_image(book)
    if book.image.attached?
      image_tag book.image.variant(resize: "300x300"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail"
    end
  end
  def show_book_small_image(book)
    if book&.image&.attached?
      image_tag book.image.variant(resize: "50x50"), class: "img-thumbnail"
    else
      image_tag "no_image.png", class: "img-thumbnail", width: 50
    end
  end
end
