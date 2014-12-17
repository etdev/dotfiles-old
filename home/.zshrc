# ADDITIONAL PATHS
export DEV_HOME=$HOME/dev
PATH=$DEV_HOME/local/bin:$PATH

# Java
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home/
PATH=$JAVA_HOME/bin:$PATH

# Maven
export M2_HOME=/usr/share/maven
PATH=$M2_HOME/bin:$PATH
export MAVEN_OPTS="-noverify"
export MVN_HOME=/usr/local/share/apache-maven-2.2.1
PATH=$MVN_HOME/bin:$PATH

# Scala
export SCALA_HOME=$DEV_HOME/local/scala-2.9.1.final
PATH=$SCALA_HOME/bin:$PATH
export PLAY_HOME=/usr/local/Cellar/play/1.2.3
export AKKA_HOME=$DEV_HOME/local/akka-microkernel-1.1

# Android
export ANDROID_HOME=$DEV_HOME/adt-bundle-mac-x86_64/sdk/
PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

#Fish shell history search
source zsh-history-substring-search.zsh

  # bind UP and DOWN arrow keys
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down

  # bind UP and DOWN arrow keys (OSX)
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  # bind P and N for EMACS mode
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down

  # bind k and j for VI mode
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down


