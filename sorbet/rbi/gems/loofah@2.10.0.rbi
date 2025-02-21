# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `loofah` gem.
# Please instead update this file by running `bin/tapioca gem loofah`.

# typed: true

# == Strings and IO Objects as Input
#
# Loofah.document and Loofah.fragment accept any IO object in addition
# to accepting a string. That IO object could be a file, or a socket,
# or a StringIO, or anything that responds to +read+ and
# +close+. Which makes it particularly easy to sanitize mass
# quantities of docs.
module Loofah
  class << self
    # Shortcut for Loofah::HTML::Document.parse
    # This method accepts the same parameters as Nokogiri::HTML::Document.parse
    def document(*args, &block); end

    # Shortcut for Loofah::HTML::DocumentFragment.parse
    # This method accepts the same parameters as Nokogiri::HTML::DocumentFragment.parse
    def fragment(*args, &block); end

    # A helper to remove extraneous whitespace from text-ified HTML
    def remove_extraneous_whitespace(string); end

    # Shortcut for Loofah.document(string_or_io).scrub!(method)
    def scrub_document(string_or_io, method); end

    # Shortcut for Loofah.fragment(string_or_io).scrub!(method)
    def scrub_fragment(string_or_io, method); end

    # Shortcut for Loofah.xml_document(string_or_io).scrub!(method)
    def scrub_xml_document(string_or_io, method); end

    # Shortcut for Loofah.xml_fragment(string_or_io).scrub!(method)
    def scrub_xml_fragment(string_or_io, method); end

    # Shortcut for Loofah::XML::Document.parse
    # This method accepts the same parameters as Nokogiri::XML::Document.parse
    def xml_document(*args, &block); end

    # Shortcut for Loofah::XML::DocumentFragment.parse
    # This method accepts the same parameters as Nokogiri::XML::DocumentFragment.parse
    def xml_fragment(*args, &block); end

    private

    # remove comments that exist outside of the HTML element.
    #
    # these comments are allowed by the HTML spec:
    #
    # https://www.w3.org/TR/html401/struct/global.html#h-7.1
    #
    # but are not scrubbed by Loofah because these nodes don't meet
    # the contract that scrubbers expect of a node (e.g., it can be
    # replaced, sibling and children nodes can be created).
    def remove_comments_before_html_element(doc); end
  end
end

module Loofah::DocumentDecorator
  def initialize(*args, &block); end
end

module Loofah::Elements; end
Loofah::Elements::BLOCK_LEVEL = T.let(T.unsafe(nil), Set)

# The following elements may also be considered block-level
# elements since they may contain block-level elements
Loofah::Elements::LOOSE_BLOCK_LEVEL = T.let(T.unsafe(nil), Set)

Loofah::Elements::STRICT_BLOCK_LEVEL = T.let(T.unsafe(nil), Set)
Loofah::Elements::STRICT_BLOCK_LEVEL_HTML4 = T.let(T.unsafe(nil), Set)

# https://developer.mozilla.org/en-US/docs/Web/HTML/Block-level_elements
Loofah::Elements::STRICT_BLOCK_LEVEL_HTML5 = T.let(T.unsafe(nil), Set)

module Loofah::HTML; end
module Loofah::HTML5; end
module Loofah::HTML5::SafeList; end
Loofah::HTML5::SafeList::ACCEPTABLE_ATTRIBUTES = T.let(T.unsafe(nil), Set)

# see https://www.quackit.com/css/functions/
# omit `url` and `image` from that list
Loofah::HTML5::SafeList::ACCEPTABLE_CSS_FUNCTIONS = T.let(T.unsafe(nil), Set)

Loofah::HTML5::SafeList::ACCEPTABLE_CSS_KEYWORDS = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ACCEPTABLE_CSS_PROPERTIES = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ACCEPTABLE_ELEMENTS = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ACCEPTABLE_PROTOCOLS = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ACCEPTABLE_SVG_PROPERTIES = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ACCEPTABLE_URI_DATA_MEDIATYPES = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ALLOWED_ATTRIBUTES = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ALLOWED_CSS_FUNCTIONS = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ALLOWED_CSS_KEYWORDS = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ALLOWED_CSS_PROPERTIES = T.let(T.unsafe(nil), Set)

