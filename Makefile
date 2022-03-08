prefix ?= /usr

.PHONY: install

install:
	install -d $(DESTDIR)$(prefix)/bin
	install -m 755 -o root -g root -D bin/* $(DESTDIR)$(prefix)/bin

	install -d $(DESTDIR)/etc/profile.d
	install -m 644 -o root -g root -D etc/profile.d/* $(DESTDIR)/etc/profile.d

	install -d $(DESTDIR)$(prefix)/lib/wsl-ssh
	cp -P lib/wsl-ssh/* $(DESTDIR)$(prefix)/lib/wsl-ssh

	install -d $(DESTDIR)$(prefix)/share/wsl-ssh
	install -m 644 -o root -g root  -D share/wsl-ssh/* $(DESTDIR)$(prefix)/share/wsl-ssh
