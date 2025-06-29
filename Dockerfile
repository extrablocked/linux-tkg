FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm git base-devel ncurses openssl bc flex bison fakeroot zstd libelf cpio perl tar xz xmlto kmod inetutils

# Clone linux-tkg
WORKDIR /build
RUN git clone https://github.com/Frogging-Family/linux-tkg.git

# Copy in user configuration if present
COPY customize.cfg /build/linux-tkg/customize.cfg

WORKDIR /build/linux-tkg
RUN makepkg -si --noconfirm || true
