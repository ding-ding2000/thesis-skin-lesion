#!/usr/bin/env python3
"""在服务器上按 paper/manifest.tsv 重新下载全部论文 PDF。

用途：仓库只存文本（manifest + markdown），470MB 的 PDF 不进 git，
在新机器上跑这个脚本即可还原整个 paper/ 目录。

    python tools/fetch_papers.py              # 下载缺失的
    python tools/fetch_papers.py --check      # 只检查缺哪些，不下载
"""
import argparse
import os
import sys
import time
import urllib.request

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PAPER = os.path.join(ROOT, 'paper')
MANIFEST = os.path.join(PAPER, 'manifest.tsv')
HEADERS = {'User-Agent': 'Mozilla/5.0 (research-paper-fetch; contact: local)'}
MIN_BYTES = 50_000
SLEEP = 2.5


def load_manifest():
    if not os.path.exists(MANIFEST):
        sys.exit(f'manifest not found: {MANIFEST}')
    with open(MANIFEST, encoding='utf-8') as fh:
        header = fh.readline()
        if not header.startswith('folder\t'):
            sys.exit('manifest.tsv has an unexpected header')
        return [line.rstrip('\n').split('\t') for line in fh if line.strip()]


def fetch(arxiv_id, dest):
    url = f'https://arxiv.org/pdf/{arxiv_id}'
    req = urllib.request.Request(url, headers=HEADERS)
    with urllib.request.urlopen(req, timeout=120) as resp:
        data = resp.read()
    if not data.startswith(b'%PDF') or len(data) < MIN_BYTES:
        raise ValueError(f'not a valid pdf ({len(data)} bytes)')
    os.makedirs(os.path.dirname(dest), exist_ok=True)
    with open(dest, 'wb') as fh:
        fh.write(data)
    return len(data)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--check', action='store_true', help='only report what is missing')
    ap.add_argument('--retries', type=int, default=2)
    args = ap.parse_args()

    entries = load_manifest()
    todo = []
    for folder, filename, arxiv_id in entries:
        if len((folder, filename, arxiv_id)) != 3 or not arxiv_id:
            print(f'SKIP malformed row: {folder} / {filename}')
            continue
        dest = os.path.join(PAPER, folder, filename)
        if os.path.exists(dest) and os.path.getsize(dest) > MIN_BYTES:
            continue
        todo.append((folder, filename, arxiv_id, dest))

    print(f'manifest: {len(entries)} entries, missing: {len(todo)}')
    if args.check:
        for folder, filename, arxiv_id, _ in todo:
            print(f'  {folder}/{filename}  <- {arxiv_id}')
        return

    ok, fail = 0, []
    for i, (folder, filename, arxiv_id, dest) in enumerate(todo, 1):
        for attempt in range(args.retries + 1):
            try:
                size = fetch(arxiv_id, dest)
                ok += 1
                print(f'[{i}/{len(todo)}] OK   {folder}/{filename}  {size // 1024}KB', flush=True)
                break
            except Exception as exc:
                if attempt == args.retries:
                    fail.append((filename, str(exc)))
                    print(f'[{i}/{len(todo)}] FAIL {filename} -- {exc}', flush=True)
                else:
                    time.sleep(5 * (attempt + 1))
        time.sleep(SLEEP)

    print(f'\n=== OK {ok} / FAIL {len(fail)} of {len(todo)} ===')
    for name, err in fail:
        print(f'  {name}: {err}')
    if fail:
        sys.exit(1)


if __name__ == '__main__':
    main()
