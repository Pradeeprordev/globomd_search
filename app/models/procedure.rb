class Procedure < ApplicationRecord

  def self.search(keyword)
    self.find_by_sql([sql_query, "#{keyword}%"])
  end

  def self.sql_query
    query = <<-SQL
      SELECT title, url FROM (
        select
        'procedures',
        p.title as title,
        '/example' as url,
        'A' as sequence
       from procedures p
      union
        select
        'providers',
        concat(provider.first_name, ' ', provider.last_name) as title,
        '/example' as url,
        'B' as sequence
       from providers as provider
      union
        select
        'destinations',
        concat(destination.city, ' ', destination.country) as title,
        '/example' as url,
        'C' as sequence
        from destinations as destination
        )
      searchable
      where searchable.title ILIKE ?
      ORDER BY sequence;
    SQL
  end
end
