import os
import time
import subprocess
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
from datetime import datetime

REPO_PATH = r"/home/haricious/rtl-engineering-lab/rtl-engineering-lab"  # change this

class GitHandler(FileSystemEventHandler):
    last_run = 0

    def on_any_event(self, event):
        # Ignore .git changes
        if ".git" in event.src_path:
            return

        # Debounce multiple rapid events
        if time.time() - self.last_run < 30:
            return

        self.last_run = time.time()

        try:
            os.chdir(REPO_PATH)

            subprocess.run(["git", "add", "."], check=True)

            commit_msg = f"Auto commit {datetime.now():%Y-%m-%d %H:%M:%S}"

            result = subprocess.run(
                ["git", "diff", "--cached", "--quiet"]
            )

            # No changes staged
            if result.returncode == 0:
                return

            subprocess.run(
                ["git", "commit", "-m", commit_msg],
                check=True
            )

            subprocess.run(
                ["git", "push"],
                check=True
            )

            print("Changes pushed")

        except Exception as e:
            print("Error:", e)

if __name__ == "__main__":
    observer = Observer()
    observer.schedule(GitHandler(), REPO_PATH, recursive=True)
    observer.start()

    print("Watching:", REPO_PATH)

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()

    observer.join()
