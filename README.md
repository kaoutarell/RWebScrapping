# RWebScrapping

**Ruby on Rails · HTTParty · Nokogiri · PostgreSQL**

A simple Rails API-only backend that scrapes web pages for sentences containing specific keywords.  
Users can pass a website URL and a keyword, and the scraper will return matching sentences from the site’s text.

Built to demonstrate lightweight text scraping with Ruby and Rails.

---

## 🛠️ Tech Stack

![Ruby on Rails](https://img.shields.io/badge/Rails-CC0000?style=for-the-badge&logo=rubyonrails&logoColor=white)  
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)  
![HTTParty](https://img.shields.io/badge/HTTParty-FF69B4?style=for-the-badge&logo=ruby&logoColor=white)  
![Nokogiri](https://img.shields.io/badge/Nokogiri-FF4500?style=for-the-badge&logo=ruby&logoColor=white)  
![Redis](https://img.shields.io/badge/Redis-D82C20?style=for-the-badge&logo=redis&logoColor=white)  
![Sidekiq](https://img.shields.io/badge/Sidekiq-FF0000?style=for-the-badge&logo=ruby&logoColor=white)

---

## 🚀 Features

- Prompt scraper with any URL
- Search for sentences containing a given keyword (RegEx)
- Extracts **visible text only** (ignores HTML tags)
- Custom User-Agent for polite scraping
- Stores results in PostgreSQL (the database is implemented but no data is stored yet)

---

## 🧠 How It Works

1. User provides a **URL** and **keyword**.
2. Scraper fetches the page with **HTTParty**.
3. **Nokogiri** parses the HTML → extracts all text nodes.
4. Regex filters out sentences containing the keyword.
5. Matches are returned as an array (or Nil if not found).

---

## 🧪 Development Notes

- API-only Rails app (`rails new . --api -d postgresql`)
- Service class in `app/services/article_scraper.rb` handles scraping
- Nokogiri may need system libraries on MacOS M1 PRO (`brew install libxml2`)
- Extendable with Sidekiq for recurring scrapes

---

## ⚡ How to Run Locally

**Clone & Run:**

```bash
git clone https://github.com/your-username/ruby-web-scraper.git
cd ruby-web-scraper
bundle install
rails db:create db:migrate
rails s

rails c #to open rails console
scraper = ArticleScraper.new("https://example.com/")
puts scraper.scrape_for("the_word")

```
<img width="1140" height="60" alt="image" src="https://github.com/user-attachments/assets/7b1f8df5-055e-40a9-b407-3635cd53b46b" />


<hr/>
<div align="center"> Made with 💜 by the butterfly dev for learning purposes </div>
