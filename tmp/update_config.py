import yaml, sys

path = "/opt/ombre-brain/config.yaml"
with open(path) as f:
    cfg = yaml.safe_load(f)

cfg["dehydration"]["model"] = "gemini-2.0-flash"
cfg["dehydration"]["base_url"] = "https://generativelanguage.googleapis.com/v1beta/openai/"
cfg["dehydration"]["api_key"] = ""
cfg["dehydration"]["max_tokens"] = 4096
cfg["dehydration"]["temperature"] = 0.1

# embedding stays disabled until user sets api_key via dashboard
# cfg["embedding"]["enabled"] = False

with open(path, "w") as f:
    yaml.dump(cfg, f, allow_unicode=True, sort_keys=False)

print("Config updated OK")
with open(path) as f:
    print(f.read()[:500])
