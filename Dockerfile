# Fixed the proj version to v5 becuase that's the version that works with the https://github.com/reggieb/global_convert
# Global Convert uses Projo4rb which requires ruby >= 2.4.1 https://github.com/cfis/proj4rb/blob/master/proj4rb.gemspec#L11
# This image uses rbenv to install ruby v 2.4.1 

FROM osgeo/proj:5.0

RUN apt-get -y update
RUN apt-get -y install curl git-core python-software-properties

# Install essentials
RUN apt-get -y install build-essential
RUN apt-get install -y -q git
RUN apt-get install -y libssl-dev

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

RUN apt-get install -y libreadline-dev

# Install ruby-build
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

ENV RBENV_ROOT /usr/local/rbenv

ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install ruby version
RUN rbenv install 2.4.1 && rbenv global 2.4.1

# Install perch api dependecies - sintra-contrib is is needed for namespaces
RUN gem install northern_pike -v 0.1.0 && gem install sinatra -v 2.1.0 && gem install puma -v 5.2.1 && gem install sinatra-contrib -v 2.1.0


