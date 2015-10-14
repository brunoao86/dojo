# http://dojopuzzles.com/problemas/exibe/um-mundo-pequeno/

class World

  def initialize(friends)
    raise ArgumentError, 'It expects an Array!' unless friends.instance_of? Array
    raise ArgumentError, 'It expects 4 or more points!' if friends.length < 4
    raise ArgumentError, 'Repeated points are not allowed!' if friends.length != friends.uniq.length
    @friends = friends
  end

  def compute_3_closest_friends
    return @closest_friends unless @closest_friends.nil?
    group_friends
    compute_distances
    @closest_friends = Hash.new
    @grouped_friends.each do |person|
      @closest_friends[person[0]] = person[2].each_with_index.min(3).map { |elem| [person[1][elem[1]],elem[0]] }
    end
    @closest_friends
  end

  private
  def group_friends
    @grouped_friends ||= @friends.map { |p| p = [p] << @friends.select { |elem| !elem.equal?(p) } }
  end

  def compute_distances
    @grouped_friends.each do |person|
      person[2] = []
      person[1].each do |friend|
        person[2] << Math.hypot(person[0][0]-friend[0], person[0][1]-friend[1])
      end
    end
    @grouped_friends
  end

end