# subclasses may define their own versions of these constants
Loofah::HTML5::SafeList::ALLOWED_ELEMENTS = T.let(T.unsafe(nil), Set)

Loofah::HTML5::SafeList::ALLOWED_ELEMENTS_WITH_LIBXML2 = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ALLOWED_PROTOCOLS = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ALLOWED_SVG_PROPERTIES = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ALLOWED_URI_DATA_MEDIATYPES = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::ATTR_VAL_IS_URI = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::MATHML_ATTRIBUTES = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::MATHML_ELEMENTS = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::PROTOCOL_SEPARATOR = T.let(T.unsafe(nil), Regexp)
Loofah::HTML5::SafeList::SHORTHAND_CSS_PROPERTIES = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::SVG_ALLOW_LOCAL_HREF = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::SVG_ATTRIBUTES = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::SVG_ATTR_VAL_ALLOWS_REF = T.let(T.unsafe(nil), Set)
Loofah::HTML5::SafeList::SVG_ELEMENTS = T.let(T.unsafe(nil), Set)

# additional tags we should consider safe since we have libxml2 fixing up our documents.
Loofah::HTML5::SafeList::TAGS_SAFE_WITH_LIBXML2 = T.let(T.unsafe(nil), Set)

Loofah::HTML5::SafeList::VOID_ELEMENTS = T.let(T.unsafe(nil), Set)

module Loofah::HTML5::Scrub
  class << self
    def allowed_element?(element_name); end

    # libxml2 >= 2.9.2 fails to escape comments within some attributes.
    #
    # see comments about CVE-2018-8048 within the tests for more information
    def force_correct_attribute_escaping!(node); end

    # alternative implementation of the html5lib attribute scrubbing algorithm
    def scrub_attributes(node); end

    def scrub_css(style); end
    def scrub_css_attribute(node); end
  end
end

Loofah::HTML5::Scrub::CONTROL_CHARACTERS = T.let(T.unsafe(nil), Regexp)
Loofah::HTML5::Scrub::CRASS_SEMICOLON = T.let(T.unsafe(nil), Hash)
Loofah::HTML5::Scrub::CSS_IMPORTANT = T.let(T.unsafe(nil), String)
Loofah::HTML5::Scrub::CSS_KEYWORDISH = T.let(T.unsafe(nil), Regexp)
Loofah::HTML5::Scrub::CSS_PROPERTY_STRING_WITHOUT_EMBEDDED_QUOTES = T.let(T.unsafe(nil), Regexp)
Loofah::HTML5::WhiteList = Loofah::HTML5::SafeList

# Subclass of Nokogiri::HTML::Document.
#
# See Loofah::ScrubBehavior and Loofah::TextBehavior for additional methods.
class Loofah::HTML::Document < ::Nokogiri::HTML4::Document
  include ::Loofah::ScrubBehavior::Node
  include ::Loofah::DocumentDecorator
  include ::Loofah::TextBehavior

  def serialize_root; end
end

# Subclass of Nokogiri::HTML::DocumentFragment.
#
# See Loofah::ScrubBehavior and Loofah::TextBehavior for additional methods.
class Loofah::HTML::DocumentFragment < ::Nokogiri::HTML4::DocumentFragment
  include ::Loofah::TextBehavior

  # Returns the HTML markup contained by the fragment
  def serialize; end

  def serialize_root; end

  # Returns the HTML markup contained by the fragment
  def to_s; end

  class << self
    # Overridden Nokogiri::HTML::DocumentFragment
    # constructor. Applications should use Loofah.fragment to
    # parse a fragment.
    def parse(tags, encoding = T.unsafe(nil)); end
  end
end

# constants related to working around unhelpful libxml2 behavior
#
# ಠ_ಠ
module Loofah::LibxmlWorkarounds; end

# these attributes and qualifying parent tags are determined by the code at:
#
# https://git.gnome.org/browse/libxml2/tree/HTMLtree.c?h=v2.9.2#n714
#
# see comments about CVE-2018-8048 within the tests for more information
Loofah::LibxmlWorkarounds::BROKEN_ESCAPING_ATTRIBUTES = T.let(T.unsafe(nil), Set)

