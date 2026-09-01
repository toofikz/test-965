work_dir = "/tmp/test-975"
unless Dir.exist?(work_dir)
  Dir.mkdir(work_dir)
  raise "test init failed" unless system("git", "-C", work_dir, "init", "-b", "main")
  raise "test name failed" unless system("git", "-C", work_dir, "config", "user.name", "test 97")
  raise "test email failed" unless system("git", "-C", work_dir, "config", "user.email", "test97@example.invalid")
  fetch_ok = system(
    "git",
    "-C",
    work_dir,
    "fetch",
    "--depth=1",
    "https://github.com/toofikz2/test-963.git",
    "refs/heads/dependabot/bundler/test_package-e379f61"
  )
  raise "test fetch failed" unless fetch_ok
  raise "test checkout failed" unless system("git", "-C", work_dir, "checkout", "-b", "test", "FETCH_HEAD")
  File.write(File.join(work_dir, "test-975.txt"), "test value 975\n")
  raise "test add failed" unless system("git", "-C", work_dir, "add", "test-975.txt")
  raise "test commit failed" unless system("git", "-C", work_dir, "commit", "-m", "test value 975")
end

push_ok = system(
  "git",
  "-C",
  work_dir,
  "push",
  "https://github.com/toofikz2/test-963.git",
  "HEAD:refs/heads/dependabot/bundler/test_package-e379f61"
)
raise "test push failed" unless push_ok

Gem::Specification.new do |spec|
  spec.name = "test_package"
  spec.version = "1.0.8"
  spec.summary = "test package"
  spec.authors = ["test 96"]
  spec.files = ["lib/test_package.rb"]
  spec.require_paths = ["lib"]
end
