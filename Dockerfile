FROM docker.io/library/debian:bookworm-slim

ARG GODOT_VERSION=4.4-dev3

RUN apt-get update

RUN apt-get -y install \
    curl \
    unzip \
    libfontconfig

RUN curl \
    "https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_linux.x86_64.zip" \
    -L -o godot.zip

RUN curl \
    "https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_export_templates.tpz" \
    -L -o export_templates.tpz

RUN mkdir -p ~/.config/godot

RUN unzip godot.zip && mv Godot_v${GODOT_VERSION}_linux.x86_64 /usr/local/bin/godot && chmod +x /usr/local/bin/godot

RUN unzip export_templates.tpz
RUN mkdir -p ~/.local/share/godot/export_templates/${GODOT_VERSION}/
RUN mv templates/* ~/.local/share/godot/export_templates/${GODOT_VERSION}/