.PHONY: all

GENRES:=All Rock Blues Synth Jazz

PLAYLIST_DIR:=/var/lib/mpd/playlists/

PLAYLISTS:=$(addprefix $(PLAYLIST_DIR),$(addsuffix .m3u,$(GENRES)))

all: $(PLAYLISTS)

$(PLAYLIST_DIR)%.m3u:
	@if [ "$*" = "All" ]; then \
		echo "#EXTGENRE:"; \
	else \
		echo "#EXTGENRE:$*" > $@; \
	fi
	@echo "#EXTIMG:local" >> $@
	@if [ "$*" = "All" ]; then \
		mpc listall >> $@;
	else \
		mpc search genre "$*" >> $@;
	fi