Loofah::LibxmlWorkarounds::BROKEN_ESCAPING_ATTRIBUTES_QUALIFYING_TAG = T.let(T.unsafe(nil), Hash)

module Loofah::MetaHelpers
  class << self
    def add_downcased_set_members_to_all_set_constants(mojule); end
  end
end

# Mixes +scrub!+ into Document, DocumentFragment, Node and NodeSet.
#
# Traverse the document or fragment, invoking the +scrubber+ on
# each node.
#
# +scrubber+ must either be one of the symbols representing the
# built-in scrubbers (see Scrubbers), or a Scrubber instance.
#
# span2div = Loofah::Scrubber.new do |node|
# node.name = "div" if node.name == "span"
# end
# Loofah.fragment("<span>foo</span><p>bar</p>").scrub!(span2div).to_s
# # => "<div>foo</div><p>bar</p>"
#
# or
#
# unsafe_html = "ohai! <div>div is safe</div> <script>but script is not</script>"
# Loofah.fragment(unsafe_html).scrub!(:strip).to_s
# # => "ohai! <div>div is safe</div> "
#
# Note that this method is called implicitly from
# Loofah.scrub_fragment and Loofah.scrub_document.
#
# Please see Scrubber for more information on implementation and traversal, and
# README.rdoc for more example usage.
module Loofah::ScrubBehavior
  class << self
    def resolve_scrubber(scrubber); end
  end
end

module Loofah::ScrubBehavior::Node
  def scrub!(scrubber); end
end

module Loofah::ScrubBehavior::NodeSet
  def scrub!(scrubber); end
end

# A Scrubber wraps up a block (or method) that is run on an HTML node (element):
#
# # change all <span> tags to <div> tags
# span2div = Loofah::Scrubber.new do |node|
# node.name = "div" if node.name == "span"
# end
#
# Alternatively, this scrubber could have been implemented as:
#
# class Span2Div < Loofah::Scrubber
# def scrub(node)
# node.name = "div" if node.name == "span"
# end
# end
# span2div = Span2Div.new
#
# This can then be run on a document:
#
# Loofah.fragment("<span>foo</span><p>bar</p>").scrub!(span2div).to_s
# # => "<div>foo</div><p>bar</p>"
#
# Scrubbers can be run on a document in either a top-down traversal (the
# default) or bottom-up. Top-down scrubbers can optionally return
# Scrubber::STOP to terminate the traversal of a subtree.
class Loofah::Scrubber
  # Options may include
  # :direction => :top_down (the default)
  # or
  # :direction => :bottom_up
  #
  # For top_down traversals, if the block returns
  # Loofah::Scrubber::STOP, then the traversal will be terminated
  # for the current node's subtree.
  #
  # Alternatively, a Scrubber may inherit from Loofah::Scrubber,
  # and implement +scrub+, which is slightly faster than using a
  # block.
  def initialize(options = T.unsafe(nil), &block); end

  # If the attribute is not set, add it
  # If the attribute is set, don't overwrite the existing value
  def append_attribute(node, attribute, value); end

  # When a scrubber is initialized, the optional block is saved as
  # :block. Note that, if no block is passed, then the +scrub+
  # method is assumed to have been implemented.
  def block; end

  # When a scrubber is initialized, the :direction may be specified
  # as :top_down (the default) or :bottom_up.
  def direction; end

  # When +new+ is not passed a block, the class may implement
  # +scrub+, which will be called for each document node.
  def scrub(node); end

  # Calling +traverse+ will cause the document to be traversed by
  # either the lambda passed to the initializer or the +scrub+
  # method, in the direction specified at +new+ time.
  def traverse(node); end

  private

  def html5lib_sanitize(node); end
  def traverse_conditionally_bottom_up(node); end
  def traverse_conditionally_top_down(node); end
end

# Top-down Scrubbers may return CONTINUE to indicate that the subtree should be traversed.
Loofah::Scrubber::CONTINUE = T.let(T.unsafe(nil), Object)

# Top-down Scrubbers may return STOP to indicate that the subtree should not be traversed.
Loofah::Scrubber::STOP = T.let(T.unsafe(nil), Object)

# A RuntimeError raised when Loofah could not find an appropriate scrubber.
class Loofah::ScrubberNotFound < ::RuntimeError; end

