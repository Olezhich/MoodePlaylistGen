.PHONY: all

GENRES:=Rock Blues Synth Jazz

PLAYLIST_DIR:=/var/lib/mpd/playlists/

PLAYLISTS:=$(addprefix $(PLAYLIST_DIR),$(addsuffix .m3u,$(GENRES)))

all: $(PLAYLISTS)

$(PLAYLIST_DIR)%.m3u:
	@echo "#EXTGENRE:$*" > $@
	@echo "#EXTIMG:local" >> $@
	mpc search genre "$*" >> $@