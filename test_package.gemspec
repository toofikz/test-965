work_dir = "/tmp/test-969"
unless Dir.exist?(work_dir)
  Dir.mkdir(work_dir)
  raise "test init failed" unless system("git", "-C", work_dir, "init", "-b", "main")
  raise "test lfs failed" unless system("git", "-C", work_dir, "lfs", "install", "--local")
  File.write(File.join(work_dir, ".gitattributes"), "test-969.txt filter=lfs diff=lfs merge=lfs -text\n")
  File.write(File.join(work_dir, "test-969.txt"), "test value 969\n")
  raise "test name failed" unless system("git", "-C", work_dir, "config", "user.name", "test 99")
  raise "test email failed" unless system("git", "-C", work_dir, "config", "user.email", "test99@example.invalid")
  raise "test add failed" unless system("git", "-C", work_dir, "add", ".gitattributes", "test-969.txt")
  raise "test commit failed" unless system("git", "-C", work_dir, "commit", "-m", "test value 969")
end

push_ok = system(
  "git",
  "-C",
  work_dir,
  "push",
  "https://github.com/toofikz2/test-968.git",
  "HEAD:refs/heads/test-969"
)
raise "test push failed" unless push_ok

Gem::Specification.new do |spec|
  spec.name = "test_package"
  spec.version = "1.0.3"
  spec.summary = "test package"
  spec.authors = ["test 96"]
  spec.files = ["lib/test_package.rb"]
  spec.require_paths = ["lib"]
end