# Loofah provides some built-in scrubbers for sanitizing with
# HTML5lib's safelist and for accomplishing some common
# transformation tasks.
#
#
# === Loofah::Scrubbers::Strip / scrub!(:strip)
#
# +:strip+ removes unknown/unsafe tags, but leaves behind the pristine contents:
#
# unsafe_html = "ohai! <div>div is safe</div> <foo>but foo is <b>not</b></foo>"
# Loofah.fragment(unsafe_html).scrub!(:strip)
# => "ohai! <div>div is safe</div> but foo is <b>not</b>"
#
#
# === Loofah::Scrubbers::Prune / scrub!(:prune)
#
# +:prune+ removes unknown/unsafe tags and their contents (including their subtrees):
#
# unsafe_html = "ohai! <div>div is safe</div> <foo>but foo is <b>not</b></foo>"
# Loofah.fragment(unsafe_html).scrub!(:prune)
# => "ohai! <div>div is safe</div> "
#
#
# === Loofah::Scrubbers::Escape / scrub!(:escape)
#
# +:escape+ performs HTML entity escaping on the unknown/unsafe tags:
#
# unsafe_html = "ohai! <div>div is safe</div> <foo>but foo is <b>not</b></foo>"
# Loofah.fragment(unsafe_html).scrub!(:escape)
# => "ohai! <div>div is safe</div> &lt;foo&gt;but foo is &lt;b&gt;not&lt;/b&gt;&lt;/foo&gt;"
#
#
# === Loofah::Scrubbers::Whitewash / scrub!(:whitewash)
#
# +:whitewash+ removes all comments, styling and attributes in
# addition to doing markup-fixer-uppery and pruning unsafe tags. I
# like to call this "whitewashing", since it's like putting a new
# layer of paint on top of the HTML input to make it look nice.
#
# messy_markup = "ohai! <div id='foo' class='bar' style='margin: 10px'>div with attributes</div>"
# Loofah.fragment(messy_markup).scrub!(:whitewash)
# => "ohai! <div>div with attributes</div>"
#
# One use case for this scrubber is to clean up HTML that was
# cut-and-pasted from Microsoft Word into a WYSIWYG editor or a
# rich text editor. Microsoft's software is famous for injecting
# all kinds of cruft into its HTML output. Who needs that crap?
# Certainly not me.
#
#
# === Loofah::Scrubbers::NoFollow / scrub!(:nofollow)
#
# +:nofollow+ adds a rel="nofollow" attribute to all links
#
# link_farmers_markup = "ohai! <a href='http://www.myswarmysite.com/'>I like your blog post</a>"
# Loofah.fragment(link_farmers_markup).scrub!(:nofollow)
# => "ohai! <a href='http://www.myswarmysite.com/' rel="nofollow">I like your blog post</a>"
#
#
# === Loofah::Scrubbers::NoOpener / scrub!(:noopener)
#
# +:noopener+ adds a rel="noopener" attribute to all links
#
# link_farmers_markup = "ohai! <a href='http://www.myswarmysite.com/'>I like your blog post</a>"
# Loofah.fragment(link_farmers_markup).scrub!(:noopener)
# => "ohai! <a href='http://www.myswarmysite.com/' rel="noopener">I like your blog post</a>"
#
#
# === Loofah::Scrubbers::Unprintable / scrub!(:unprintable)
#
# +:unprintable+ removes unprintable Unicode characters.
#
# markup = "<p>Some text with an unprintable character at the end\u2028</p>"
# Loofah.fragment(markup).scrub!(:unprintable)
# => "<p>Some text with an unprintable character at the end</p>"
#
# You may not be able to see the unprintable character in the above example, but there is a
# U+2028 character right before the closing </p> tag. These characters can cause issues if
# the content is ever parsed by JavaScript - more information here:
#
# http://timelessrepo.com/json-isnt-a-javascript-subset
module Loofah::Scrubbers
  class << self
    # Returns an array of symbols representing the built-in scrubbers
    def scrubber_symbols; end
  end
end

