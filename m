From: Torsten Trautwein <trautwein@bytearena.com>
Subject: Multiple CPUs/Cores
Date: Fri, 22 Dec 2006 16:22:11 +0100
Message-ID: <7502ce928e9f53d4489447be29ba098d@mail.bytearena.com>
References: <mailman.0.1166800366.6356.cpufreq@lists.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <mailman.0.1166800366.6356.cpufreq@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hello,

I just noticed that on Arch Linux (may be different with other Distributions) only the first CPU/CPU-Core is being controlled.
So I made a little addition to /etc/conf.d/cpufreq and /etc/rc.d/cpufreq.

Maybe it's helpful for someone.

/etc/conf.d/cpufreq:
--------------------
#configuration for cpufreq control

# valid governors:
#  ondemand, performance, powersave,
#  conservative, userspace
governor="ondemand"

# valid suffixes: Hz, kHz (default), MHz, GHz, THz
min_freq="1000000"
max_freq="1833000"

#number of CPUs or CPU cores
cpu_count="2"

/etc/rc.d/cpufreq:
------------------
#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/cpufreq ] && . /etc/conf.d/cpufreq

case "$1" in
  start)
    stat_busy "Setting cpufreq governing rules"

        params=""
        if [ -n $governor ]; then
                mod="cpufreq_$governor"
                modprobe $mod > /dev/null 2>&1
                params="-g $governor"
                if [ $? -eq 0 ]; then
                        if [ "$min_freq" != "" ]; then
                                params="$params -d $min_freq"
                        fi
                        if [ "$max_freq" != "" ]; then
                                params="$params -u $max_freq"
                        fi
                else
                        stat_busy "    Cannot load governor module '$governor'"
                        stat_fail
                        exit
                fi
        fi

        declare -i cpu_current=0
        if [ "$params" != "" ] && [ $cpu_count -gt 0 ] ; then
                while [ $cpu_current -lt $cpu_count ]; do
                        cpufreq-set -c $cpu_current $params
                        cpu_current=$cpu_current+1
                done
                stat_done
        else
                stat_busy "    Invalid configuration in /etc/conf.d/cpufreq"
                stat_fail
        fi
    ;;
  stop)
    # nothing to do
    ;;
  restart)
    $0 start
    ;;
  set)
    # TODO: make callable... "cpufreq set 800MHz"
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0

Regards,
Torsten Trautwein