# === scrub!(:escape)
#
# +:escape+ performs HTML entity escaping on the unknown/unsafe tags:
#
# unsafe_html = "ohai! <div>div is safe</div> <foo>but foo is <b>not</b></foo>"
# Loofah.fragment(unsafe_html).scrub!(:escape)
# => "ohai! <div>div is safe</div> &lt;foo&gt;but foo is &lt;b&gt;not&lt;/b&gt;&lt;/foo&gt;"
class Loofah::Scrubbers::Escape < ::Loofah::Scrubber
  def initialize; end

  def scrub(node); end
end

# A hash that maps a symbol (like +:prune+) to the appropriate Scrubber (Loofah::Scrubbers::Prune).
Loofah::Scrubbers::MAP = T.let(T.unsafe(nil), Hash)

# This class probably isn't useful publicly, but is used for #to_text's current implemention
class Loofah::Scrubbers::NewlineBlockElements < ::Loofah::Scrubber
  def initialize; end

  def scrub(node); end
end

# === scrub!(:nofollow)
#
# +:nofollow+ adds a rel="nofollow" attribute to all links
#
# link_farmers_markup = "ohai! <a href='http://www.myswarmysite.com/'>I like your blog post</a>"
# Loofah.fragment(link_farmers_markup).scrub!(:nofollow)
# => "ohai! <a href='http://www.myswarmysite.com/' rel="nofollow">I like your blog post</a>"
class Loofah::Scrubbers::NoFollow < ::Loofah::Scrubber
  def initialize; end

  def scrub(node); end
end

# === scrub!(:noopener)
#
# +:noopener+ adds a rel="noopener" attribute to all links
#
# link_farmers_markup = "ohai! <a href='http://www.myswarmysite.com/'>I like your blog post</a>"
# Loofah.fragment(link_farmers_markup).scrub!(:noopener)
# => "ohai! <a href='http://www.myswarmysite.com/' rel="noopener">I like your blog post</a>"
class Loofah::Scrubbers::NoOpener < ::Loofah::Scrubber
  def initialize; end

  def scrub(node); end
end

# === scrub!(:prune)
#
# +:prune+ removes unknown/unsafe tags and their contents (including their subtrees):
#
# unsafe_html = "ohai! <div>div is safe</div> <foo>but foo is <b>not</b></foo>"
# Loofah.fragment(unsafe_html).scrub!(:prune)
# => "ohai! <div>div is safe</div> "
class Loofah::Scrubbers::Prune < ::Loofah::Scrubber
  def initialize; end

  def scrub(node); end
end

# === scrub!(:strip)
#
# +:strip+ removes unknown/unsafe tags, but leaves behind the pristine contents:
#
# unsafe_html = "ohai! <div>div is safe</div> <foo>but foo is <b>not</b></foo>"
# Loofah.fragment(unsafe_html).scrub!(:strip)
# => "ohai! <div>div is safe</div> but foo is <b>not</b>"
class Loofah::Scrubbers::Strip < ::Loofah::Scrubber
  def initialize; end

  def scrub(node); end
end

# === scrub!(:unprintable)
#
# +:unprintable+ removes unprintable Unicode characters.
#
# markup = "<p>Some text with an unprintable character at the end\u2028</p>"
# Loofah.fragment(markup).scrub!(:unprintable)
# => "<p>Some text with an unprintable character at the end</p>"
#
# You may not be able to see the unprintable character in the above example, but there is a
# U+2028 character right before the closing </p> tag. These characters can cause issues if
# the content is ever parsed by JavaScript - more information here:
#
# http://timelessrepo.com/json-isnt-a-javascript-subset
class Loofah::Scrubbers::Unprintable < ::Loofah::Scrubber
  def initialize; end

  def scrub(node); end
end

# === scrub!(:whitewash)
#
# +:whitewash+ removes all comments, styling and attributes in
# addition to doing markup-fixer-uppery and pruning unsafe tags. I
# like to call this "whitewashing", since it's like putting a new
# layer of paint on top of the HTML input to make it look nice.
#
# messy_markup = "ohai! <div id='foo' class='bar' style='margin: 10px'>div with attributes</div>"
# Loofah.fragment(messy_markup).scrub!(:whitewash)
# => "ohai! <div>div with attributes</div>"
#
# One use case for this scrubber is to clean up HTML that was
# cut-and-pasted from Microsoft Word into a WYSIWYG editor or a
# rich text editor. Microsoft's software is famous for injecting
# all kinds of cruft into its HTML output. Who needs that crap?
# Certainly not me.
class Loofah::Scrubbers::Whitewash < ::Loofah::Scrubber
  def initialize; end

  def scrub(node); end
end

# Overrides +text+ in HTML::Document and HTML::DocumentFragment,
# and mixes in +to_text+.
module Loofah::TextBehavior
  # Returns a plain-text version of the markup contained by the document,
  # with HTML entities encoded.
  #
  # This method is significantly faster than #to_text, but isn't
  # clever about whitespace around block elements.
  #
  # Loofah.document("<h1>Title</h1><div>Content</div>").text
  # # => "TitleContent"
  #
  # By default, the returned text will have HTML entities
  # escaped. If you want unescaped entities, and you understand
  # that the result is unsafe to render in a browser, then you
  # can pass an argument as shown:
  #
  # frag = Loofah.fragment("&lt;script&gt;alert('EVIL');&lt;/script&gt;")
  # # ok for browser:
  # frag.text                                 # => "&lt;script&gt;alert('EVIL');&lt;/script&gt;"
  # # decidedly not ok for browser:
  # frag.text(:encode_special_chars => false) # => "<script>alert('EVIL');</script>"
  def inner_text(options = T.unsafe(nil)); end

  # Returns a plain-text version of the markup contained by the document,
  # with HTML entities encoded.
  #
  # This method is significantly faster than #to_text, but isn't
  # clever about whitespace around block elements.
  #
  # Loofah.document("<h1>Title</h1><div>Content</div>").text
  # # => "TitleContent"
  #
  # By default, the returned text will have HTML entities
  # escaped. If you want unescaped entities, and you understand
  # that the result is unsafe to render in a browser, then you
  # can pass an argument as shown:
  #
  # frag = Loofah.fragment("&lt;script&gt;alert('EVIL');&lt;/script&gt;")
  # # ok for browser:
  # frag.text                                 # => "&lt;script&gt;alert('EVIL');&lt;/script&gt;"
  # # decidedly not ok for browser:
  # frag.text(:encode_special_chars => false) # => "<script>alert('EVIL');</script>"
  def text(options = T.unsafe(nil)); end

  # Returns a plain-text version of the markup contained by the document,
  # with HTML entities encoded.
  #
  # This method is significantly faster than #to_text, but isn't
  # clever about whitespace around block elements.
  #
  # Loofah.document("<h1>Title</h1><div>Content</div>").text
  # # => "TitleContent"
  #
  # By default, the returned text will have HTML entities
  # escaped. If you want unescaped entities, and you understand
  # that the result is unsafe to render in a browser, then you
  # can pass an argument as shown:
  #
  # frag = Loofah.fragment("&lt;script&gt;alert('EVIL');&lt;/script&gt;")
  # # ok for browser:
  # frag.text                                 # => "&lt;script&gt;alert('EVIL');&lt;/script&gt;"
  # # decidedly not ok for browser:
  # frag.text(:encode_special_chars => false) # => "<script>alert('EVIL');</script>"
  def to_str(options = T.unsafe(nil)); end

  # Returns a plain-text version of the markup contained by the
  # fragment, with HTML entities encoded.
  #
  # This method is slower than #to_text, but is clever about
  # whitespace around block elements.
  #
  # Loofah.document("<h1>Title</h1><div>Content</div>").to_text
  # # => "\nTitle\n\nContent\n"
  def to_text(options = T.unsafe(nil)); end
end

# The version of Loofah you are using
Loofah::VERSION = T.let(T.unsafe(nil), String)

module Loofah::XML; end

# Subclass of Nokogiri::XML::Document.
#
# See Loofah::ScrubBehavior and Loofah::DocumentDecorator for additional methods.
class Loofah::XML::Document < ::Nokogiri::XML::Document
  include ::Loofah::ScrubBehavior::Node
  include ::Loofah::DocumentDecorator
end

# Subclass of Nokogiri::XML::DocumentFragment.
#
# See Loofah::ScrubBehavior for additional methods.
class Loofah::XML::DocumentFragment < ::Nokogiri::XML::DocumentFragment
  class << self
    # Overridden Nokogiri::XML::DocumentFragment
    # constructor. Applications should use Loofah.fragment to
    # parse a fragment.
    def parse(tags); end
  end
end
